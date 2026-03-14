import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://glotaran.org',
  // No base needed — custom domain maps to repo root.
  // output defaults to 'static', which is what we want.
});
