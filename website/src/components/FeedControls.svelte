<script lang="ts">
  import { Popover } from 'bits-ui';
  import { tick } from 'svelte';
  import { Filter, Search, X } from '@lucide/svelte';
  import type { FeedPeriod } from '../lib/feed-manifest';
  import type { SelectOption, SpokenLanguage } from '../lib/types';
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

  let searchOpen = $state(false);
  let filterOpen = $state(false);
  let searchInput = $state<HTMLInputElement | undefined>(undefined);

  let {
    selectedPeriod,
    onPeriodChange,
    selectedSpokenLanguage,
    onSpokenLanguageChange,
    searchQuery,
    onSearchQueryChange,
    hideEmptyEntries,
    onHideEmptyEntriesChange,
  } = $props<{
    selectedPeriod: FeedPeriod;
    onPeriodChange: (period: FeedPeriod) => void;
    selectedSpokenLanguage: SpokenLanguage;
    onSpokenLanguageChange: (language: SpokenLanguage) => void;
    searchQuery: string;
    onSearchQueryChange: (query: string) => void;
    hideEmptyEntries: boolean;
    onHideEmptyEntriesChange: (hide: boolean) => void;
  }>();

  async function openSearch(): Promise<void> {
    searchOpen = true;
    await tick();
    searchInput?.focus();
  }

  function clearSearchOrClose(): void {
    if (searchQuery) {
      onSearchQueryChange('');
    } else {
      searchOpen = false;
    }
  }
</script>

<section class="relative pt-[17px]" aria-label="Feed filters">
  <div class="grid max-w-[480px] grid-cols-2 gap-3 sm:gap-[18px]">
    <SelectField
      label="Period"
      value={selectedPeriod}
      options={periods}
      onChange={onPeriodChange}
    />
    <SelectField
      label="Spoken Language"
      value={selectedSpokenLanguage}
      options={spokenLanguages}
      onChange={onSpokenLanguageChange}
    />
  </div>

  <div class="mt-2 flex items-center justify-end">
    <div class="inline-flex min-w-0 flex-1 items-center justify-end gap-1.5">
      <div
        class={`flex h-[34px] min-w-0 items-center gap-2 rounded-[7px] border border-[#d7dce6] bg-white px-2 pr-2.5 text-[#394255] transition-[flex,border-color,color] duration-200 ease-[cubic-bezier(0.16,1,0.3,1)] focus-within:outline-2 focus-within:outline-offset-2 focus-within:outline-blue-300 hover:border-[#bec8dd] hover:bg-[#f5f7fc] hover:text-[#1d4ed8] motion-reduce:transition-none ${searchOpen ? 'flex-1 text-[#7d8797]' : 'shrink-0'}`}
        role={searchOpen ? 'search' : undefined}
      >
        {#if searchOpen}
          <Search class="size-base shrink-0" size={15} strokeWidth={2} aria-hidden="true" />
          <input
            id="language-search"
            class="h-full w-full min-w-0 border-0 bg-transparent p-0 text-[0.78rem] leading-none text-[#172033] outline-0 placeholder:text-[#a1a8b5] focus:outline-none"
            bind:this={searchInput}
            value={searchQuery}
            oninput={(event) =>
              onSearchQueryChange((event.currentTarget as HTMLInputElement).value)}
            aria-label="Search languages"
            placeholder="Swift, TypeScript, ..."
            onkeydown={(event) => {
              if (event.key === 'Escape') searchOpen = false;
            }}
          />
          <button
            class="inline-grid size-6 shrink-0 place-items-center rounded-[5px] border-0 bg-transparent p-0 text-[#7a8390] hover:bg-[#eef1f6] hover:text-[#172033] focus:outline-none"
            type="button"
            aria-label={searchQuery ? 'Clear search' : 'Close search'}
            onclick={clearSearchOrClose}
          >
            <X size={15} strokeWidth={2} aria-hidden="true" />
          </button>
        {:else}
          <button
            class="inline-flex h-full min-h-0 items-center gap-1.5 border-0 bg-transparent p-0 text-[0.73rem] font-semibold text-inherit hover:bg-transparent hover:text-inherit focus:outline-none max-[480px]:gap-1 max-[480px]:text-[0.69rem]"
            type="button"
            aria-expanded={searchOpen}
            aria-controls="language-search"
            onclick={openSearch}
          >
            <Search class="size-base shrink-0" size={15} strokeWidth={2} aria-hidden="true" />
            <span>Search</span>
          </button>
        {/if}
      </div>
      <Popover.Root onOpenChange={(open) => (filterOpen = open)}>
        <Popover.Trigger
          class={`inline-flex min-h-[34px] items-center gap-1.5 rounded-[7px] border border-[#d7dce6] bg-white px-2.5 text-[0.73rem] font-semibold text-[#394255] hover:border-[#bec8dd] hover:bg-[#f5f7fc] hover:text-[#1d4ed8] focus-visible:outline-2 focus-visible:outline-offset-1 focus-visible:outline-blue-300 max-[480px]:gap-1 max-[480px]:px-2 max-[480px]:text-[0.69rem] ${filterOpen ? 'border-[#bec8dd] bg-[#f5f7fc] text-[#1d4ed8]' : ''}`}
          aria-label="Filter feeds"
          aria-expanded={filterOpen}
        >
          <Filter class="size-base shrink-0" size={15} strokeWidth={2} aria-hidden="true" />
          <span>Filter</span>
        </Popover.Trigger>
        <Popover.Portal>
          <Popover.Content
            class="z-20 grid w-[min(230px,calc(100vw_-_24px))] gap-[9px] rounded-[9px] border border-[#d7dce6] bg-white p-3 shadow-[0_10px_22px_rgba(22,32,51,0.1)] data-[state=open]:animate-[popover-in_140ms_ease-out] motion-reduce:animate-none"
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
          </Popover.Content>
        </Popover.Portal>
      </Popover.Root>
    </div>
  </div>
</section>
