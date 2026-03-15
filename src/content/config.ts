import { defineCollection, z } from 'astro:content';

const software = defineCollection({
  type: 'content',
  schema: z.object({
    name: z.string(),
    lang: z.enum(['python', 'r', 'java']),
    status: z.enum(['active', 'stable', 'archived']).default('active'),
    summary: z.string(),       // one-liner for cards
    version: z.string().optional(),
    pypi: z.string().url().optional(),
    cran: z.string().url().optional(),
    github: z.string().url(),
    docs: z.string().url().optional(),
    zenodo: z.string().url().optional(),
    badges: z.array(z.string()).default([]),
    order: z.number().default(99),  // display order on /ecosystem
  }),
});

const publications = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    authors: z.string(),
    journal: z.string(),
    year: z.number(),
    doi: z.string().optional(),
    bib: z.string().optional(),   // path under /public/bib/
    packages: z.array(z.string()).default([]),  // slugs of related packages
  }),
});

export const collections = { software, publications };
