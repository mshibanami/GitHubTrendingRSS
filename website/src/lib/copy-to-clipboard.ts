export async function copyToClipboard(text: string): Promise<void> {
  if (navigator.clipboard?.writeText) {
    try {
      await navigator.clipboard.writeText(text);
      return;
    } catch {
      // Fall back to the legacy API when the modern API is unavailable or denied.
    }
  }

  const textArea = document.createElement('textarea');
  textArea.value = text;
  textArea.setAttribute('readonly', '');
  textArea.style.position = 'fixed';
  textArea.style.opacity = '0';
  document.body.appendChild(textArea);
  let copied = false;

  try {
    textArea.select();
    copied = document.execCommand('copy');
  } finally {
    textArea.remove();
  }

  if (!copied) {
    throw new Error('Unable to copy text to the clipboard.');
  }
}
