<script lang="ts">
  import { Check, Copy, Rss } from '@lucide/svelte';
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
    <div class="grid grid-cols-[repeat(auto-fill,minmax(min(100%,240px),1fr))] gap-2.5">
      {#each feeds as feed (feed.language.slug)}
        {@const href = feedHref(feed.path)}
        {@const isCopied = copiedPath === feed.path && copyState === 'copied'}
        <article
          class="rounded-[10px] border border-[#e4e7ee] bg-white p-[11px_12px] shadow-[0_2px_5px_rgba(30,41,59,0.045)] transition-[box-shadow] duration-150 hover:border-[#cbd4e4] hover:shadow-[0_3px_8px_rgba(30,41,59,0.07)]"
        >
          <div class="flex min-w-0 items-center justify-between gap-2.5">
            <h2
              class="min-w-0 overflow-hidden text-[0.86rem] font-bold tracking-[-0.01em] text-ellipsis whitespace-nowrap text-[#273247]"
            >
              {feed.language.displayName}
            </h2>
            <span
              class="inline-flex shrink-0 items-center self-start rounded-full text-[0.65rem] text-[#7b8494]"
              aria-label={`${feed.entryCount} entries`}>{feed.entryCount} entries</span
            >
          </div>
          <div class="mt-[9px] flex min-w-0 items-center gap-2">
            <a
              class="inline-flex min-w-0 flex-1 items-center gap-2 overflow-hidden text-[0.73rem] leading-[1.35] whitespace-nowrap text-[#2563eb] no-underline hover:text-[#1d4ed8] hover:underline hover:underline-offset-4 focus-visible:rounded-sm focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-300 max-[480px]:text-[0.69rem]"
              {href}
              target="_blank"
              rel="noreferrer"
              title={href}
            >
              <Rss class="size-4 shrink-0" size={16} strokeWidth={2} aria-hidden="true" />
              <span class="min-w-0 overflow-hidden text-ellipsis">{href}</span>
            </a>
            <button
              class="inline-grid size-7 shrink-0 place-items-center rounded-[7px] border border-[#d7dce6] bg-white p-0 text-[#647087] hover:border-[#aabbe1] hover:bg-[#f4f7ff] hover:text-[#1d4ed8] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-300"
              type="button"
              aria-label={isCopied ? 'RSS feed URL copied' : 'Copy RSS feed URL'}
              title={isCopied ? 'Copied' : 'Copy RSS feed URL'}
              onclick={() => onCopy(feed.path)}
            >
              {#if isCopied}
                <Check size={15} strokeWidth={2} aria-hidden="true" />
              {:else}
                <Copy size={15} strokeWidth={2} aria-hidden="true" />
              {/if}
            </button>
          </div>
        </article>
      {/each}
    </div>
  {:else}
    <div
      class="rounded-[10px] border border-dashed border-[#d7dce6] bg-[#f8f9fc] px-4 py-7 text-center"
    >
      <h2 class="text-[0.9rem] font-bold text-[#172033]">No feeds found</h2>
      <p class="mt-[5px] mb-[13px] text-[0.75rem] text-[#6b7280]">
        Try a different search or turn off the 0-entry filter.
      </p>
      <button
        class="min-h-8 rounded-[7px] border border-[#d7dce6] bg-white px-2.5 text-[0.73rem] font-semibold text-[#394255] hover:border-[#b8c4dc] hover:bg-[#f6f8fd] hover:text-[#1d4ed8] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-300"
        type="button"
        onclick={onResetFilters}
      >
        Reset filters
      </button>
    </div>
  {/if}
</section>
