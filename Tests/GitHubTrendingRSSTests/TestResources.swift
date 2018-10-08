// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

// swiftlint:disable line_length
// swiftlint:disable file_length

class TestResources {
    // TODO: refactor after https://bugs.swift.org/browse/SR-2866
    static let normalTopTrendingPage: String =
    """
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8">
      <link rel="dns-prefetch" href="https://assets-cdn.github.com">
      <link rel="dns-prefetch" href="https://avatars0.githubusercontent.com">
      <link rel="dns-prefetch" href="https://avatars1.githubusercontent.com">
      <link rel="dns-prefetch" href="https://avatars2.githubusercontent.com">
      <link rel="dns-prefetch" href="https://avatars3.githubusercontent.com">
      <link rel="dns-prefetch" href="https://github-cloud.s3.amazonaws.com">
      <link rel="dns-prefetch" href="https://user-images.githubusercontent.com/">



      <link crossorigin="anonymous" media="all" integrity="sha512-mjQPRAh2Y9A0sPdZzipNfPO7PT4g06mk0uZs15DbL/vsNCRGx1uRzWVzls9MJCoy2yRNjaMmEVFKJDpCui00mA==" rel="stylesheet" href="https://assets-cdn.github.com/assets/frameworks-df973073d880f28fbbae0263fb1ef62b.css" />
      <link crossorigin="anonymous" media="all" integrity="sha512-k4rXi2xAgpvXlB7r/tZ1ski3o3AWXfn7Z6hx6C/g9CcFeM5miuGB8zJFRgQW5wDKRaNQfv42R9F707X/2WqAQg==" rel="stylesheet" href="https://assets-cdn.github.com/assets/github-2b520d809bcf76c745c815d9523f0a00.css" />


      <link crossorigin="anonymous" media="all" integrity="sha512-oq9Re9Urx17JAhj6uI9tKyz1nDNmkHrfNbiaVwDNPT5gi4+7A+z+/t/VLNWg7KBXCSRi4yZiQM6Rpu4rp1PwhQ==" rel="stylesheet" href="https://assets-cdn.github.com/assets/site-0be82e42e6ce84ef34fecbf8469a45aa.css" />


      <meta name="viewport" content="width=device-width">

      <title>Trending  repositories on GitHub today · GitHub</title>
        <meta name="description" content="GitHub is where people build software. More than 28 million people use GitHub to discover, fork, and contribute to over 85 million projects.">
        <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
      <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
      <meta property="fb:app_id" content="1401488693436528">

        <meta property="og:url" content="https://github.com">
        <meta property="og:site_name" content="GitHub">
        <meta property="og:title" content="Build software better, together">
        <meta property="og:description" content="GitHub is where people build software. More than 28 million people use GitHub to discover, fork, and contribute to over 85 million projects.">
        <meta property="og:image" content="https://assets-cdn.github.com/images/modules/open_graph/github-logo.png">
        <meta property="og:image:type" content="image/png">
        <meta property="og:image:width" content="1200">
        <meta property="og:image:height" content="1200">
        <meta property="og:image" content="https://assets-cdn.github.com/images/modules/open_graph/github-mark.png">
        <meta property="og:image:type" content="image/png">
        <meta property="og:image:width" content="1200">
        <meta property="og:image:height" content="620">
        <meta property="og:image" content="https://assets-cdn.github.com/images/modules/open_graph/github-octocat.png">
        <meta property="og:image:type" content="image/png">
        <meta property="og:image:width" content="1200">
        <meta property="og:image:height" content="620">


      <link rel="assets" href="https://assets-cdn.github.com/">

      <meta name="pjax-timeout" content="1000">

      <meta name="request-id" content="D6D8:6205:7F8B3F6:BCD6A30:5BB079B8" data-pjax-transient>




      <meta name="selected-link" value="trending_repositories" data-pjax-transient>

          <meta name="google-site-verification" content="KT5gs8h0wvaagLKAVWq8bbeNwnZZK1r1XQysX3xurLU">
        <meta name="google-site-verification" content="ZzhVyEFwb7w3e0-uOTltm8Jsck2F5StVihD0exw2fsA">
        <meta name="google-site-verification" content="GXs5KoUUkNCoaAZn7wPN-t01Pywp9M3sEjnt_3_ZWPc">

      <meta name="octolytics-host" content="collector.githubapp.com" /><meta name="octolytics-app-id" content="github" /><meta name="octolytics-event-url" content="https://collector.githubapp.com/github-external/browser_event" /><meta name="octolytics-dimension-request_id" content="D6D8:6205:7F8B3F6:BCD6A30:5BB079B8" /><meta name="octolytics-dimension-region_edge" content="sea" /><meta name="octolytics-dimension-region_render" content="iad" />




        <meta name="google-analytics" content="UA-3769691-2">


    <meta class="js-ga-set" name="dimension1" content="Logged Out">





          <meta name="hostname" content="github.com">
        <meta name="user-login" content="">

          <meta name="expected-hostname" content="github.com">
        <meta name="js-proxy-site-detection-payload" content="MzFjNTNmODEzMDQ4MDk5YWZjNWM5ZDllY2YwMzZiZTYwZjNlNzBjYjRlZTk3OGRhMGEwNmE2MTM1MjljZWI2NXx7InJlbW90ZV9hZGRyZXNzIjoiMTE1LjY0LjguMTE5IiwicmVxdWVzdF9pZCI6IkQ2RDg6NjIwNTo3RjhCM0Y2OkJDRDZBMzA6NUJCMDc5QjgiLCJ0aW1lc3RhbXAiOjE1MzgyOTIxNTMsImhvc3QiOiJnaXRodWIuY29tIn0=">

        <meta name="enabled-features" content="DASHBOARD_V2_LAYOUT_OPT_IN,EXPLORE_DISCOVER_REPOSITORIES,UNIVERSE_BANNER,MARKETPLACE_PLAN_RESTRICTION_EDITOR">

      <meta name="html-safe-nonce" content="b28c73a89eebf1f70fcf72e16da80ed73c0c793e">

      <meta http-equiv="x-pjax-version" content="79a2296b1f91f35abb74b9ce5368d71b">


          <meta name="viewport" content="width=device-width">
      <link crossorigin="anonymous" media="all" integrity="sha512-oq9Re9Urx17JAhj6uI9tKyz1nDNmkHrfNbiaVwDNPT5gi4+7A+z+/t/VLNWg7KBXCSRi4yZiQM6Rpu4rp1PwhQ==" rel="stylesheet" href="https://assets-cdn.github.com/assets/site-0be82e42e6ce84ef34fecbf8469a45aa.css" />


        <link rel="canonical" href="https://github.com/trending" data-pjax-transient>


      <meta name="browser-stats-url" content="https://api.github.com/_private/browser/stats">

      <meta name="browser-errors-url" content="https://api.github.com/_private/browser/errors">

      <link rel="mask-icon" href="https://assets-cdn.github.com/pinned-octocat.svg" color="#000000">
      <link rel="icon" type="image/x-icon" class="js-site-favicon" href="https://assets-cdn.github.com/favicon.ico">

    <meta name="theme-color" content="#1e2327">



      <link rel="manifest" href="/manifest.json" crossOrigin="use-credentials">

      </head>

      <body class="logged-out env-production page-responsive min-width-0">


      <div class="position-relative js-header-wrapper ">
        <a href="#start-of-content" tabindex="1" class="px-2 py-4 bg-blue text-white show-on-focus js-skip-to-content">Skip to content</a>
        <div id="js-pjax-loader-bar" class="pjax-loader-bar"><div class="progress"></div></div>








    <header class="Header header-logged-out js-details-container Details position-relative f4 py-3" role="banner">
      <div class="container-lg d-lg-flex p-responsive">
        <div class="d-flex flex-justify-between flex-items-center">
          <a class="header-logo-invertocat my-0" href="https://github.com/" aria-label="Homepage" data-ga-click="(Logged out) Header, go to homepage, icon:logo-wordmark">
            <svg height="32" class="octicon octicon-mark-github" viewBox="0 0 16 16" version="1.1" width="32" aria-hidden="true"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"/></svg>
          </a>

              <div class="d-lg-none css-truncate css-truncate-target width-fit p-2">


              </div>

            <button class="btn-link d-lg-none mt-1 js-details-target" type="button" aria-label="Toggle navigation" aria-expanded="false">
              <svg height="24" class="octicon octicon-three-bars text-white" viewBox="0 0 12 16" version="1.1" width="18" aria-hidden="true"><path fill-rule="evenodd" d="M11.41 9H.59C0 9 0 8.59 0 8c0-.59 0-1 .59-1H11.4c.59 0 .59.41.59 1 0 .59 0 1-.59 1h.01zm0-4H.59C0 5 0 4.59 0 4c0-.59 0-1 .59-1H11.4c.59 0 .59.41.59 1 0 .59 0 1-.59 1h.01zM.59 11H11.4c.59 0 .59.41.59 1 0 .59 0 1-.59 1H.59C0 13 0 12.59 0 12c0-.59 0-1 .59-1z"/></svg>
            </button>
        </div>

        <div class="HeaderMenu d-lg-flex flex-justify-between flex-auto">
            <nav class="mt-3 mt-lg-0">
              <ul class="d-lg-flex list-style-none">
                  <li class="ml-lg-2">
                    <a class="js-selected-navigation-item HeaderNavlink px-0 py-3 py-lg-2 m-0" data-ga-click="Header, click, Nav menu - item:features" data-selected-links="/features /features/project-management /features/code-review /features/project-management /features/integrations /features" href="/features">
                      Features
    </a>              </li>
                  <li class="ml-lg-4">
                    <a class="js-selected-navigation-item HeaderNavlink px-0 py-3 py-lg-2 m-0" data-ga-click="Header, click, Nav menu - item:business" data-selected-links="/business /business/security /business/customers /business" href="/business">
                      Business
    </a>              </li>

                  <li class="ml-lg-4">
                    <a class="js-selected-navigation-item selected HeaderNavlink px-0 py-3 py-lg-2 m-0" data-ga-click="Header, click, Nav menu - item:explore" data-selected-links="/explore /trending /trending/developers /integrations /integrations/feature/code /integrations/feature/collaborate /integrations/feature/ship showcases showcases_search showcases_landing /explore" href="/explore">
                      Explore
    </a>              </li>

                  <li class="ml-lg-4">
                        <a class="js-selected-navigation-item HeaderNavlink px-0 py-3 py-lg-2 m-0" data-ga-click="Header, click, Nav menu - item:marketplace" data-selected-links=" /marketplace" href="/marketplace">
                          Marketplace
    </a>              </li>
                  <li class="ml-lg-4">
                    <a class="js-selected-navigation-item HeaderNavlink px-0 py-3 py-lg-2 m-0" data-ga-click="Header, click, Nav menu - item:pricing" data-selected-links="/pricing /pricing/developer /pricing/team /pricing/business-hosted /pricing/business-enterprise /pricing" href="/pricing">
                      Pricing
    </a>              </li>
              </ul>
            </nav>

          <div class="d-lg-flex">
              <div class="d-lg-flex flex-items-center mr-lg-3">
                <div class="header-search   js-site-search position-relative js-jump-to"
      role="combobox"
      aria-owns="jump-to-results"
      aria-label="Search or jump to"
      aria-haspopup="listbox"
      aria-expanded="false"
    >
      <div class="position-relative">
        <!-- '"` --><!-- </textarea></xmp> --></option></form><form class="js-site-search-form" data-unscoped-search-url="/search" action="/search" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="&#x2713;" />
          <label class="form-control header-search-wrapper header-search-wrapper-jump-to position-relative d-flex flex-justify-between flex-items-center js-chromeless-input-container">
            <input type="text"
              class="form-control header-search-input jump-to-field js-jump-to-field js-site-search-focus "
              data-hotkey="s,/"
              name="q"
              value=""
              placeholder="Search GitHub"
              data-unscoped-placeholder="Search GitHub"
              data-scoped-placeholder="Search"
              autocapitalize="off"
              aria-autocomplete="list"
              aria-controls="jump-to-results"
              data-jump-to-suggestions-path="/_graphql/GetSuggestedNavigationDestinations#csrf-token=KRiQOkkGfknWIu25XIkULgFXCXnm2LBt8MVSYDGYrXxeWcaq+raswKU0eHsSM8rzfVCVkSDDkyMlIroujHY0dw=="
              spellcheck="false"
              autocomplete="off"
              >
              <input type="hidden" class="js-site-search-type-field" name="type" >
                <img src="https://assets-cdn.github.com/images/search-shortcut-hint.svg" alt="" class="mr-2 header-search-key-slash">

                <div class="Box position-absolute overflow-hidden d-none jump-to-suggestions js-jump-to-suggestions-container">
                  <ul class="d-none js-jump-to-suggestions-template-container">
                    <li class="d-flex flex-justify-start flex-items-center p-0 f5 navigation-item js-navigation-item" role="option">
                      <a tabindex="-1" class="no-underline d-flex flex-auto flex-items-center p-2 jump-to-suggestions-path js-jump-to-suggestion-path js-navigation-open" href="">
                        <div class="jump-to-octicon js-jump-to-octicon mr-2 text-center d-none">
                          <svg height="16" width="16" class="octicon octicon-repo flex-shrink-0 js-jump-to-octicon-repo d-none" title="Repository" aria-label="Repository" viewBox="0 0 12 16" version="1.1" role="img"><path fill-rule="evenodd" d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"/></svg>
                          <svg height="16" width="16" class="octicon octicon-project flex-shrink-0 js-jump-to-octicon-project d-none" title="Project" aria-label="Project" viewBox="0 0 15 16" version="1.1" role="img"><path fill-rule="evenodd" d="M10 12h3V2h-3v10zm-4-2h3V2H6v8zm-4 4h3V2H2v12zm-1 1h13V1H1v14zM14 0H1a1 1 0 0 0-1 1v14a1 1 0 0 0 1 1h13a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1z"/></svg>
                          <svg height="16" width="16" class="octicon octicon-search flex-shrink-0 js-jump-to-octicon-search d-none" title="Search" aria-label="Search" viewBox="0 0 16 16" version="1.1" role="img"><path fill-rule="evenodd" d="M15.7 13.3l-3.81-3.83A5.93 5.93 0 0 0 13 6c0-3.31-2.69-6-6-6S1 2.69 1 6s2.69 6 6 6c1.3 0 2.48-.41 3.47-1.11l3.83 3.81c.19.2.45.3.7.3.25 0 .52-.09.7-.3a.996.996 0 0 0 0-1.41v.01zM7 10.7c-2.59 0-4.7-2.11-4.7-4.7 0-2.59 2.11-4.7 4.7-4.7 2.59 0 4.7 2.11 4.7 4.7 0 2.59-2.11 4.7-4.7 4.7z"/></svg>
                        </div>

                        <img class="avatar mr-2 flex-shrink-0 js-jump-to-suggestion-avatar d-none" alt="" aria-label="Team" src="" width="28" height="28">

                        <div class="jump-to-suggestion-name js-jump-to-suggestion-name flex-auto overflow-hidden text-left no-wrap css-truncate css-truncate-target">
                        </div>

                        <div class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none js-jump-to-badge-search">
                          <span class="js-jump-to-badge-search-text-default d-none" aria-label="in all of GitHub">
                            Search
                          </span>
                          <span class="js-jump-to-badge-search-text-global d-none" aria-label="in all of GitHub">
                            All GitHub
                          </span>
                          <span aria-hidden="true" class="d-inline-block ml-1 v-align-middle">↵</span>
                        </div>

                        <div aria-hidden="true" class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none d-on-nav-focus js-jump-to-badge-jump">
                          Jump to
                          <span class="d-inline-block ml-1 v-align-middle">↵</span>
                        </div>
                      </a>
                    </li>
                  </ul>
                  <ul class="d-none js-jump-to-no-results-template-container">
                    <li class="d-flex flex-justify-center flex-items-center p-3 f5 d-none">
                      <span class="text-gray">No suggested jump to results</span>
                    </li>
                  </ul>

                  <ul id="jump-to-results" role="listbox" class="js-navigation-container jump-to-suggestions-results-container js-jump-to-suggestions-results-container" >
                    <li class="d-flex flex-justify-center flex-items-center p-0 f5">
                      <img src="https://assets-cdn.github.com/images/spinners/octocat-spinner-128.gif" alt="Octocat Spinner Icon" class="m-2" width="28">
                    </li>
                  </ul>
                </div>
          </label>
    </form>  </div>
    </div>

              </div>

            <span class="d-block d-lg-inline-block">
                <div class="HeaderNavlink px-0 py-2 m-0">
                  <a class="text-bold text-white no-underline" href="/login?return_to=%2Ftrending" data-ga-click="(Logged out) Header, clicked Sign in, text:sign-in">Sign in</a>
                    <span class="text-gray">or</span>
                    <a class="text-bold text-white no-underline" href="/join?source=header" data-ga-click="(Logged out) Header, clicked Sign up, text:sign-up">Sign up</a>
                </div>
            </span>
          </div>
        </div>
      </div>
    </header>

      </div>

      <div id="start-of-content" class="show-on-focus"></div>

        <div id="js-flash-container">


    </div>



      <div role="main" class="application-main ">

    <div class="bg-gray-light border-bottom">
      <div class="container-lg p-responsive text-center py-6">
        <h1 class="f0-light">Trending</h1>
        <p class="f4 text-gray col-md-8 mx-auto">See what the GitHub community is most excited about today.</p>
      </div>
    </div>

    <div class="explore-pjax-container container-lg p-responsive clearfix">
      <div class="gutter-md pt-6">
        <div class="col-md-9 float-md-left">
          <div class="tabnav">
            <div class="float-sm-right mb-2 mb-sm-0">
              <div class="select-menu js-menu-container js-select-menu select-menu-modal-right">
      <button class="btn btn-sm select-menu-button js-menu-target" type="button" aria-haspopup="true" aria-expanded="false">
        <i>Trending:</i>
        <span class="js-select-button">today</span>
      </button>
      <div class="select-menu-modal-holder js-menu-content js-navigation-container">
        <div class="select-menu-modal">
          <div class="select-menu-header">
            <svg class="octicon octicon-x js-menu-close" role="img" aria-label="Close" viewBox="0 0 12 16" version="1.1" width="12" height="16"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
            <span class="select-menu-title">Adjust time span</span>
          </div>

          <div class="select-menu-list" role="menu">
            <div>
              <a class="select-menu-item js-navigation-item selected" href="/trending?since=daily" data-pjax>
                <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                <span class="select-menu-item-text js-select-button-text">today</span>
              </a>
              <a class="select-menu-item js-navigation-item " href="/trending?since=weekly" data-pjax>
                <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                <span class="select-menu-item-text js-select-button-text">this week</span>
              </a>
              <a class="select-menu-item js-navigation-item " href="/trending?since=monthly" data-pjax>
                <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                <span class="select-menu-item-text js-select-button-text">this month</span>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>

            </div>
            <nav class="tabnav-tabs" data-pjax>
      <a class="js-selected-navigation-item selected tabnav-tab" data-selected-links="trending_repositories /trending" href="/trending">Repositories</a>
      <a class="js-selected-navigation-item tabnav-tab" data-selected-links="trending_developers /trending/developers" href="/trending/developers">Developers</a>
    </nav>

          </div>
            <div class="explore-content">
              <ol class="repo-list">
                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-MS-DOS">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/Microsoft/MS-DOS">
            <span class="text-normal">Microsoft / </span>MS-DOS
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2FMicrosoft%2FMS-DOS"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">
            The original sources of MS-DOS 1.25 and 2.0, for reference purposes
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#6E4C13;"></span>
            <span itemprop="programmingLanguage">
              Assembly
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/Microsoft/MS-DOS/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            3,843
          </a>

          <a class="muted-link d-inline-block mr-3" href="/Microsoft/MS-DOS/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            384
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/Microsoft/MS-DOS/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=961950" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/bitcrazed"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/961950?s=40&amp;v=4" width="20" height="20" alt="@bitcrazed" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            2,736 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-30-seconds-of-code">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/30-seconds/30-seconds-of-code">
            <span class="text-normal">30-seconds / </span>30-seconds-of-code
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2F30-seconds%2F30-seconds-of-code"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">
            Curated collection of useful Javascript snippets that you can understand in 30 seconds or less.
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#f1e05a;"></span>
            <span itemprop="programmingLanguage">
              JavaScript
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/30-seconds/30-seconds-of-code/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            23,802
          </a>

          <a class="muted-link d-inline-block mr-3" href="/30-seconds/30-seconds-of-code/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            2,393
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/30-seconds/30-seconds-of-code/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=8281875" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/Chalarangelo"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/8281875?s=40&amp;v=4" width="20" height="20" alt="@Chalarangelo" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=35068020" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/30secondsofcode"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/35068020?s=40&amp;v=4" width="20" height="20" alt="@30secondsofcode" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=25749162" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/fejes713"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/25749162?s=40&amp;v=4" width="20" height="20" alt="@fejes713" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=16862997" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/flxwu"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/16862997?s=40&amp;v=4" width="20" height="20" alt="@flxwu" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=22450188" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/atomiks"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/22450188?s=40&amp;v=4" width="20" height="20" alt="@atomiks" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            565 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-JavaGuide">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/Snailclimb/JavaGuide">
            <span class="text-normal">Snailclimb / </span>JavaGuide
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2FSnailclimb%2FJavaGuide"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">
            A core knowledge that most Java programmers need to master
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#b07219;"></span>
            <span itemprop="programmingLanguage">
              Java
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/Snailclimb/JavaGuide/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            7,158
          </a>

          <a class="muted-link d-inline-block mr-3" href="/Snailclimb/JavaGuide/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            1,793
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/Snailclimb/JavaGuide/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=29880145" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/Snailclimb"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/29880145?s=40&amp;v=4" width="20" height="20" alt="@Snailclimb" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=14312378" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/jiayangchen"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/14312378?s=40&amp;v=4" width="20" height="20" alt="@jiayangchen" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=34996463" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/zeason"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/34996463?s=40&amp;v=4" width="20" height="20" alt="@zeason" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=20039931" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/kinglaw1204"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/20039931?s=40&amp;v=4" width="20" height="20" alt="@kinglaw1204" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=23185249" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/Sortinn"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/23185249?s=40&amp;v=4" width="20" height="20" alt="@Sortinn" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            315 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-JCSprout">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/crossoverJie/JCSprout">
            <span class="text-normal">crossoverJie / </span>JCSprout
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2FcrossoverJie%2FJCSprout"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">

    <g-emoji class="g-emoji" alias="man_student" fallback-src="https://assets-cdn.github.com/images/icons/emoji/unicode/1f468-1f393.png">👨‍🎓</g-emoji> Java Core Sprout : basic, concurrent, algorithm
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#b07219;"></span>
            <span itemprop="programmingLanguage">
              Java
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/crossoverJie/JCSprout/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            14,433
          </a>

          <a class="muted-link d-inline-block mr-3" href="/crossoverJie/JCSprout/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            3,619
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/crossoverJie/JCSprout/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=15684156" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/crossoverJie"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/15684156?s=40&amp;v=4" width="20" height="20" alt="@crossoverJie" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=1152291" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/diecui1202"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/1152291?s=40&amp;v=4" width="20" height="20" alt="@diecui1202" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=1757739" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/toby1024"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/1757739?s=40&amp;v=4" width="20" height="20" alt="@toby1024" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=36260787" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/CyC2018"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/36260787?s=40&amp;v=4" width="20" height="20" alt="@CyC2018" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=2187660" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/xumeng"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/2187660?s=40&amp;v=4" width="20" height="20" alt="@xumeng" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            289 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-my-mac-os">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/nikitavoloboev/my-mac-os">
            <span class="text-normal">nikitavoloboev / </span>my-mac-os
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2Fnikitavoloboev%2Fmy-mac-os"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">
            List of applications and tools that make my macOS experience even more amazing
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#563d7c;"></span>
            <span itemprop="programmingLanguage">
              CSS
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/nikitavoloboev/my-mac-os/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            11,416
          </a>

          <a class="muted-link d-inline-block mr-3" href="/nikitavoloboev/my-mac-os/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            466
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/nikitavoloboev/my-mac-os/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=6391776" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/nikitavoloboev"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/6391776?s=40&amp;v=4" width="20" height="20" alt="@nikitavoloboev" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            275 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-os-tutorial">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/cfenollosa/os-tutorial">
            <span class="text-normal">cfenollosa / </span>os-tutorial
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2Fcfenollosa%2Fos-tutorial"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">
            How to create an OS from scratch
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#555555;"></span>
            <span itemprop="programmingLanguage">
              C
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/cfenollosa/os-tutorial/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            9,531
          </a>

          <a class="muted-link d-inline-block mr-3" href="/cfenollosa/os-tutorial/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            849
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/cfenollosa/os-tutorial/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=2249551" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/cfenollosa"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/2249551?s=40&amp;v=4" width="20" height="20" alt="@cfenollosa" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=6963409" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/Ghifari160"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/6963409?s=40&amp;v=4" width="20" height="20" alt="@Ghifari160" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=26511689" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/ariisboss"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/26511689?s=40&amp;v=4" width="20" height="20" alt="@ariisboss" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=873280" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/sapsaldog"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/873280?s=40&amp;v=4" width="20" height="20" alt="@sapsaldog" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=9648361" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/erginbilgin"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/9648361?s=40&amp;v=4" width="20" height="20" alt="@erginbilgin" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            245 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-solid">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/solid/solid">
            <span class="text-normal">solid / </span>solid
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2Fsolid%2Fsolid"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">
            Solid - Re-decentralizing the web (project directory)
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#e34c26;"></span>
            <span itemprop="programmingLanguage">
              HTML
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/solid/solid/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            2,956
          </a>

          <a class="muted-link d-inline-block mr-3" href="/solid/solid/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            104
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/solid/solid/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=947005" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/dmitrizagidulin"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/947005?s=40&amp;v=4" width="20" height="20" alt="@dmitrizagidulin" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=1424850" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/nicola"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/1424850?s=40&amp;v=4" width="20" height="20" alt="@nicola" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=346820" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/deiu"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/346820?s=40&amp;v=4" width="20" height="20" alt="@deiu" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=429987" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/csarven"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/429987?s=40&amp;v=4" width="20" height="20" alt="@csarven" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=1254848" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/timbl"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/1254848?s=40&amp;v=4" width="20" height="20" alt="@timbl" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            228 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-Python">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/TheAlgorithms/Python">
            <span class="text-normal">TheAlgorithms / </span>Python
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2FTheAlgorithms%2FPython"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">
            All Algorithms implemented in Python
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#3572A5;"></span>
            <span itemprop="programmingLanguage">
              Python
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/TheAlgorithms/Python/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            11,765
          </a>

          <a class="muted-link d-inline-block mr-3" href="/TheAlgorithms/Python/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            3,451
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/TheAlgorithms/Python/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=14276147" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/harshildarji"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/14276147?s=40&amp;v=4" width="20" height="20" alt="@harshildarji" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=14369357" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/dynamitechetan"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/14369357?s=40&amp;v=4" width="20" height="20" alt="@dynamitechetan" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=23243382" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/christianbender"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/23243382?s=40&amp;v=4" width="20" height="20" alt="@christianbender" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=17557934" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/daniel-s-ingram"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/17557934?s=40&amp;v=4" width="20" height="20" alt="@daniel-s-ingram" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=3709715" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/cclauss"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/3709715?s=40&amp;v=4" width="20" height="20" alt="@cclauss" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            209 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-awesome-algorithm">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/apachecn/awesome-algorithm">
            <span class="text-normal">apachecn / </span>awesome-algorithm
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2Fapachecn%2Fawesome-algorithm"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">
            Leetcode 题解 (跟随思路一步一步撸出代码) 及经典算法实现
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#3572A5;"></span>
            <span itemprop="programmingLanguage">
              Python
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/apachecn/awesome-algorithm/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            4,499
          </a>

          <a class="muted-link d-inline-block mr-3" href="/apachecn/awesome-algorithm/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            652
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/apachecn/awesome-algorithm/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=28261876" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/Lisanaaa"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/28261876?s=40&amp;v=4" width="20" height="20" alt="@Lisanaaa" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=9199175" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/jiangzhonglian"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/9199175?s=40&amp;v=4" width="20" height="20" alt="@jiangzhonglian" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=19797426" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/chenyyx"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/19797426?s=40&amp;v=4" width="20" height="20" alt="@chenyyx" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=14138678" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/xiaqunfeng"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/14138678?s=40&amp;v=4" width="20" height="20" alt="@xiaqunfeng" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=3709715" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/cclauss"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/3709715?s=40&amp;v=4" width="20" height="20" alt="@cclauss" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            177 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-trix">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/basecamp/trix">
            <span class="text-normal">basecamp / </span>trix
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2Fbasecamp%2Ftrix"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">
            A rich text editor for everyday writing
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#244776;"></span>
            <span itemprop="programmingLanguage">
              CoffeeScript
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/basecamp/trix/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            10,732
          </a>

          <a class="muted-link d-inline-block mr-3" href="/basecamp/trix/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            508
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/basecamp/trix/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=5355" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/javan"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/5355?s=40&amp;v=4" width="20" height="20" alt="@javan" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=2603" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/sstephenson"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/2603?s=40&amp;v=4" width="20" height="20" alt="@sstephenson" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=2018508" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/drewrygh"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/2018508?s=40&amp;v=4" width="20" height="20" alt="@drewrygh" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=438031" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/conormuirhead"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/438031?s=40&amp;v=4" width="20" height="20" alt="@conormuirhead" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=17692467" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/dctalbot"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/17692467?s=40&amp;v=4" width="20" height="20" alt="@dctalbot" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            193 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-FAutoTest">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/Tencent/FAutoTest">
            <span class="text-normal">Tencent / </span>FAutoTest
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2FTencent%2FFAutoTest"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">
            A UI automated testing framework for H5 and applets
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#3572A5;"></span>
            <span itemprop="programmingLanguage">
              Python
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/Tencent/FAutoTest/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            184
          </a>

          <a class="muted-link d-inline-block mr-3" href="/Tencent/FAutoTest/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            22
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/Tencent/FAutoTest/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=12747128" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/Chrisdimion"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/12747128?s=40&amp;v=4" width="20" height="20" alt="@Chrisdimion" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            161 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-meedu">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/Qsnh/meedu">
            <span class="text-normal">Qsnh / </span>meedu
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2FQsnh%2Fmeedu"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">
            基于Laravel开发的在线点播系统。
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#4F5D95;"></span>
            <span itemprop="programmingLanguage">
              PHP
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/Qsnh/meedu/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            182
          </a>

          <a class="muted-link d-inline-block mr-3" href="/Qsnh/meedu/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            41
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/Qsnh/meedu/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=12671205" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/Qsnh"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/12671205?s=40&amp;v=4" width="20" height="20" alt="@Qsnh" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            147 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-MMKV">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/Tencent/MMKV">
            <span class="text-normal">Tencent / </span>MMKV
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2FTencent%2FMMKV"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">
            An efficient, small mobile key-value storage framework developed by WeChat. Works on iOS and Android.
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#f34b7d;"></span>
            <span itemprop="programmingLanguage">
              C++
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/Tencent/MMKV/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            4,238
          </a>

          <a class="muted-link d-inline-block mr-3" href="/Tencent/MMKV/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            355
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/Tencent/MMKV/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=2088859" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/lingol"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/2088859?s=40&amp;v=4" width="20" height="20" alt="@lingol" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=5061845" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/zhongwuzw"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/5061845?s=40&amp;v=4" width="20" height="20" alt="@zhongwuzw" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=11873526" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/Damonvvong"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/11873526?s=40&amp;v=4" width="20" height="20" alt="@Damonvvong" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=41214833" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/jundian"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/41214833?s=40&amp;v=4" width="20" height="20" alt="@jundian" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=12974456" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/ysbing"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/12974456?s=40&amp;v=4" width="20" height="20" alt="@ysbing" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            153 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-scrcpy">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/Genymobile/scrcpy">
            <span class="text-normal">Genymobile / </span>scrcpy
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2FGenymobile%2Fscrcpy"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">
            Display and control your Android device
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#555555;"></span>
            <span itemprop="programmingLanguage">
              C
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/Genymobile/scrcpy/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            7,420
          </a>

          <a class="muted-link d-inline-block mr-3" href="/Genymobile/scrcpy/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            430
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/Genymobile/scrcpy/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=543275" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/rom1v"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/543275?s=40&amp;v=4" width="20" height="20" alt="@rom1v" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=7470459" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/CampbellOwen"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/7470459?s=40&amp;v=4" width="20" height="20" alt="@CampbellOwen" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=27065646" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/sdushantha"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/27065646?s=40&amp;v=4" width="20" height="20" alt="@sdushantha" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=5494432" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/npes87184"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/5494432?s=40&amp;v=4" width="20" height="20" alt="@npes87184" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=5956940" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/AdoPi"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/5956940?s=40&amp;v=4" width="20" height="20" alt="@AdoPi" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            153 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-seaweedfs">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/chrislusf/seaweedfs">
            <span class="text-normal">chrislusf / </span>seaweedfs
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2Fchrislusf%2Fseaweedfs"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">
            SeaweedFS is a simple and highly scalable distributed file system. There are two objectives: to store billions of files! to serve the files fast! SeaweedFS implements an object store with O(1) disk seek, and an optional Filer with POSIX interface.
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#375eab;"></span>
            <span itemprop="programmingLanguage">
              Go
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/chrislusf/seaweedfs/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            5,979
          </a>

          <a class="muted-link d-inline-block mr-3" href="/chrislusf/seaweedfs/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            824
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/chrislusf/seaweedfs/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=1543151" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/chrislusf"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/1543151?s=40&amp;v=4" width="20" height="20" alt="@chrislusf" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=866677" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/ernado"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/866677?s=40&amp;v=4" width="20" height="20" alt="@ernado" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=2162645" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/yanyiwu"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/2162645?s=40&amp;v=4" width="20" height="20" alt="@yanyiwu" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=1772562" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/tnextday"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/1772562?s=40&amp;v=4" width="20" height="20" alt="@tnextday" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=492946" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/yourchanges"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/492946?s=40&amp;v=4" width="20" height="20" alt="@yourchanges" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            140 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-remi">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/dddomodossola/remi">
            <span class="text-normal">dddomodossola / </span>remi
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2Fdddomodossola%2Fremi"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">
            Python REMote Interface library. Platform independent. In about 100 Kbytes, perfect for your diet.
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#3572A5;"></span>
            <span itemprop="programmingLanguage">
              Python
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/dddomodossola/remi/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            1,430
          </a>

          <a class="muted-link d-inline-block mr-3" href="/dddomodossola/remi/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            138
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/dddomodossola/remi/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=341675" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/dddomodossola"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/341675?s=40&amp;v=4" width="20" height="20" alt="@dddomodossola" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=41891" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/nzjrs"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/41891?s=40&amp;v=4" width="20" height="20" alt="@nzjrs" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=181758" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/cyberpro4"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/181758?s=40&amp;v=4" width="20" height="20" alt="@cyberpro4" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=1721716" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/awesomebytes"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/1721716?s=40&amp;v=4" width="20" height="20" alt="@awesomebytes" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=870849" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/mcondarelli"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/870849?s=40&amp;v=4" width="20" height="20" alt="@mcondarelli" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            138 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-Neptune">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/iqiyi/Neptune">
            <span class="text-normal">iqiyi / </span>Neptune
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2Fiqiyi%2FNeptune"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">
            A flexible, powerful and lightweight plugin framework for Android
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#b07219;"></span>
            <span itemprop="programmingLanguage">
              Java
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/iqiyi/Neptune/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            284
          </a>

          <a class="muted-link d-inline-block mr-3" href="/iqiyi/Neptune/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            22
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/iqiyi/Neptune/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=5836221" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/zjupure"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/5836221?s=40&amp;v=4" width="20" height="20" alt="@zjupure" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=4899432" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/erjanmx"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/4899432?s=40&amp;v=4" width="20" height="20" alt="@erjanmx" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=1152204" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/jwu26"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/1152204?s=40&amp;v=4" width="20" height="20" alt="@jwu26" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            125 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-tensorflow">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/tensorflow/tensorflow">
            <span class="text-normal">tensorflow / </span>tensorflow
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2Ftensorflow%2Ftensorflow"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">
            An Open Source Machine Learning Framework for Everyone
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#f34b7d;"></span>
            <span itemprop="programmingLanguage">
              C++
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/tensorflow/tensorflow/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            110,869
          </a>

          <a class="muted-link d-inline-block mr-3" href="/tensorflow/tensorflow/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            68,053
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/tensorflow/tensorflow/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=17151892" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/tensorflower-gardener"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/17151892?s=40&amp;v=4" width="20" height="20" alt="@tensorflower-gardener" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=16824702" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/caisq"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/16824702?s=40&amp;v=4" width="20" height="20" alt="@caisq" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=6969686" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/benoitsteiner"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/6969686?s=40&amp;v=4" width="20" height="20" alt="@benoitsteiner" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=463737" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/vrv"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/463737?s=40&amp;v=4" width="20" height="20" alt="@vrv" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=7946809" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/gunan"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/7946809?s=40&amp;v=4" width="20" height="20" alt="@gunan" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            106 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-mastering-modular-javascript">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/mjavascript/mastering-modular-javascript">
            <span class="text-normal">mjavascript / </span>mastering-modular-javascript
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2Fmjavascript%2Fmastering-modular-javascript"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">

    <g-emoji class="g-emoji" alias="package" fallback-src="https://assets-cdn.github.com/images/icons/emoji/unicode/1f4e6.png">📦</g-emoji> Module thinking, principles, design patterns and best practices.
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#e34c26;"></span>
            <span itemprop="programmingLanguage">
              HTML
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/mjavascript/mastering-modular-javascript/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            2,161
          </a>

          <a class="muted-link d-inline-block mr-3" href="/mjavascript/mastering-modular-javascript/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            103
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/mjavascript/mastering-modular-javascript/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=934293" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/bevacqua"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/934293?s=40&amp;v=4" width="20" height="20" alt="@bevacqua" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=29102517" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/jbillingORM"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/29102517?s=40&amp;v=4" width="20" height="20" alt="@jbillingORM" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=2521852" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/stepquick"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/2521852?s=40&amp;v=4" width="20" height="20" alt="@stepquick" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=1184262" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/nanbarber"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/1184262?s=40&amp;v=4" width="20" height="20" alt="@nanbarber" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=11261266" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/arackaf"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/11261266?s=40&amp;v=4" width="20" height="20" alt="@arackaf" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            120 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-kubespy">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/pulumi/kubespy">
            <span class="text-normal">pulumi / </span>kubespy
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2Fpulumi%2Fkubespy"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">
            Tools for observing Kubernetes resources in real time, powered by Pulumi.
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#375eab;"></span>
            <span itemprop="programmingLanguage">
              Go
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/pulumi/kubespy/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            830
          </a>

          <a class="muted-link d-inline-block mr-3" href="/pulumi/kubespy/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            25
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/pulumi/kubespy/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=1409156" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/hausdorff"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/1409156?s=40&amp;v=4" width="20" height="20" alt="@hausdorff" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=2365438" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/liftedkilt"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/2365438?s=40&amp;v=4" width="20" height="20" alt="@liftedkilt" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=3330161" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/joseph-norman"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/3330161?s=40&amp;v=4" width="20" height="20" alt="@joseph-norman" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=9477533" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/johscheuer"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/9477533?s=40&amp;v=4" width="20" height="20" alt="@johscheuer" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=791756" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/ambientsound"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/791756?s=40&amp;v=4" width="20" height="20" alt="@ambientsound" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            120 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-immer">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/mweststrate/immer">
            <span class="text-normal">mweststrate / </span>immer
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2Fmweststrate%2Fimmer"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">
            Create the next immutable state by mutating the current one
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#f1e05a;"></span>
            <span itemprop="programmingLanguage">
              JavaScript
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/mweststrate/immer/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            7,193
          </a>

          <a class="muted-link d-inline-block mr-3" href="/mweststrate/immer/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            189
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/mweststrate/immer/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=1820292" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/mweststrate"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/1820292?s=40&amp;v=4" width="20" height="20" alt="@mweststrate" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=16726491" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/Gregjarvez"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/16726491?s=40&amp;v=4" width="20" height="20" alt="@Gregjarvez" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=14368835" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/benbraou"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/14368835?s=40&amp;v=4" width="20" height="20" alt="@benbraou" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=174864" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/knpwrs"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/174864?s=40&amp;v=4" width="20" height="20" alt="@knpwrs" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=1855878" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/jkhedani"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/1855878?s=40&amp;v=4" width="20" height="20" alt="@jkhedani" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            114 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-westore">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/dntzhang/westore">
            <span class="text-normal">dntzhang / </span>westore
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2Fdntzhang%2Fwestore"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">
            世界上最小却强大的小程序框架 - 100多行代码搞定全局状态管理、跨页通讯和插件开发
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#f1e05a;"></span>
            <span itemprop="programmingLanguage">
              JavaScript
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/dntzhang/westore/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            1,323
          </a>

          <a class="muted-link d-inline-block mr-3" href="/dntzhang/westore/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            139
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/dntzhang/westore/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=7917954" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/dntzhang"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/7917954?s=40&amp;v=4" width="20" height="20" alt="@dntzhang" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=6307917" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/Rain20188"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/6307917?s=40&amp;v=4" width="20" height="20" alt="@Rain20188" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=13602053" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/cnlon"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/13602053?s=40&amp;v=4" width="20" height="20" alt="@cnlon" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            106 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-cloudnative-engineer">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/gofunct/cloudnative-engineer">
            <span class="text-normal">gofunct / </span>cloudnative-engineer
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2Fgofunct%2Fcloudnative-engineer"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
      </div>

      <div class="f6 text-gray mt-2">

          <a class="muted-link d-inline-block mr-3" href="/gofunct/cloudnative-engineer/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            143
          </a>

          <a class="muted-link d-inline-block mr-3" href="/gofunct/cloudnative-engineer/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            12
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/gofunct/cloudnative-engineer/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=42948827" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/gofunct"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/42948827?s=40&amp;v=4" width="20" height="20" alt="@gofunct" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=36118496" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/DenverLogic"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/36118496?s=40&amp;v=4" width="20" height="20" alt="@DenverLogic" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=38825998" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/colemanwordrepo"><img class="avatar mb-1" src="https://avatars3.githubusercontent.com/u/38825998?s=40&amp;v=4" width="20" height="20" alt="@colemanwordrepo" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            102 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-vue">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/vuejs/vue">
            <span class="text-normal">vuejs / </span>vue
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2Fvuejs%2Fvue"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">

    <g-emoji class="g-emoji" alias="vulcan_salute" fallback-src="https://assets-cdn.github.com/images/icons/emoji/unicode/1f596.png">🖖</g-emoji> A progressive, incrementally-adoptable JavaScript framework for building UI on the web.
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#f1e05a;"></span>
            <span itemprop="programmingLanguage">
              JavaScript
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/vuejs/vue/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            115,253
          </a>

          <a class="muted-link d-inline-block mr-3" href="/vuejs/vue/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            16,248
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/vuejs/vue/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=499550" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/yyx990803"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/499550?s=40&amp;v=4" width="20" height="20" alt="@yyx990803" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=8401776" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/Hanks10100"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/8401776?s=40&amp;v=4" width="20" height="20" alt="@Hanks10100" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=2603918" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/defcc"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/2603918?s=40&amp;v=4" width="20" height="20" alt="@defcc" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=72989" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/kazupon"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/72989?s=40&amp;v=4" width="20" height="20" alt="@kazupon" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=664177" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/posva"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/664177?s=40&amp;v=4" width="20" height="20" alt="@posva" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            96 stars today
          </span>
      </div>
    </li>

                  <li class="col-12 d-block width-full py-4 border-bottom" id="pa-vscode">
      <div class="d-inline-block col-9 mb-1">
        <h3>
          <a href="/Microsoft/vscode">
            <span class="text-normal">Microsoft / </span>vscode
    </a>    </h3>
      </div>

      <div class="float-right">
          <a href="/login?return_to=%2FMicrosoft%2Fvscode"
        class="btn btn-sm  tooltipped tooltipped-s"
        aria-label="You must be signed in to star a repository" rel="nofollow">
        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
      </a>


      </div>

      <div class="py-1">
          <p class="col-9 d-inline-block text-gray m-0 pr-4">
            Visual Studio Code
          </p>
      </div>

      <div class="f6 text-gray mt-2">
          <span class="d-inline-block mr-3">
              <span class="repo-language-color ml-0" style="background-color:#2b7489;"></span>
            <span itemprop="programmingLanguage">
              TypeScript
            </span>
          </span>

          <a class="muted-link d-inline-block mr-3" href="/Microsoft/vscode/stargazers">
            <svg aria-label="star" class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" role="img"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            60,566
          </a>

          <a class="muted-link d-inline-block mr-3" href="/Microsoft/vscode/network">
            <svg aria-label="fork" class="octicon octicon-repo-forked" viewBox="0 0 10 16" version="1.1" width="10" height="16" role="img"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            7,784
          </a>


            <span class="d-inline-block mr-3">
              Built by
              <a href="/Microsoft/vscode/graphs/contributors" class="no-underline">
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=900690" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/bpasero"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/900690?s=40&amp;v=4" width="20" height="20" alt="@bpasero" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=22350" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/joaomoreno"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/22350?s=40&amp;v=4" width="20" height="20" alt="@joaomoreno" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=1794099" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/jrieken"><img class="avatar mb-1" src="https://avatars2.githubusercontent.com/u/1794099?s=40&amp;v=4" width="20" height="20" alt="@jrieken" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=1926584" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/isidorn"><img class="avatar mb-1" src="https://avatars1.githubusercontent.com/u/1926584?s=40&amp;v=4" width="20" height="20" alt="@isidorn" /></a>
                  <a class="d-inline-block" data-hovercard-type="user" data-hovercard-url="/hovercards?user_id=5047891" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/alexandrudima"><img class="avatar mb-1" src="https://avatars0.githubusercontent.com/u/5047891?s=40&amp;v=4" width="20" height="20" alt="@alexandrudima" /></a>
              </a>
            </span>

          <span class="d-inline-block float-sm-right">
            <svg class="octicon octicon-star" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
            96 stars today
          </span>
      </div>
    </li>

              </ol>
            </div>
        </div>
        <div class="col-md-3 float-md-left mt-3 mt-md-0">
          <ul class="filter-list small" data-pjax>
      <li>
        <a class="filter-item selected" href="/trending?since=daily">All languages</a>
      </li>
      <li>
        <a class="filter-item " href="/trending/unknown?since=daily">Unknown languages</a>
      </li>
        <li>
          <a class="filter-item " href="/trending/c++?since=daily">C++</a>
        </li>
        <li>
          <a class="filter-item " href="/trending/html?since=daily">HTML</a>
        </li>
        <li>
          <a class="filter-item " href="/trending/java?since=daily">Java</a>
        </li>
        <li>
          <a class="filter-item " href="/trending/javascript?since=daily">JavaScript</a>
        </li>
        <li>
          <a class="filter-item " href="/trending/php?since=daily">PHP</a>
        </li>
        <li>
          <a class="filter-item " href="/trending/python?since=daily">Python</a>
        </li>
        <li>
          <a class="filter-item " href="/trending/ruby?since=daily">Ruby</a>
        </li>
    </ul>

    <div class="select-menu js-menu-container js-select-menu">
      <button class="btn btn-sm select-menu-button js-menu-target" type="button" aria-haspopup="true" aria-expanded="false">
        <svg class="octicon octicon-list-unordered" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M2 13c0 .59 0 1-.59 1H.59C0 14 0 13.59 0 13c0-.59 0-1 .59-1h.81c.59 0 .59.41.59 1H2zm2.59-9h6.81c.59 0 .59-.41.59-1 0-.59 0-1-.59-1H4.59C4 2 4 2.41 4 3c0 .59 0 1 .59 1zM1.41 7H.59C0 7 0 7.41 0 8c0 .59 0 1 .59 1h.81c.59 0 .59-.41.59-1 0-.59 0-1-.59-1h.01zm0-5H.59C0 2 0 2.41 0 3c0 .59 0 1 .59 1h.81c.59 0 .59-.41.59-1 0-.59 0-1-.59-1h.01zm10 5H4.59C4 7 4 7.41 4 8c0 .59 0 1 .59 1h6.81c.59 0 .59-.41.59-1 0-.59 0-1-.59-1h.01zm0 5H4.59C4 12 4 12.41 4 13c0 .59 0 1 .59 1h6.81c.59 0 .59-.41.59-1 0-.59 0-1-.59-1h.01z"/></svg>
        <i>Other:</i>
        <span class="js-select-button">Languages</span>
      </button>

      <div class="select-menu-modal-holder js-menu-content js-navigation-container">
        <div class="select-menu-modal">
          <div class="select-menu-header">
            <svg class="octicon octicon-x js-menu-close" role="img" aria-label="Close" viewBox="0 0 12 16" version="1.1" width="12" height="16"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
            <span class="select-menu-title">Other Languages</span>
          </div>

          <div class="select-menu-filters">
            <div class="select-menu-text-filter">
              <input type="text" id="text-filter-field" class="form-control js-filterable-field js-navigation-enable" placeholder="Filter Languages" aria-label="Type or choose a language">
            </div>
          </div>

          <div class="select-menu-list" data-pjax role="menu">


            <div data-filterable-for="text-filter-field" data-filterable-type="substring">
                <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/1c-enterprise?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>1C Enterprise</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/abap?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>ABAP</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/abnf?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>ABNF</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/actionscript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>ActionScript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ada?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Ada</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/adobe-font-metrics?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Adobe Font Metrics</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/agda?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Agda</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ags-script?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>AGS Script</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/alloy?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Alloy</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/alpine-abuild?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Alpine Abuild</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ampl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>AMPL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/angelscript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>AngelScript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ant-build-system?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Ant Build System</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/antlr?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>ANTLR</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/apacheconf?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>ApacheConf</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/apex?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Apex</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/api-blueprint?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>API Blueprint</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/apl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>APL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/apollo-guidance-computer?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Apollo Guidance Computer</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/applescript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>AppleScript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/arc?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Arc</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/asciidoc?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>AsciiDoc</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/asn.1?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>ASN.1</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/asp?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>ASP</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/aspectj?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>AspectJ</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/assembly?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Assembly</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ats?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>ATS</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/augeas?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Augeas</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/autohotkey?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>AutoHotkey</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/autoit?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>AutoIt</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/awk?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Awk</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ballerina?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Ballerina</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/batchfile?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Batchfile</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/befunge?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Befunge</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/bison?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Bison</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/bitbake?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>BitBake</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/blade?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Blade</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/blitzbasic?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>BlitzBasic</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/blitzmax?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>BlitzMax</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/bluespec?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Bluespec</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/boo?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Boo</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/brainfuck?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Brainfuck</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/brightscript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Brightscript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/bro?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Bro</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/c?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>C</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/c%23?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>C#</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/c++?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>C++</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/c-objdump?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>C-ObjDump</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/c2hs-haskell?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>C2hs Haskell</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/cap&#39;n-proto?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Cap&#39;n Proto</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/cartocss?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>CartoCSS</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ceylon?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Ceylon</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/chapel?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Chapel</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/charity?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Charity</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/chuck?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>ChucK</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/cirru?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Cirru</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/clarion?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Clarion</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/clean?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Clean</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/click?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Click</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/clips?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>CLIPS</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/clojure?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Clojure</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/closure-templates?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Closure Templates</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/cloud-firestore-security-rules?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Cloud Firestore Security Rules</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/cmake?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>CMake</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/cobol?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>COBOL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/coffeescript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>CoffeeScript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/coldfusion?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>ColdFusion</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/coldfusion-cfc?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>ColdFusion CFC</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/collada?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>COLLADA</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/common-lisp?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Common Lisp</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/common-workflow-language?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Common Workflow Language</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/component-pascal?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Component Pascal</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/conll-u?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>CoNLL-U</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/cool?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Cool</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/coq?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Coq</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/cpp-objdump?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Cpp-ObjDump</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/creole?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Creole</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/crystal?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Crystal</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/cson?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>CSON</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/csound?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Csound</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/csound-document?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Csound Document</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/csound-score?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Csound Score</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/css?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>CSS</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/csv?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>CSV</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/cuda?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Cuda</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/cweb?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>CWeb</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/cycript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Cycript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/cython?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Cython</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/d?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>D</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/d-objdump?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>D-ObjDump</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/darcs-patch?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Darcs Patch</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/dart?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Dart</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/dataweave?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>DataWeave</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/desktop?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>desktop</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/diff?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Diff</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/digital-command-language?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>DIGITAL Command Language</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/dm?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>DM</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/dns-zone?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>DNS Zone</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/dockerfile?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Dockerfile</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/dogescript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Dogescript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/dtrace?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>DTrace</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/dylan?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Dylan</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/e?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>E</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/eagle?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Eagle</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/easybuild?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Easybuild</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ebnf?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>EBNF</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ec?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>eC</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ecere-projects?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Ecere Projects</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ecl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>ECL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/eclipse?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>ECLiPSe</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/edje-data-collection?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Edje Data Collection</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/edn?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>edn</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/eiffel?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Eiffel</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ejs?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>EJS</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/elixir?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Elixir</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/elm?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Elm</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/emacs-lisp?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Emacs Lisp</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/emberscript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>EmberScript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/eq?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>EQ</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/erlang?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Erlang</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/f%23?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>F#</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/factor?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Factor</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/fancy?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Fancy</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/fantom?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Fantom</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/filebench-wml?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Filebench WML</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/filterscript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Filterscript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/fish?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>fish</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/flux?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>FLUX</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/formatted?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Formatted</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/forth?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Forth</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/fortran?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Fortran</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/freemarker?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>FreeMarker</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/frege?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Frege</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/g-code?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>G-code</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/game-maker-language?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Game Maker Language</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/gams?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>GAMS</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/gap?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>GAP</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/gcc-machine-description?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>GCC Machine Description</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/gdb?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>GDB</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/gdscript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>GDScript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/genie?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Genie</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/genshi?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Genshi</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/gentoo-ebuild?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Gentoo Ebuild</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/gentoo-eclass?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Gentoo Eclass</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/gerber-image?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Gerber Image</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/gettext-catalog?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Gettext Catalog</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/gherkin?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Gherkin</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/glsl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>GLSL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/glyph?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Glyph</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/gn?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>GN</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/gnuplot?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Gnuplot</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/go?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Go</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/golo?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Golo</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/gosu?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Gosu</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/grace?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Grace</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/gradle?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Gradle</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/grammatical-framework?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Grammatical Framework</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/graph-modeling-language?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Graph Modeling Language</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/graphql?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>GraphQL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/graphviz-(dot)?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Graphviz (DOT)</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/groovy?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Groovy</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/groovy-server-pages?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Groovy Server Pages</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/hack?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Hack</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/haml?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Haml</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/handlebars?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Handlebars</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/harbour?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Harbour</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/haskell?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Haskell</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/haxe?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Haxe</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/hcl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>HCL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/hiveql?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>HiveQL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/hlsl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>HLSL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/html?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>HTML</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/html+django?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>HTML+Django</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/html+ecr?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>HTML+ECR</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/html+eex?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>HTML+EEX</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/html+erb?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>HTML+ERB</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/html+php?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>HTML+PHP</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/http?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>HTTP</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/hxml?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>HXML</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/hy?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Hy</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/hyphy?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>HyPhy</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/idl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>IDL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/idris?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Idris</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/igor-pro?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>IGOR Pro</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/inform-7?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Inform 7</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ini?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>INI</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/inno-setup?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Inno Setup</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/io?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Io</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ioke?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Ioke</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/irc-log?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>IRC log</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/isabelle?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Isabelle</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/isabelle-root?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Isabelle ROOT</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/j?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>J</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/jasmin?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Jasmin</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/java?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Java</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/java-server-pages?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Java Server Pages</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/javascript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>JavaScript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/jflex?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>JFlex</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/jison?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Jison</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/jison-lex?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Jison Lex</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/jolie?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Jolie</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/json?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>JSON</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/json-with-comments?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>JSON with Comments</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/json5?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>JSON5</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/jsoniq?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>JSONiq</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/jsonld?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>JSONLD</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/jsx?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>JSX</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/julia?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Julia</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/jupyter-notebook?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Jupyter Notebook</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/kicad-layout?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>KiCad Layout</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/kicad-legacy-layout?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>KiCad Legacy Layout</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/kicad-schematic?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>KiCad Schematic</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/kit?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Kit</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/kotlin?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Kotlin</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/krl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>KRL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/labview?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>LabVIEW</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/lasso?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Lasso</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/latte?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Latte</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/lean?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Lean</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/less?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Less</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/lex?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Lex</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/lfe?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>LFE</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/lilypond?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>LilyPond</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/limbo?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Limbo</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/linker-script?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Linker Script</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/linux-kernel-module?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Linux Kernel Module</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/liquid?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Liquid</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/literate-agda?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Literate Agda</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/literate-coffeescript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Literate CoffeeScript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/literate-haskell?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Literate Haskell</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/livescript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>LiveScript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/llvm?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>LLVM</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/logos?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Logos</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/logtalk?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Logtalk</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/lolcode?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>LOLCODE</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/lookml?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>LookML</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/loomscript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>LoomScript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/lsl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>LSL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/lua?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Lua</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/m?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>M</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/m4?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>M4</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/m4sugar?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>M4Sugar</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/makefile?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Makefile</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/mako?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Mako</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/markdown?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Markdown</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/marko?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Marko</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/mask?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Mask</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/mathematica?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Mathematica</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/matlab?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Matlab</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/maven-pom?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Maven POM</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/max?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Max</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/maxscript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>MAXScript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/mediawiki?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>MediaWiki</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/mercury?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Mercury</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/meson?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Meson</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/metal?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Metal</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/minid?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>MiniD</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/mirah?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Mirah</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/modelica?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Modelica</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/modula-2?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Modula-2</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/modula-3?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Modula-3</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/module-management-system?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Module Management System</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/monkey?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Monkey</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/moocode?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Moocode</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/moonscript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>MoonScript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/mql4?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>MQL4</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/mql5?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>MQL5</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/mtml?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>MTML</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/muf?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>MUF</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/mupad?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>mupad</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/myghty?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Myghty</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ncl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>NCL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/nearley?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Nearley</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/nemerle?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Nemerle</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/nesc?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>nesC</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/netlinx?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>NetLinx</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/netlinx+erb?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>NetLinx+ERB</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/netlogo?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>NetLogo</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/newlisp?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>NewLisp</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/nextflow?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Nextflow</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/nginx?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Nginx</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/nim?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Nim</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ninja?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Ninja</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/nit?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Nit</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/nix?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Nix</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/nl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>NL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/nsis?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>NSIS</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/nu?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Nu</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/numpy?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>NumPy</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/objdump?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>ObjDump</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/objective-c?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Objective-C</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/objective-c++?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Objective-C++</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/objective-j?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Objective-J</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ocaml?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>OCaml</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/omgrofl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Omgrofl</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ooc?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>ooc</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/opa?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Opa</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/opal?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Opal</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/opencl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>OpenCL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/openedge-abl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>OpenEdge ABL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/openrc-runscript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>OpenRC runscript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/openscad?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>OpenSCAD</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/opentype-feature-file?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>OpenType Feature File</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/org?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Org</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ox?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Ox</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/oxygene?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Oxygene</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/oz?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Oz</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/p4?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>P4</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/pan?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Pan</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/papyrus?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Papyrus</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/parrot?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Parrot</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/parrot-assembly?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Parrot Assembly</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/parrot-internal-representation?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Parrot Internal Representation</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/pascal?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Pascal</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/pawn?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>PAWN</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/pep8?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Pep8</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/perl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Perl</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/perl-6?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Perl 6</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/php?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>PHP</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/pic?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Pic</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/pickle?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Pickle</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/picolisp?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>PicoLisp</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/piglatin?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>PigLatin</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/pike?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Pike</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/plpgsql?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>PLpgSQL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/plsql?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>PLSQL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/pod?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Pod</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/pogoscript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>PogoScript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/pony?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Pony</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/postcss?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>PostCSS</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/postscript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>PostScript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/pov-ray-sdl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>POV-Ray SDL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/powerbuilder?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>PowerBuilder</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/powershell?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>PowerShell</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/processing?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Processing</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/prolog?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Prolog</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/propeller-spin?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Propeller Spin</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/protocol-buffer?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Protocol Buffer</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/public-key?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Public Key</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/pug?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Pug</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/puppet?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Puppet</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/pure-data?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Pure Data</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/purebasic?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>PureBasic</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/purescript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>PureScript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/python?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Python</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/python-console?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Python console</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/python-traceback?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Python traceback</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/q?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>q</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/qmake?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>QMake</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/qml?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>QML</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/quake?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Quake</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/r?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>R</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/racket?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Racket</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ragel?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Ragel</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/raml?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>RAML</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/rascal?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Rascal</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/raw-token-data?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Raw token data</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/rdoc?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>RDoc</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/realbasic?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>REALbasic</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/reason?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Reason</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/rebol?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Rebol</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/red?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Red</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/redcode?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Redcode</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/regular-expression?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Regular Expression</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ren&#39;py?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Ren&#39;Py</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/renderscript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>RenderScript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/restructuredtext?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>reStructuredText</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/rexx?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>REXX</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/rhtml?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>RHTML</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ring?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Ring</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/rmarkdown?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>RMarkdown</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/robotframework?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>RobotFramework</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/roff?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Roff</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/rouge?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Rouge</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/rpc?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>RPC</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/rpm-spec?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>RPM Spec</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ruby?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Ruby</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/runoff?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>RUNOFF</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/rust?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Rust</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/sage?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Sage</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/saltstack?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>SaltStack</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/sas?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>SAS</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/sass?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Sass</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/scala?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Scala</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/scaml?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Scaml</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/scheme?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Scheme</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/scilab?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Scilab</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/scss?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>SCSS</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/sed?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>sed</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/self?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Self</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/shaderlab?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>ShaderLab</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/shell?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Shell</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/shellsession?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>ShellSession</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/shen?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Shen</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/slash?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Slash</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/slim?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Slim</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/smali?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Smali</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/smalltalk?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Smalltalk</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/smarty?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Smarty</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/smt?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>SMT</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/solidity?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Solidity</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/sourcepawn?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>SourcePawn</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/sparql?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>SPARQL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/spline-font-database?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Spline Font Database</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/sqf?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>SQF</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/sql?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>SQL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/sqlpl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>SQLPL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/squirrel?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Squirrel</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/srecode-template?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>SRecode Template</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/stan?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Stan</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/standard-ml?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Standard ML</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/stata?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Stata</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ston?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>STON</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/stylus?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Stylus</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/json-with-comments?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>JSON with Comments</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/subrip-text?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>SubRip Text</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/sugarss?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>SugarSS</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/supercollider?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>SuperCollider</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/svg?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>SVG</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/swift?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Swift</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/systemverilog?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>SystemVerilog</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/tcl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Tcl</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/tcsh?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Tcsh</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/tea?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Tea</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/terra?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Terra</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/tex?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>TeX</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/text?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Text</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/textile?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Textile</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/thrift?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Thrift</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/ti-program?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>TI Program</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/tla?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>TLA</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/toml?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>TOML</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/turing?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Turing</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/turtle?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Turtle</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/twig?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Twig</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/txl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>TXL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/type-language?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Type Language</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/typescript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>TypeScript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/unified-parallel-c?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Unified Parallel C</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/unity3d-asset?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Unity3D Asset</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/unix-assembly?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Unix Assembly</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/uno?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Uno</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/unrealscript?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>UnrealScript</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/urweb?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>UrWeb</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/vala?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Vala</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/vcl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>VCL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/verilog?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Verilog</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/vhdl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>VHDL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/vim-script?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Vim script</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/visual-basic?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Visual Basic</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/volt?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Volt</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/vue?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Vue</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/wavefront-material?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Wavefront Material</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/wavefront-object?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Wavefront Object</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/wdl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>wdl</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/web-ontology-language?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Web Ontology Language</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/webassembly?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>WebAssembly</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/webidl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>WebIDL</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/wisp?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>wisp</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/world-of-warcraft-addon-data?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>World of Warcraft Addon Data</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/x-bitmap?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>X BitMap</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/x-pixmap?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>X PixMap</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/x10?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>X10</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/xbase?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>xBase</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/xc?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>XC</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/xcompose?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>XCompose</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/xml?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>XML</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/xojo?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Xojo</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/xpages?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>XPages</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/xproc?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>XProc</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/xquery?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>XQuery</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/xs?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>XS</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/xslt?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>XSLT</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/xtend?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Xtend</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/yacc?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Yacc</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/yaml?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>YAML</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/yang?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>YANG</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/yara?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>YARA</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/zephir?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Zephir</span>
    </a>            <a class="select-menu-item js-navigation-item " role="menuitem" href="/trending/zimpl?since=daily">
                  <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
                  <span class='select-menu-item-text js-select-button-text js-navigation-open'>Zimpl</span>
    </a>        </div>

          </div>

          <div class="select-menu-loading-overlay anim-pulse">
            <svg height="32" class="octicon octicon-octoface" viewBox="0 0 16 16" version="1.1" width="32" aria-hidden="true"><path fill-rule="evenodd" d="M14.7 5.34c.13-.32.55-1.59-.13-3.31 0 0-1.05-.33-3.44 1.3-1-.28-2.07-.32-3.13-.32s-2.13.04-3.13.32c-2.39-1.64-3.44-1.3-3.44-1.3-.68 1.72-.26 2.99-.13 3.31C.49 6.21 0 7.33 0 8.69 0 13.84 3.33 15 7.98 15S16 13.84 16 8.69c0-1.36-.49-2.48-1.3-3.35zM8 14.02c-3.3 0-5.98-.15-5.98-3.35 0-.76.38-1.48 1.02-2.07 1.07-.98 2.9-.46 4.96-.46 2.07 0 3.88-.52 4.96.46.65.59 1.02 1.3 1.02 2.07 0 3.19-2.68 3.35-5.98 3.35zM5.49 9.01c-.66 0-1.2.8-1.2 1.78s.54 1.79 1.2 1.79c.66 0 1.2-.8 1.2-1.79s-.54-1.78-1.2-1.78zm5.02 0c-.66 0-1.2.79-1.2 1.78s.54 1.79 1.2 1.79c.66 0 1.2-.8 1.2-1.79s-.53-1.78-1.2-1.78z"/></svg>
          </div>
        </div>
      </div>
    </div>

    <div class="protip protip-callout">
      <strong class="protip">ProTip!</strong>
      Looking for recently updated  repositories?
      <a href="/search?q=stars%3A%3E1&amp;s=updated&amp;type=Repositories">Try this search</a>
    </div>

        </div>
      </div>
    </div>

      <div class="modal-backdrop js-touch-events"></div>

      </div>

              <div class="footer mt-6" role="contentinfo">
      <div class="container-lg p-responsive">
        <div class="d-flex flex-wrap py-5 mb-5">
          <div class="col-12 col-lg-4 mb-5">
            <a href="/" data-ga-click="Footer, go to home, text:home" class="text-gray-dark" aria-label="Go to GitHub homepage">
              <svg height="30" class="octicon octicon-logo-github" viewBox="0 0 45 16" version="1.1" width="84" aria-hidden="true"><path fill-rule="evenodd" d="M18.53 12.03h-.02c.009 0 .015.01.024.011h.006l-.01-.01zm.004.011c-.093.001-.327.05-.574.05-.78 0-1.05-.36-1.05-.83V8.13h1.59c.09 0 .16-.08.16-.19v-1.7c0-.09-.08-.17-.16-.17h-1.59V3.96c0-.08-.05-.13-.14-.13h-2.16c-.09 0-.14.05-.14.13v2.17s-1.09.27-1.16.28c-.08.02-.13.09-.13.17v1.36c0 .11.08.19.17.19h1.11v3.28c0 2.44 1.7 2.69 2.86 2.69.53 0 1.17-.17 1.27-.22.06-.02.09-.09.09-.16v-1.5a.177.177 0 0 0-.146-.18zm23.696-2.2c0-1.81-.73-2.05-1.5-1.97-.6.04-1.08.34-1.08.34v3.52s.49.34 1.22.36c1.03.03 1.36-.34 1.36-2.25zm2.43-.16c0 3.43-1.11 4.41-3.05 4.41-1.64 0-2.52-.83-2.52-.83s-.04.46-.09.52c-.03.06-.08.08-.14.08h-1.48c-.1 0-.19-.08-.19-.17l.02-11.11c0-.09.08-.17.17-.17h2.13c.09 0 .17.08.17.17v3.77s.82-.53 2.02-.53l-.01-.02c1.2 0 2.97.45 2.97 3.88zm-8.72-3.61h-2.1c-.11 0-.17.08-.17.19v5.44s-.55.39-1.3.39-.97-.34-.97-1.09V6.25c0-.09-.08-.17-.17-.17h-2.14c-.09 0-.17.08-.17.17v5.11c0 2.2 1.23 2.75 2.92 2.75 1.39 0 2.52-.77 2.52-.77s.05.39.08.45c.02.05.09.09.16.09h1.34c.11 0 .17-.08.17-.17l.02-7.47c0-.09-.08-.17-.19-.17zm-23.7-.01h-2.13c-.09 0-.17.09-.17.2v7.34c0 .2.13.27.3.27h1.92c.2 0 .25-.09.25-.27V6.23c0-.09-.08-.17-.17-.17zm-1.05-3.38c-.77 0-1.38.61-1.38 1.38 0 .77.61 1.38 1.38 1.38.75 0 1.36-.61 1.36-1.38 0-.77-.61-1.38-1.36-1.38zm16.49-.25h-2.11c-.09 0-.17.08-.17.17v4.09h-3.31V2.6c0-.09-.08-.17-.17-.17h-2.13c-.09 0-.17.08-.17.17v11.11c0 .09.09.17.17.17h2.13c.09 0 .17-.08.17-.17V8.96h3.31l-.02 4.75c0 .09.08.17.17.17h2.13c.09 0 .17-.08.17-.17V2.6c0-.09-.08-.17-.17-.17zM8.81 7.35v5.74c0 .04-.01.11-.06.13 0 0-1.25.89-3.31.89-2.49 0-5.44-.78-5.44-5.92S2.58 1.99 5.1 2c2.18 0 3.06.49 3.2.58.04.05.06.09.06.14L7.94 4.5c0 .09-.09.2-.2.17-.36-.11-.9-.33-2.17-.33-1.47 0-3.05.42-3.05 3.73s1.5 3.7 2.58 3.7c.92 0 1.25-.11 1.25-.11v-2.3H4.88c-.11 0-.19-.08-.19-.17V7.35c0-.09.08-.17.19-.17h3.74c.11 0 .19.08.19.17z"/></svg>
            </a>
          </div>
          <div class="col-6 col-sm-3 col-lg-2 mb-6 mb-md-2 pr-3 pr-lg-0 pl-lg-4">
            <h4 class="mb-3 text-mono text-gray-light text-normal">Product</h4>
            <ul class="list-style-none text-gray f5">
              <li class="lh-condensed mb-3"><a href="/features" data-ga-click="Footer, go to features, text:features" class="link-gray">Features</a></li>
              <li class="lh-condensed mb-3"><a href="https://help.github.com/articles/github-security/" data-ga-click="Footer, go to security, text:security" class="link-gray">Security</a></li>
              <li class="lh-condensed mb-3"><a href="/business" data-ga-click="Footer, go to business, text:business" class="link-gray">Business</a></li>
              <li class="lh-condensed mb-3"><a href="/business/customers" data-ga-click="Footer, go to case studies, text:case studies" class="link-gray">Case studies</a></li>
              <li class="lh-condensed mb-3"><a href="/pricing" data-ga-click="Footer, go to pricing, text:pricing" class="link-gray">Pricing</a></li>
              <li class="lh-condensed mb-3"><a href="https://resources.github.com" data-ga-click="Footer, go to resources, text:resources" class="link-gray">Resources</a></li>
            </ul>
          </div>
          <div class="col-6 col-sm-3 col-lg-2 mb-6 mb-md-2 pr-3 pr-md-0 pl-md-4">
            <h4 class="mb-3 text-mono text-gray-light text-normal">Platform</h4>
            <ul class="list-style-none f5">
              <li class="lh-condensed mb-3"><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api" class="link-gray">Developer API</a></li>
              <li class="lh-condensed mb-3"><a href="http://partner.github.com/" data-ga-click="Footer, go to partner, text:partner" class="link-gray ">Partners</a></li>
              <li class="lh-condensed mb-3"><a href="https://atom.io" data-ga-click="Footer, go to atom, text:atom" class="link-gray ">Atom</a></li>
              <li class="lh-condensed mb-3"><a href="http://electron.atom.io/" data-ga-click="Footer, go to electron, text:electron" class="link-gray ">Electron</a></li>
              <li class="lh-condensed mb-3"><a href="https://desktop.github.com/" data-ga-click="Footer, go to desktop, text:desktop" class="link-gray ">GitHub Desktop</a></li>
            </ul>
          </div>
          <div class="col-6 col-sm-3 col-lg-2 mb-6 mb-md-2 pr-3 pr-md-0 pl-md-4">
            <h4 class="mb-3 text-mono text-gray-light text-normal">Support</h4>
            <ul class="list-style-none f5">
              <li class="lh-condensed mb-3"><a data-ga-click="Footer, go to help, text:help" class="link-gray " href="https://help.github.com">Help</a></li>
              <li class="lh-condensed mb-3"><a href="https://github.community" data-ga-click="Footer, go to community, text:community" class="link-gray ">Community Forum</a></li>
              <li class="lh-condensed mb-3"><a href="https://services.github.com/" data-ga-click="Footer, go to training, text:training" class="link-gray ">Training</a></li>
              <li class="lh-condensed mb-3"><a href="https://status.github.com/" data-ga-click="Footer, go to status, text:status" class="link-gray ">Status</a></li>
              <li class="lh-condensed mb-3"><a data-ga-click="Footer, go to contact, text:contact" class="link-gray " href="https://github.com/contact">Contact GitHub</a></li>
            </ul>
          </div>
          <div class="col-6 col-sm-3 col-lg-2 mb-6 mb-md-2 pr-3 pr-md-0 pl-md-4">
            <h4 class="mb-3 text-mono text-gray-light text-normal">Company</h4>
            <ul class="list-style-none f5">
              <li class="lh-condensed mb-3"><a data-ga-click="Footer, go to about, text:about" class="link-gray " href="https://github.com/about">About</a></li>
              <li class="lh-condensed mb-3"><a href="https://blog.github.com" data-ga-click="Footer, go to blog, text:blog" class="link-gray ">Blog</a></li>
              <li class="lh-condensed mb-3"><a href="/about/careers" data-ga-click="Footer, go to careers, text:careers" class="link-gray">Careers</a></li>
              <li class="lh-condensed mb-3"><a href="/about/press" data-ga-click="Footer, go to press, text:press" class="link-gray">Press</a></li>
              <li class="lh-condensed mb-3"><a href="https://shop.github.com" data-ga-click="Footer, go to shop, text:shop" class="link-gray">Shop</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="bg-gray-light">
        <div class="container-lg p-responsive f6 py-4 d-sm-flex flex-justify-between flex-row-reverse flex-items-center">
          <ul class="list-style-none d-flex flex-items-center mb-3 mb-sm-0 lh-condensed-ultra">
            <li class="mr-3"><a href="https://twitter.com/github" data-ga-click="Footer, go to Twitter, text:twitter" style="color: #959da5;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 273.5 222.3" class="d-block" height="18">
      <g fill="currentColor">
        <path d="M273.5,26.3a109.77,109.77,0,0,1-32.2,8.8A56.07,56.07,0,0,0,266,4.1a113.39,113.39,0,0,1-35.7,13.6,56.1,56.1,0,0,0-97,38.4,54,54,0,0,0,1.5,12.8A159.68,159.68,0,0,1,19.1,10.3,56.12,56.12,0,0,0,36.5,85.2a56.06,56.06,0,0,1-25.4-7v.7a56.11,56.11,0,0,0,45,55,55.65,55.65,0,0,1-14.8,2,62.39,62.39,0,0,1-10.6-1,56.24,56.24,0,0,0,52.4,39,112.87,112.87,0,0,1-69.7,24A119,119,0,0,1,0,197.1a158.83,158.83,0,0,0,86,25.2c103.2,0,159.6-85.5,159.6-159.6,0-2.4-.1-4.9-.2-7.3a114.25,114.25,0,0,0,28.1-29.1"></path>
      </g>
    </svg>
    </a></li>
            <li class="mr-3"><a href="https://www.facebook.com/GitHub" data-ga-click="Footer, go to Facebook, text:facebook" style="color: #959da5;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 15.3 15.4" class="d-block" height="18">
      <g fill="currentColor">
        <path d="M14.5,0H.8A.88.88,0,0,0,0,.9V14.5a.88.88,0,0,0,.8.9H8.1v-6h-2V7.1h2V5.4a2.87,2.87,0,0,1,2.5-3.1h.5a10.87,10.87,0,0,1,1.8.1V4.5H11.6c-1,0-1.1.5-1.1,1.1V7.1h2.3l-.3,2.3h-2v5.9h3.9a.88.88,0,0,0,.9-.8h0V.8A.86.86,0,0,0,14.5,0Z"></path>
      </g>
    </svg>
    </a></li>
            <li class="mr-3"><a href="https://www.youtube.com/github" data-ga-click="Footer, go to YouTube, text:youtube" style="color: #959da5;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 19.17 13.6" class="d-block" height="16">
      <g fill="currentColor">
        <path d="M18.77,2.13A2.4,2.4,0,0,0,17.09.42C15.59,0,9.58,0,9.58,0a57.55,57.55,0,0,0-7.5.4A2.49,2.49,0,0,0,.39,2.13,26.27,26.27,0,0,0,0,6.8a26.15,26.15,0,0,0,.39,4.67,2.43,2.43,0,0,0,1.69,1.71c1.52.42,7.5.42,7.5.42a57.69,57.69,0,0,0,7.51-.4,2.4,2.4,0,0,0,1.68-1.71,25.63,25.63,0,0,0,.4-4.67A24,24,0,0,0,18.77,2.13ZM7.67,9.71V3.89l5,2.91Z"></path>
      </g>
    </svg>
    </a></li>
            <li class="mr-3 flex-self-start"><a href="https://www.linkedin.com/company/github" data-ga-click="Footer, go to Linkedin, text:linkedin" style="color: #959da5;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 19 18" class="d-block" height="18">
      <g fill="currentColor">
        <path d="M3.94,2A2,2,0,1,1,2,0,2,2,0,0,1,3.94,2ZM4,5.48H0V18H4Zm6.32,0H6.34V18h3.94V11.43c0-3.66,4.77-4,4.77,0V18H19V10.07c0-6.17-7.06-5.94-8.72-2.91Z"></path>
      </g>
    </svg>
    </a></li>
            <li><a href="https://github.com/github" data-ga-click="Footer, go to github's org, text:github" style="color: #959da5;"><svg height="20" class="octicon octicon-mark-github d-block" alt="GitHub" viewBox="0 0 16 16" version="1.1" width="20" aria-hidden="true"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"/></svg></a></li>
          </ul>
          <ul class="list-style-none d-flex text-gray">
            <li class="mr-3">&copy; 2018 GitHub, Inc.</li>
            <li class="mr-3"><a href="/site/terms" data-ga-click="Footer, go to terms, text:terms" class="link-gray">Terms</a></li>
            <li><a href="/site/privacy" data-ga-click="Footer, go to privacy, text:privacy" class="link-gray">Privacy</a></li>
          </ul>
        </div>
      </div>
    </div>




      <div id="ajax-error-message" class="ajax-error-message flash flash-error">
        <svg class="octicon octicon-alert" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 0 0 0 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 0 0 .01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"/></svg>
        <button type="button" class="flash-close js-ajax-error-dismiss" aria-label="Dismiss error">
          <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
        </button>
        You can’t perform that action at this time.
      </div>


        <script crossorigin="anonymous" integrity="sha512-mal0oz3cFcr4OqIE2eo7Pmax6HtpOKvQfO4vqg9JuCb+iaf4H3KUP9Aryp4oP5mSMgEYUOwgBOAL6MTFaeCZ3w==" type="application/javascript" src="https://assets-cdn.github.com/assets/compat-3c69a4d015c4208bce7a9d5e4e15a914.js"></script>
        <script crossorigin="anonymous" integrity="sha512-j7P2Pw3104HznNqyNm7WuCF8Lstcf/sPX5meP6e5RFF177kmi6SAbkZ52A3ttKj0cRHLRrUbk7C1w1xtwh52zA==" type="application/javascript" src="https://assets-cdn.github.com/assets/frameworks-c163002918ede72971a36e0025f67a4a.js"></script>

        <script crossorigin="anonymous" async="async" integrity="sha512-gtafyIv6SUhe0hVSBIE4wGG2amzWBhSqbqnU0IhJ6jRFWJTPtR4YM6aCEg04g8Xybb1tp12e9aDxig9cbu6e6g==" type="application/javascript" src="https://assets-cdn.github.com/assets/github-8d674aa76ee19b76d61e8afe7d9b1209.js"></script>



      <div class="js-stale-session-flash stale-session-flash flash flash-warn flash-banner d-none">
        <svg class="octicon octicon-alert" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 0 0 0 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 0 0 .01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"/></svg>
        <span class="signed-in-tab-flash">You signed in with another tab or window. <a href="">Reload</a> to refresh your session.</span>
        <span class="signed-out-tab-flash">You signed out in another tab or window. <a href="">Reload</a> to refresh your session.</span>
      </div>
      <div class="facebox" id="facebox" style="display:none;">
      <div class="facebox-popup">
        <div class="facebox-content" role="dialog" aria-labelledby="facebox-header" aria-describedby="facebox-description">
        </div>
        <button type="button" class="facebox-close js-facebox-close" aria-label="Close modal">
          <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
        </button>
      </div>
    </div>

      <template id="site-details-dialog">
      <details class="details-reset details-overlay details-overlay-dark lh-default text-gray-dark" open>
        <summary aria-haspopup="dialog" aria-label="Close dialog"></summary>
        <details-dialog class="Box Box--overlay d-flex flex-column anim-fade-in fast">
          <button class="Box-btn-octicon m-0 btn-octicon position-absolute right-0 top-0" type="button" aria-label="Close dialog" data-close-dialog>
            <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
          </button>
          <div class="octocat-spinner my-6 js-details-dialog-spinner"></div>
        </details-dialog>
      </details>
    </template>

      <div class="Popover js-hovercard-content position-absolute" style="display: none; outline: none;" tabindex="0">
      <div class="Popover-message Popover-message--bottom-left Popover-message--large Box box-shadow-large" style="width:360px;">
      </div>
    </div>

    <div id="hovercard-aria-description" class="sr-only">
      Press h to open a hovercard with more details.
    </div>


      </body>
    </html>
    """
}

// swiftlint:enable line_length
// swiftlint:enable file_length
