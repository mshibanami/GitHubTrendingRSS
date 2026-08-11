import { defineConfig } from 'vite';
import { svelte } from '@sveltejs/vite-plugin-svelte';
import tailwindcss from '@tailwindcss/vite';

export default defineConfig({
  base: process.env.VITE_BASE_PATH ?? '/',
  plugins: [svelte(), tailwindcss()],
  build: {
    outDir: 'dist',
    sourcemap: true,
  },
});
