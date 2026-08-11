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
  class="flex w-full items-center justify-center gap-3 border-t border-white/10 bg-[#172033] py-[13px] pb-[18px]"
>
  <a
    class="inline-flex size-9 items-center justify-center rounded-md text-white no-underline hover:bg-white/10 focus-visible:rounded-sm focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-300"
    href={repositoryUrl}
    target="_blank"
    rel="noreferrer"
    aria-label="View source on GitHub"
  >
    {@html githubIcon.html.join('')}
  </a>
</footer>
