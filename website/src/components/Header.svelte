<script lang="ts">
  import { Popover } from 'bits-ui';
  import { Info } from '@lucide/svelte';
  import type { ViewKey } from '../lib/types';
  import FeedTabs from './FeedTabs.svelte';

  let { siteBase, repositoryUrl, activeView, onViewChange, updateLabel, workflowUrl } = $props<{
    siteBase: string;
    repositoryUrl: string;
    activeView: ViewKey;
    onViewChange: (view: ViewKey) => void;
    updateLabel: string;
    workflowUrl: string;
  }>();
</script>

<header
  class="sticky top-0 z-10 border-b border-white/10 bg-header/95 pt-2 text-white backdrop-blur"
>
  <div class="page-shell flex items-center justify-between gap-3">
    <a
      class="inline-flex min-w-0 items-center gap-2 text-base font-light tracking-tight text-white no-underline"
      href={siteBase}
      aria-label="GitHub Trending RSS home"
    >
      <span class="grid size-7 shrink-0 place-items-center rounded-lg bg-white p-1">
        <img
          class="block size-full"
          src={`${siteBase}img/logo.svg`}
          alt=""
          width="24"
          height="24"
        />
      </span>
      <span>GitHub Trending RSS</span>
    </a>

    <div class="relative inline-flex shrink-0 items-center gap-1.5">
      <a
        class="inline-flex min-h-5 items-center rounded-sm bg-transparent p-0 no-underline transition-opacity hover:opacity-80 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-sky-300"
        href={repositoryUrl}
        aria-label="Star mshibanami/GitHubTrendingRSS on GitHub"
      >
        <img
          class="block h-5 w-auto"
          src="https://img.shields.io/github/stars/mshibanami/GitHubTrendingRSS?style=social"
          alt="GitHub stars"
        />
      </a>
      <Popover.Root>
        <Popover.Trigger
          class="icon-button icon-button-on-dark data-[state=open]:border-white/15 data-[state=open]:bg-white/10 data-[state=open]:text-white"
          aria-label="About GitHub Trending RSS"
        >
          <Info size={16} strokeWidth={2} aria-hidden="true" />
        </Popover.Trigger>
        <Popover.Portal>
          <Popover.Content
            class="popover-panel w-72 p-3.5 text-sm leading-normal text-ink data-[state=open]:animate-popover-in motion-reduce:animate-none"
            side="bottom"
            align="end"
            sideOffset={8}
            collisionPadding={12}
          >
            <div class="grid gap-3">
              <div class="grid gap-1.5">
                <h2 class="text-base leading-tight font-extrabold text-ink">
                  GitHub Trending as RSS
                </h2>
                <p class="text-sm leading-normal text-ink-subtle">
                  This site unofficially publishes RSS feeds for GitHub's trending repositories and
                  developers. The feeds are generated once a day from <a
                    class="text-link"
                    href="https://github.com/trending">GitHub Trending</a
                  >.
                </p>
              </div>

              <p class="text-sm leading-normal text-ink-subtle">
                Choose a period and, for repository feeds, a programming language. Subscribe in your
                RSS reader instead of checking the Trending page.
              </p>

              <p class="text-sm leading-normal text-ink-subtle">
                Select a feed below to open or copy its URL.
              </p>

              <p class="border-t border-line-soft pt-3 text-sm leading-normal text-ink-subtle">
                <span>Last update: </span>
                <a
                  class="text-link font-semibold"
                  href={workflowUrl}
                  target="_blank"
                  rel="noreferrer">{updateLabel}</a
                >
              </p>

              <a
                class="text-link font-semibold"
                href={repositoryUrl}
                target="_blank"
                rel="noreferrer">View source on GitHub</a
              >
            </div>
          </Popover.Content>
        </Popover.Portal>
      </Popover.Root>
    </div>
  </div>

  <FeedTabs {activeView} {onViewChange} />
</header>
