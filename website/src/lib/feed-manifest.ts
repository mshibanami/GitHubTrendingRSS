export type FeedPeriod = 'daily' | 'weekly' | 'monthly';
export type FeedEntryCounts = Readonly<Record<string, number>>;

export interface FeedLanguage {
  displayName: string;
  slug: string;
  feeds: Record<FeedPeriod, string>;
}

export interface FeedManifest {
  generatedAt: string;
  latestBuildDate: string;
  languages: FeedLanguage[];
}
