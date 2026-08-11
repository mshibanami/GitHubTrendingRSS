export function formatRelativeUpdate(timestamp: string): string {
  const parsed = Date.parse(timestamp);
  if (!Number.isFinite(parsed) || parsed < 100000000000) {
    return 'local preview';
  }

  const differenceInHours = Math.max(0, Math.floor((Date.now() - parsed) / 3_600_000));
  if (differenceInHours < 1) return 'less than an hour ago';
  if (differenceInHours === 1) return '1 hour ago';
  if (differenceInHours < 24) return `${differenceInHours} hours ago`;

  const differenceInDays = Math.floor(differenceInHours / 24);
  return differenceInDays === 1 ? '1 day ago' : `${differenceInDays} days ago`;
}
