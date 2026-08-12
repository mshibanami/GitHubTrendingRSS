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

<label class="grid min-w-0 gap-0.5">
  <span class="field-label">{label}:</span>
  <span class="relative block">
    <select
      class="select-control"
      {value}
      onchange={(event) => onChange((event.currentTarget as HTMLSelectElement).value as T)}
      aria-label={label}
    >
      {#each options as option (option.key)}
        <option value={option.key}>{option.label}</option>
      {/each}
    </select>
    <ChevronDown
      class="pointer-events-none absolute top-1/2 right-2.5 size-4 -translate-y-1/2 text-brand"
      size={14}
      strokeWidth={1.8}
      aria-hidden="true"
    />
  </span>
</label>
