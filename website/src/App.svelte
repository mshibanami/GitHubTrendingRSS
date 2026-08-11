<script lang="ts">
  import type { FeedPeriod } from './lib/feed-manifest';
  import { devPreviewFeedManifest } from './lib/dev-preview-feed-manifest';
  import { copyToClipboard } from './lib/copy-to-clipboard';
  import { feedEntryCounts } from './lib/generated/feed-entry-counts';
  import { feedManifest } from './lib/generated/feed-manifest';
  import { formatRelativeUpdate } from './lib/format-relative-update';
  import type { CopyState, SpokenLanguage, ViewKey, VisibleFeed } from './lib/types';
  import FeedControls from './components/FeedControls.svelte';
  import FeedList from './components/FeedList.svelte';
  import Footer from './components/Footer.svelte';
  import Header from './components/Header.svelte';

  const siteBase = import.meta.env.BASE_URL;
  const activeManifest =
    import.meta.env.DEV && feedManifest.latestBuildDate === 'Local preview'
      ? devPreviewFeedManifest
      : feedManifest;
  const repositoryUrl = 'https://github.com/mshibanami/GitHubTrendingRSS';
  const workflowUrl =
    'https://github.com/mshibanami/GitHubTrendingRSS/actions/workflows/generate_feeds.yml';

  let activeView = $state<ViewKey>('repositories');
  let selectedPeriod = $state<FeedPeriod>('monthly');
  let selectedSpokenLanguage = $state<SpokenLanguage>('any');
  let hideEmptyEntries = $state(false);
  let searchQuery = $state('');
  let copiedPath = $state<string | null>(null);
  let copyState = $state<CopyState>('idle');
  let copyTimer: ReturnType<typeof setTimeout> | undefined;

  const visibleFeeds = $derived<ReadonlyArray<VisibleFeed>>(
    activeManifest.languages
      .map((language) => {
        const path = feedPathFor(language.slug);
        return {
          language,
          path,
          entryCount: feedEntryCounts[path] ?? 0,
        };
      })
      .filter((feed) => {
        const matchesSearch = feed.language.displayName
          .toLocaleLowerCase()
          .includes(searchQuery.trim().toLocaleLowerCase());
        const matchesEntryCount = !hideEmptyEntries || feed.entryCount > 0;
        return matchesSearch && matchesEntryCount;
      }),
  );
  const updateLabel = $derived(formatRelativeUpdate(activeManifest.generatedAt));

  function feedHref(path: string): string {
    const encodedPath = path.split('/').map(encodeURIComponent).join('/');
    return `${siteBase}${encodedPath}`;
  }

  function feedPathFor(slug: string): string {
    if (activeView === 'developers') {
      return `developers/${selectedPeriod}/${slug}.xml`;
    }

    const languagePrefix = selectedSpokenLanguage === 'en' ? 'en/' : '';
    return `${languagePrefix}${selectedPeriod}/${slug}.xml`;
  }

  async function copyFeed(path: string): Promise<void> {
    const absoluteUrl = new URL(feedHref(path), window.location.origin).href;

    try {
      await copyToClipboard(absoluteUrl);

      copiedPath = path;
      copyState = 'copied';
      if (copyTimer) clearTimeout(copyTimer);
      copyTimer = setTimeout(() => {
        copiedPath = null;
        copyState = 'idle';
      }, 1800);
    } catch {
      copiedPath = path;
      copyState = 'failed';
    }
  }

  function resetFilters(): void {
    searchQuery = '';
    hideEmptyEntries = false;
  }
</script>

<svelte:head>
  <meta
    name="description"
    content="Find and copy GitHub Trending RSS feeds by language, period, and spoken language."
  />
  <meta property="og:url" content="https://mshibanami.github.io/GitHubTrendingRSS/" />
</svelte:head>

<div class="min-h-screen bg-white font-sans text-[#172033]">
  <Header
    {siteBase}
    {repositoryUrl}
    {activeView}
    {updateLabel}
    {workflowUrl}
    onViewChange={(view) => (activeView = view)}
  />

  <main
    class="mx-auto w-[calc(100%_-_28px)] max-w-[840px] pb-[30px] max-[480px]:w-[calc(100%_-_24px)]"
  >
    <FeedControls
      {selectedPeriod}
      onPeriodChange={(period) => (selectedPeriod = period)}
      {selectedSpokenLanguage}
      onSpokenLanguageChange={(language) => (selectedSpokenLanguage = language)}
      {searchQuery}
      onSearchQueryChange={(query) => (searchQuery = query)}
      {hideEmptyEntries}
      onHideEmptyEntriesChange={(hide) => (hideEmptyEntries = hide)}
    />
    <FeedList
      feeds={visibleFeeds}
      {feedHref}
      {copiedPath}
      {copyState}
      onCopy={copyFeed}
      onResetFilters={resetFilters}
    />
  </main>

  <Footer {repositoryUrl} />
</div>
