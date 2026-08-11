import type { FeedManifest } from './feed-manifest';

export const devPreviewFeedManifest: FeedManifest = {
  generatedAt: '1970-01-01T00:00:00Z',
  latestBuildDate: 'Local preview',
  languages: [
    'All Languages',
    'TypeScript',
    'Python',
    'JavaScript',
    'Go',
    'Rust',
    'Swift',
    'Kotlin',
    'Java',
    'C++',
    'Ruby',
  ].map((displayName) => {
    const slug = displayName === 'All Languages' ? 'all' : displayName.toLocaleLowerCase();

    return {
      displayName,
      slug,
      feeds: {
        daily: `daily/${slug}.xml`,
        weekly: `weekly/${slug}.xml`,
        monthly: `monthly/${slug}.xml`,
      },
    };
  }),
};
