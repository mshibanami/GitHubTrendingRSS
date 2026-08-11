<script lang="ts" generics="T extends string">
  import { ChevronDown } from '@lucide/svelte';
  import type { SelectOption } from '../lib/types';

  let { label, value, options, onChange } = $props<{
    label: string;
    value: T;
    options: ReadonlyArray<SelectOption<T>>;
    onChange: (value: T) => void;
  }>();
</script>

<label class="grid min-w-0 gap-1.5">
  <span
    class="text-[0.68rem] font-bold tracking-[0.04em] text-[#667085] uppercase max-[480px]:text-[0.64rem]"
    >{label}:</span
  >
  <span class="relative block">
    <select
      class="h-[34px] w-full cursor-pointer appearance-none rounded-[7px] border border-[#bfd2f7] bg-[#eef4ff] px-3 pr-[31px] text-[0.82rem] font-bold text-[#1d4ed8] shadow-[0_1px_2px_rgba(37,99,235,0.05)] transition-[border-color,background-color,box-shadow] duration-150 ease-out hover:border-[#8fb1ed] hover:bg-[#e7efff] focus-visible:border-[#5b8fe8] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-300 motion-reduce:transition-none max-[480px]:px-2.5 max-[480px]:text-[0.77rem]"
      {value}
      onchange={(event) => onChange((event.currentTarget as HTMLSelectElement).value as T)}
      aria-label={label}
    >
      {#each options as option}
        <option value={option.key}>{option.label}</option>
      {/each}
    </select>
    <ChevronDown
      class="pointer-events-none absolute top-1/2 right-2.5 size-3.5 -translate-y-1/2 text-[#2563eb]"
      size={14}
      strokeWidth={1.8}
      aria-hidden="true"
    />
  </span>
</label>
