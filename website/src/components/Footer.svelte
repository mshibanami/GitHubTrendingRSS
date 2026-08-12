<script lang="ts">
  import { icon } from '@fortawesome/fontawesome-svg-core';
  import { faGithub } from '@fortawesome/free-brands-svg-icons';

  let { repositoryUrl } = $props<{ repositoryUrl: string }>();

  const githubIcon = icon(faGithub, {
    styles: {
      width: '28px',
      height: '28px',
    },
    attributes: {
      'aria-hidden': 'true',
      focusable: 'false',
    },
  });
</script>

<footer
  class="flex w-full items-center justify-center gap-3 border-t border-white/10 bg-header py-4"
>
  <a
    class="icon-button inline-flex size-9 border-transparent bg-transparent text-white hover:border-transparent hover:bg-white/10 hover:text-white"
    href={repositoryUrl}
    target="_blank"
    rel="noreferrer"
    aria-label="View source on GitHub"
  >
    {@html githubIcon.html.join('')}
  </a>
</footer>
