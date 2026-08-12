<script lang="ts">
  import { Check, Copy, Rss, X } from '@lucide/svelte';
  import type { CopyState, VisibleFeed } from '../lib/types';

  let { feeds, feedHref, copiedPath, copyState, onCopy, onResetFilters } = $props<{
    feeds: ReadonlyArray<VisibleFeed>;
    feedHref: (path: string) => string;
    copiedPath: string | null;
    copyState: CopyState;
    onCopy: (path: string) => void;
    onResetFilters: () => void;
  }>();
</script>

<section class="mt-2" aria-labelledby="feed-list-title">
  <h1 id="feed-list-title" class="sr-only">Available feeds</h1>
  {#if feeds.length > 0}
    <div
      class="grid grid-cols-1 gap-0 overflow-hidden rounded-lg border border-line-soft sm:grid-cols-2 sm:gap-2.5 sm:overflow-visible sm:rounded-none sm:border-0 lg:grid-cols-3"
    >
      {#each feeds as feed (feed.language.slug)}
        {@const href = feedHref(feed.path)}
        {@const isCopied = copiedPath === feed.path && copyState === 'copied'}
        {@const copyFailed = copiedPath === feed.path && copyState === 'failed'}
        <article
          class="border-b border-line-soft bg-surface p-3 last:border-b-0 sm:rounded-lg sm:border sm:border-line-soft sm:p-3 sm:transition-colors sm:hover:border-line-hover"
        >
          <div class="flex min-w-0 items-center justify-between gap-2.5">
            <h2
              class="min-w-0 overflow-hidden text-sm font-bold tracking-tight text-ellipsis whitespace-nowrap text-ink-strong"
            >
              {feed.language.displayName}
            </h2>
            <span
              class="inline-flex shrink-0 items-center self-start rounded-full text-xs text-ink-faint"
              aria-label={`${feed.entryCount} entries`}>{feed.entryCount} entries</span
            >
          </div>
          <div class="mt-2 flex min-w-0 items-center gap-2">
            <a
              class="text-link inline-flex min-w-0 flex-1 items-center gap-2 overflow-hidden text-xs leading-normal whitespace-nowrap"
              {href}
              target="_blank"
              rel="noreferrer"
              title={href}
            >
              <Rss class="size-4 shrink-0" size={16} strokeWidth={2} aria-hidden="true" />
              <span class="min-w-0 overflow-hidden text-ellipsis">{href}</span>
            </a>
            <button
              class={isCopied
                ? 'icon-button-success'
                : copyFailed
                  ? 'icon-button-error'
                  : 'icon-button'}
              type="button"
              aria-label={isCopied
                ? 'RSS feed URL copied'
                : copyFailed
                  ? 'Copy failed. Try again'
                  : 'Copy RSS feed URL'}
              title={isCopied
                ? 'Copied'
                : copyFailed
                  ? 'Copy failed — try again'
                  : 'Copy RSS feed URL'}
              onclick={() => onCopy(feed.path)}
            >
              {#if isCopied}
                <Check size={15} strokeWidth={2} aria-hidden="true" />
                <span class="text-xs">Copied</span>
              {:else if copyFailed}
                <X size={15} strokeWidth={2} aria-hidden="true" />
                <span class="text-xs">Retry</span>
              {:else}
                <Copy size={15} strokeWidth={2} aria-hidden="true" />
              {/if}
            </button>
          </div>
        </article>
      {/each}
    </div>
  {:else}
    <div class="rounded-lg border border-dashed border-line bg-surface-muted px-4 py-8 text-center">
      <h2 class="text-base font-bold text-ink">No feeds found</h2>
      <p class="mt-1.5 mb-3 text-sm text-ink-subtle">
        Try a different search or turn off the filters.
      </p>
      <button class="control-button" type="button" onclick={onResetFilters}> Reset filters </button>
    </div>
  {/if}
</section>
