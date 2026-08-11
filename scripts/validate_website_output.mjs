import fs from 'node:fs';
import path from 'node:path';

const outputDirectory = path.resolve(process.argv[2] ?? 'website/dist');
const manifestPath = path.join(outputDirectory, 'feed-manifest.json');

if (!fs.existsSync(path.join(outputDirectory, 'index.html'))) {
  throw new Error(`Website entry point is missing: ${path.join(outputDirectory, 'index.html')}`);
}

if (!fs.existsSync(manifestPath)) {
  throw new Error(`Website feed manifest is missing: ${manifestPath}`);
}

const manifest = JSON.parse(fs.readFileSync(manifestPath, 'utf8'));
if (!Array.isArray(manifest.languages) || manifest.languages.length === 0) {
  throw new Error('Website feed manifest must contain at least one language.');
}

const feedPaths = manifest.languages.flatMap((language) => Object.values(language.feeds));
const missingPaths = feedPaths.filter((feedPath) => {
  const feedFile = path.resolve(outputDirectory, feedPath);
  const relativePath = path.relative(outputDirectory, feedFile);
  return relativePath.startsWith('..') || path.isAbsolute(relativePath) || !fs.statSync(feedFile, { throwIfNoEntry: false })?.isFile();
});

if (missingPaths.length > 0) {
  throw new Error(`Generated website is missing feed files:\n${missingPaths.join('\n')}`);
}

const developerDirectory = path.join(outputDirectory, 'developers');
const developerFeedFiles = fs.existsSync(developerDirectory)
  ? fs.readdirSync(developerDirectory, { recursive: true, withFileTypes: true })
      .filter((entry) => entry.isFile() && entry.name.endsWith('.xml'))
  : [];
if (developerFeedFiles.length === 0) {
  throw new Error('Generated website is missing developer feed files.');
}

const iconDirectory = path.join(outputDirectory, 'assets', 'icons');
if (
  !fs.existsSync(iconDirectory) ||
  !fs.readdirSync(iconDirectory).some((fileName) => fileName.endsWith('.png'))
) {
  throw new Error('Generated website is missing feed assets/icons PNG files.');
}

console.log(
  `Validated website output, ${feedPaths.length} repository feed links, ` +
    `${developerFeedFiles.length} developer feed files, and feed assets.`
);
