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

<section class="relative pt-4" aria-label="Feed filters">
  <div class={['grid max-w-lg gap-4', activeView === 'developers' ? 'grid-cols-1' : 'grid-cols-2']}>
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
      <div class="search-field" role="search">
        <Search class="size-4 shrink-0" size={15} strokeWidth={2} aria-hidden="true" />
        <input
          id="language-search"
          class="h-full w-full min-w-0 border-0 bg-transparent p-0 text-sm leading-none text-ink outline-0 placeholder:text-ink-faint focus:outline-none"
          value={searchQuery}
          oninput={(event) => onSearchQueryChange((event.currentTarget as HTMLInputElement).value)}
          aria-label="Search languages"
          placeholder="Swift, TypeScript, ..."
        />
      </div>
      <Popover.Root onOpenChange={(open) => (filterOpen = open)}>
        <Popover.Trigger
          class={[
            'control-button min-w-0 justify-center max-compact:gap-1 max-compact:px-2 max-compact:text-xs',
            filterOpen && 'control-button-active',
          ]}
          aria-label="Sort and filter feeds"
          aria-expanded={filterOpen}
        >
          <SlidersHorizontal class="size-4 shrink-0" size={15} strokeWidth={2} aria-hidden="true" />
          <span class="text-left text-xs leading-none">
            Sort<br />
            &amp; Filter
          </span>
        </Popover.Trigger>
        <Popover.Portal>
          <Popover.Content
            class="popover-panel grid w-72 gap-3 p-3 data-[state=open]:animate-popover-in motion-reduce:animate-none"
            side="bottom"
            align="end"
            sideOffset={8}
            collisionPadding={12}
          >
            <label class="flex items-center gap-2 text-sm font-semibold text-ink-muted">
              <input
                class="m-0 accent-brand focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-ring"
                type="checkbox"
                checked={hideEmptyEntries}
                onchange={(event) =>
                  onHideEmptyEntriesChange((event.currentTarget as HTMLInputElement).checked)}
              />
              <span>Hide feeds with 0 entries</span>
            </label>
            <div class="pt-3">
              <span class="field-label">Sort order:</span>
              <ul class="mt-1 grid gap-1" aria-label="Sort order">
                {#each sortOrders as option (option.key)}
                  {@const isSelected = sortOrder === option.key}
                  <li>
                    <button
                      class={['sort-option', isSelected && 'sort-option-selected']}
                      type="button"
                      aria-pressed={isSelected}
                      onclick={() => onSortOrderChange(option.key)}
                    >
                      <span
                        class={['sort-indicator', isSelected && 'sort-indicator-selected']}
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
