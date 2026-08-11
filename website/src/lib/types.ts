import type { FeedLanguage } from './feed-manifest';

export type ViewKey = 'repositories' | 'developers';
export type SpokenLanguage = 'any' | 'en';
export type CopyState = 'idle' | 'copied' | 'failed';
export type SelectOption<T extends string = string> = { key: T; label: string };

export interface VisibleFeed {
  language: FeedLanguage;
  path: string;
  entryCount: number;
}
