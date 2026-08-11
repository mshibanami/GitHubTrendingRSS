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
  <div
    class="relative mx-auto grid w-[calc(100%_-_28px)] max-w-[840px] grid-cols-2 overflow-hidden rounded-xl bg-white/10 p-1 max-[480px]:w-[calc(100%_-_24px)]"
  >
    <span
      class={[
        'pointer-events-none absolute inset-y-1 left-1 w-[calc(50%_-_4px)] rounded-lg bg-white shadow-[0_1px_3px_rgba(15,23,42,0.28)] transition-transform duration-200 ease-[cubic-bezier(0.16,1,0.3,1)] motion-reduce:transition-none',
        activeView === 'developers' ? 'translate-x-full' : 'translate-x-0',
      ]}
      aria-hidden="true"
    ></span>

    {#each tabs as tab}
      <button
        class={[
          'relative z-10 inline-flex items-center justify-center gap-1.5 rounded-lg border-0 bg-transparent px-2 py-1 text-[0.84rem] font-semibold transition-colors duration-200 ease-out focus-visible:outline-2 focus-visible:outline-offset-[-2px] focus-visible:outline-sky-300 motion-reduce:transition-none',
          activeView === tab.key ? 'text-[#172033]' : 'text-white/70 hover:text-white',
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
