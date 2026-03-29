import { defineConfig } from 'astro/config';

const site = process.env.SITE_URL ?? 'https://glotaran.org';

export default defineConfig({
  site,
  // output defaults to 'static', which is what we want.
});
