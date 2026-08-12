<script lang="ts">
  import { Code, UsersRound } from '@lucide/svelte';
  import type { ViewKey } from '../lib/types';

  let { activeView, onViewChange } = $props<{
    activeView: ViewKey;
    onViewChange: (view: ViewKey) => void;
  }>();

  const tabs: ReadonlyArray<{ key: ViewKey; label: string }> = [
    { key: 'repositories', label: 'Repositories' },
    { key: 'developers', label: 'Developers' },
  ];
</script>

<div
  class="relative left-1/2 w-screen -translate-x-1/2 border-b border-white/10 py-2"
  aria-label="Feed type"
  role="tablist"
>
  <div class="page-shell relative grid grid-cols-2 overflow-hidden rounded-xl bg-white/10 py-1">
    <span
      class={['tab-indicator', activeView === 'developers' ? 'translate-x-full' : 'translate-x-0']}
      aria-hidden="true"
    ></span>

    {#each tabs as tab (tab.key)}
      <button
        class={[
          'relative z-10 inline-flex items-center justify-center gap-1.5 rounded-lg border-0 bg-transparent px-2 py-1 text-sm font-semibold transition-colors duration-200 ease-out focus-visible:outline-2 focus-visible:outline-offset-[-2px] focus-visible:outline-sky-300 motion-reduce:transition-none',
          activeView === tab.key ? 'text-ink' : 'text-white/70 hover:text-white',
        ]}
        type="button"
        aria-selected={activeView === tab.key}
        role="tab"
        onclick={() => onViewChange(tab.key)}
      >
        {#if tab.key === 'repositories'}
          <Code class="size-4 shrink-0" size={16} strokeWidth={2} aria-hidden="true" />
        {:else}
          <UsersRound class="size-4 shrink-0" size={16} strokeWidth={2} aria-hidden="true" />
        {/if}
        <span>{tab.label}</span>
      </button>
    {/each}
  </div>
</div>
