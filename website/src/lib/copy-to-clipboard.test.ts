import assert from 'node:assert/strict';
import { test } from 'node:test';
import { copyToClipboard } from './copy-to-clipboard.ts';

type MockTextArea = {
  value: string;
  style: Record<string, string>;
  setAttribute: () => void;
  select: () => void;
  remove: () => void;
};

const originalNavigator = Object.getOwnPropertyDescriptor(globalThis, 'navigator');
const originalDocument = Object.getOwnPropertyDescriptor(globalThis, 'document');

function restoreGlobal(name: 'navigator' | 'document', descriptor: PropertyDescriptor | undefined) {
  if (descriptor) {
    Object.defineProperty(globalThis, name, descriptor);
  } else {
    Reflect.deleteProperty(globalThis, name);
  }
}

function restoreBrowserGlobals(): void {
  restoreGlobal('navigator', originalNavigator);
  restoreGlobal('document', originalDocument);
}

function setBrowserGlobals({
  writeText,
  execCommand,
  select = () => {},
}: {
  writeText?: () => Promise<void>;
  execCommand?: () => boolean;
  select?: () => void;
}): { getRemovedCount: () => number } {
  let removedCount = 0;
  const textArea: MockTextArea = {
    value: '',
    style: {},
    setAttribute: () => {},
    select,
    remove: () => {
      removedCount += 1;
    },
  };

  Object.defineProperty(globalThis, 'navigator', {
    configurable: true,
    value: writeText ? { clipboard: { writeText } } : {},
  });
  Object.defineProperty(globalThis, 'document', {
    configurable: true,
    value: {
      body: { appendChild: () => {} },
      createElement: () => textArea,
      execCommand: execCommand ?? (() => true),
    },
  });

  return { getRemovedCount: () => removedCount };
}

test.afterEach(restoreBrowserGlobals);

test('uses the modern clipboard API when it succeeds', async () => {
  let copiedText = '';
  const browser = setBrowserGlobals({
    writeText: async () => {
      copiedText = 'feed-url';
    },
    execCommand: () => {
      throw new Error('fallback should not run');
    },
  });

  await copyToClipboard('feed-url');

  assert.equal(copiedText, 'feed-url');
  assert.equal(browser.getRemovedCount(), 0);
});

test('falls back when the modern clipboard API rejects', async () => {
  let fallbackCalls = 0;
  const browser = setBrowserGlobals({
    writeText: async () => {
      throw new Error('permission denied');
    },
    execCommand: () => {
      fallbackCalls += 1;
      return true;
    },
  });

  await copyToClipboard('feed-url');

  assert.equal(fallbackCalls, 1);
  assert.equal(browser.getRemovedCount(), 1);
});

test('rejects when the fallback API reports failure and still cleans up', async () => {
  const browser = setBrowserGlobals({
    execCommand: () => false,
  });

  await assert.rejects(copyToClipboard('feed-url'), /Unable to copy text/);
  assert.equal(browser.getRemovedCount(), 1);
});

test('cleans up when selecting the fallback textarea throws', async () => {
  const browser = setBrowserGlobals({
    select: () => {
      throw new Error('selection failed');
    },
  });

  await assert.rejects(copyToClipboard('feed-url'), /selection failed/);
  assert.equal(browser.getRemovedCount(), 1);
});
