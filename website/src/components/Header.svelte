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
  class="sticky top-0 z-10 border-b border-white/10 bg-[#172033]/95 pt-2 text-white backdrop-blur"
>
  <div
    class="flex items-center justify-between gap-3 px-3 sm:px-[max(14px,calc((100%_-_1000px)/2))]"
  >
    <a
      class="inline-flex min-w-0 items-center gap-2 text-base font-light tracking-[-0.015em] text-white no-underline sm:gap-[9px]"
      href={siteBase}
      aria-label="GitHub Trending RSS home"
    >
      <span class="grid size-7 shrink-0 place-items-center rounded-[8px] bg-white p-1">
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
          class="block h-5 w-auto sm:h-[19px]"
          src="https://img.shields.io/github/stars/mshibanami/GitHubTrendingRSS?style=social"
          alt="GitHub stars"
        />
      </a>
      <Popover.Root>
        <Popover.Trigger
          class="inline-grid size-[30px] place-items-center rounded-md border border-transparent bg-transparent p-0 text-white/75 hover:border-white/15 hover:bg-white/10 hover:text-white focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-sky-300 data-[state=open]:border-white/15 data-[state=open]:bg-white/10 data-[state=open]:text-white"
          aria-label="About GitHub Trending RSS"
        >
          <Info size={16} strokeWidth={2} aria-hidden="true" />
        </Popover.Trigger>
        <Popover.Portal>
          <Popover.Content
            class="z-20 w-[min(280px,calc(100vw_-_28px))] rounded-[9px] border border-[#d7dce6] bg-white p-[13px_14px] text-[0.78rem] leading-[1.45] text-[#172033] shadow-[0_10px_22px_rgba(22,32,51,0.1)] data-[state=open]:animate-[popover-in_140ms_ease-out] motion-reduce:animate-none"
            side="bottom"
            align="end"
            sideOffset={8}
            collisionPadding={12}
          >
            <div class="grid gap-3">
              <div class="grid gap-1.5">
                <h2 class="text-[0.86rem] leading-tight font-extrabold text-[#172033]">
                  GitHub Trending as RSS
                </h2>
                <p class="text-[0.76rem] leading-[1.5] text-[#667085]">
                  This site publishes RSS feeds for GitHub's trending repositories and developers.
                  The feeds are generated once a day from GitHub Trending.
                </p>
              </div>

              <p class="text-[0.76rem] leading-[1.5] text-[#667085]">
                Choose a period and, for repository feeds, a programming language. Subscribe in your
                RSS reader instead of checking the Trending page.
              </p>

              <p class="text-[0.76rem] leading-[1.5] text-[#667085]">
                Select a feed below to open or copy its URL.
              </p>

              <p class="border-t border-[#edf0f5] pt-3 text-[0.76rem] leading-[1.5] text-[#667085]">
                <span>Last update: </span>
                <a
                  class="font-semibold text-[#1d4ed8] underline decoration-transparent underline-offset-2 hover:decoration-current focus-visible:rounded-sm focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-300"
                  href={workflowUrl}
                  target="_blank"
                  rel="noreferrer">{updateLabel}</a
                >
              </p>

              <a
                class="font-semibold text-[#1d4ed8] underline decoration-transparent underline-offset-2 hover:decoration-current focus-visible:rounded-sm focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-300"
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
