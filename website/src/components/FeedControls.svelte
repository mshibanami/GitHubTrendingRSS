<script lang="ts">
  import { Popover } from 'bits-ui';
  import { Check, Search, SlidersHorizontal } from '@lucide/svelte';
  import type { FeedPeriod } from '../lib/feed-manifest';
  import type { FeedSortOrder, SelectOption, SpokenLanguage, ViewKey } from '../lib/types';
  import SelectField from './SelectField.svelte';

  const periods: ReadonlyArray<SelectOption<FeedPeriod>> = [
    { key: 'daily', label: 'Daily' },
    { key: 'weekly', label: 'Weekly' },
    { key: 'monthly', label: 'Monthly' },
  ];
  const spokenLanguages: ReadonlyArray<SelectOption<SpokenLanguage>> = [
    { key: 'any', label: 'Any' },
    { key: 'en', label: 'English' },
  ];
  const sortOrders: ReadonlyArray<SelectOption<FeedSortOrder>> = [
    { key: 'alphabetical-ascending', label: 'Alphabetical (A–Z)' },
    { key: 'alphabetical-descending', label: 'Alphabetical (Z–A)' },
    { key: 'entries-descending', label: 'Entries (high to low)' },
    { key: 'entries-ascending', label: 'Entries (low to high)' },
  ];

  let filterOpen = $state(false);

  let {
    activeView,
    selectedPeriod,
    onPeriodChange,
    selectedSpokenLanguage,
    onSpokenLanguageChange,
    searchQuery,
    onSearchQueryChange,
    hideEmptyEntries,
    onHideEmptyEntriesChange,
    sortOrder,
    onSortOrderChange,
  } = $props<{
    activeView: ViewKey;
    selectedPeriod: FeedPeriod;
    onPeriodChange: (period: FeedPeriod) => void;
    selectedSpokenLanguage: SpokenLanguage;
    onSpokenLanguageChange: (language: SpokenLanguage) => void;
    searchQuery: string;
    onSearchQueryChange: (query: string) => void;
    hideEmptyEntries: boolean;
    onHideEmptyEntriesChange: (hide: boolean) => void;
    sortOrder: FeedSortOrder;
    onSortOrderChange: (order: FeedSortOrder) => void;
  }>();
</script>

<section class="relative pt-[17px]" aria-label="Feed filters">
  <div
    class={[
      'grid max-w-[480px] gap-3 sm:gap-[18px]',
      activeView === 'developers' ? 'grid-cols-1' : 'grid-cols-2',
    ]}
  >
    <SelectField
      label="Period"
      value={selectedPeriod}
      options={periods}
      onChange={onPeriodChange}
    />
    {#if activeView !== 'developers'}
      <SelectField
        label="Spoken Language"
        value={selectedSpokenLanguage}
        options={spokenLanguages}
        onChange={onSpokenLanguageChange}
      />
    {/if}
  </div>

  <div class="mt-2 flex items-center justify-end">
    <div class="inline-flex min-w-0 flex-1 items-center justify-end gap-1.5">
      <div
        class="flex h-[34px] min-w-0 flex-1 items-center gap-2 rounded-[7px] border border-[#d7dce6] bg-white px-2 pr-2.5 text-[#7d8797] focus-within:outline-2 focus-within:outline-offset-2 focus-within:outline-blue-300 hover:border-[#bec8dd] hover:bg-[#f5f7fc] hover:text-[#1d4ed8]"
        role="search"
      >
        <Search class="size-base shrink-0" size={15} strokeWidth={2} aria-hidden="true" />
        <input
          id="language-search"
          class="h-full w-full min-w-0 border-0 bg-transparent p-0 text-[0.78rem] leading-none text-[#172033] outline-0 placeholder:text-[#a1a8b5] focus:outline-none"
          value={searchQuery}
          oninput={(event) => onSearchQueryChange((event.currentTarget as HTMLInputElement).value)}
          aria-label="Search languages"
          placeholder="Swift, TypeScript, ..."
        />
      </div>
      <Popover.Root onOpenChange={(open) => (filterOpen = open)}>
        <Popover.Trigger
          class={`inline-flex min-h-[34px] items-center gap-1.5 rounded-[7px] border border-[#d7dce6] bg-white px-2.5 text-[0.73rem] font-semibold text-[#394255] hover:border-[#bec8dd] hover:bg-[#f5f7fc] hover:text-[#1d4ed8] focus-visible:outline-2 focus-visible:outline-offset-1 focus-visible:outline-blue-300 max-[480px]:gap-1 max-[480px]:px-2 max-[480px]:text-[0.69rem] ${filterOpen ? 'border-[#bec8dd] bg-[#f5f7fc] text-[#1d4ed8]' : ''}`}
          aria-label="Filter and sort feeds"
          aria-expanded={filterOpen}
        >
          <SlidersHorizontal
            class="size-base shrink-0"
            size={15}
            strokeWidth={2}
            aria-hidden="true"
          />
          <span class="text-left leading-[1.05]">
            <span class="block">Filter</span>
            <span class="block">&amp; Sort</span>
          </span>
        </Popover.Trigger>
        <Popover.Portal>
          <Popover.Content
            class="z-20 grid w-[min(290px,calc(100vw_-_24px))] gap-3 rounded-[9px] border border-[#d7dce6] bg-white p-3 shadow-[0_10px_22px_rgba(22,32,51,0.1)] data-[state=open]:animate-[popover-in_140ms_ease-out] motion-reduce:animate-none"
            side="bottom"
            align="end"
            sideOffset={8}
            collisionPadding={12}
          >
            <label class="flex items-center gap-2 text-[0.76rem] font-semibold text-[#465064]">
              <input
                class="m-0 accent-[#2563eb] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-300"
                type="checkbox"
                checked={hideEmptyEntries}
                onchange={(event) =>
                  onHideEmptyEntriesChange((event.currentTarget as HTMLInputElement).checked)}
              />
              <span>Hide feeds with 0 entries</span>
            </label>
            <div class="pt-3">
              <span class="text-[0.68rem] font-bold tracking-[0.04em] text-[#667085] uppercase"
                >Sort order:</span
              >
              <ul class="mt-1 grid gap-1" aria-label="Sort order">
                {#each sortOrders as option (option.key)}
                  {@const isSelected = sortOrder === option.key}
                  <li>
                    <button
                      class={[
                        'flex w-full items-center gap-2 rounded-[7px] border px-2.5 py-2 text-left text-[0.75rem] font-semibold focus-visible:outline-2 focus-visible:outline-offset-1 focus-visible:outline-blue-300',
                        isSelected
                          ? 'border-[#bfd2f7] bg-[#eef4ff] text-[#1d4ed8]'
                          : 'border-transparent text-[#465064] hover:border-[#d7dce6] hover:bg-[#f5f7fc] hover:text-[#1d4ed8]',
                      ]}
                      type="button"
                      aria-pressed={isSelected}
                      onclick={() => onSortOrderChange(option.key)}
                    >
                      <span
                        class={[
                          'grid size-4 shrink-0 place-items-center rounded-full border',
                          isSelected
                            ? 'border-[#2563eb] bg-[#2563eb] text-white'
                            : 'border-[#c5ccd9] bg-white text-transparent',
                        ]}
                        aria-hidden="true"
                      >
                        <Check size={11} strokeWidth={2.5} />
                      </span>
                      <span>{option.label}</span>
                    </button>
                  </li>
                {/each}
              </ul>
            </div>
          </Popover.Content>
        </Popover.Portal>
      </Popover.Root>
    </div>
  </div>
</section>
