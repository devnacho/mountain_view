# News

User-visible changes worth mentioning.

## Unreleased
- [Improvement] Setup the Logo so it will link back to the main page. - Thanks ChristineP2 - #85
- [Improvement] Move title for show view. - Thanks ChristineP2 - #87

## 0.14.0 - 2018-12-15

- [Feature] Support custom example's title, description, and HTML classes - Thanks @ChristinePanus - #81
- [Improvement] I18n support in styleguide - Thanks @ChristinePanus - #79
- [Internal change] Make `component_stubs` return array of `MountainView::Stub`,
  that has `#properties` and `#meta` information. If you're customizing your
  own styleguide this may break some things. Please refer to changelog between
  0.13 and 0.14 for changes.

--
## 0.13.0 - 2018-03-19
- [Feature] Add `rc` as an alias to `render_component` - Thanks @diegotoral - #66

## 0.12.3 - 2017-08-17
- [Fix] Add missing helper to extra pages controller
- [Improvement] Default to alphabetically sort components in styleguide sidebar - Thanks @Spone - #60
- [Improvement] Use `link_to_unless_current` to indicate the current selected page in sidebar

## 0.12.2 - 2017-08-07
- [Improvement] Move all styleguide-related helpers to StyleguideHelper

## 0.12.1 - 2017-07-01
- [Fix] Fix issue with generator - Thanks @robcole - #53

## 0.12.0 - 2017-06-13
- [Feature] Add option to add extra pages to the styleguide - Thanks @GustavoCaso - #29

## 0.11.0 - 2017-05-09
- [Feature] Allow components to receive blocks - Thanks @MikeRogers0 - #49

## 0.9.0 - 2016-06-04
- [Feature] Introduce component presenter classes - Thanks @tombeynon - #39

## 0.8.1 - 2016-03-16
- [Fix] Clone component properties hash when displaying styleguide - Thanks @OddEssay - #31

## 0.8.0 - 2016-01-22
- [Feature] Ability to component metadata on styleguide - Thanks @GustavoCaso - #27

## 0.7.0 - 2015-06-17
- [Improvement] Ability to use url helpers in components without prefix - #17 #18

## 0.6.0 - 2015-05-26
- [Improvement] Call global stylesheets from initializer - #6 #15

## 0.5.0 - 2015-05-06
- Log missing component's assets files instead of raising an exception. - #13 #14

## 0.4.3 - 2015-05-04
- [Improvement] Show a hint when there are no components - #4 #12

## 0.4.2 - 2015-04-26
- [Improvement] Show a hint when stub file is empty - #5 #11

## 0.4.1 - 2015-04-23
- [Fix] Properly humanize components name in style guide - #9

## 0.4.0 - 2015-04-22
- [Breaking] Change method name `ui_component` to `render_component`
