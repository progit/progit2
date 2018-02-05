# Contributing to Pro Git (2nd Edition)


## Licensing

By opening a pull request to this repository, you agree to provide your work under the [project license](LICENSE.asc).
Also, you agree to grant such license of your work as is required for the purposes of future print editions to @ben and @schacon.
Should your changes appear in a printed edition, you'll be included in the [contributors list](book/contributors.asc).

## Signaling an Issue

Before signaling an issue, please check that there isn't already a similar one in the bug tracking system.

Also, if this issue has been spotted on the git-scm.com site, please cross-check that it is still present in the pdf version.
The issue may have already been corrected, but the changes have not been deployed yet.

## Small Corrections

Errata and basic clarifications will be accepted if we agree that they improve the content.
You can also open an issue so we can figure out how or if it needs to be addressed.

If you've never done this before, the [flow guide](https://guides.github.com/introduction/flow/) might be useful.

## Large Rewrites

Open an issue for discussion before you start.
These changes tend to be very subjective, often only clarifying things for some small percentage of people and it's rarely worth the time to accept them.
Professional copy editors have already reviewed this content multiple times so while you may have somewhat better taste and grammar than we do it's unlikely that your prose is going to be *so* much better that it's worth changing vast swaths of text.

## Figures

The images in this book were generated using [Sketch 3](http://bohemiancoding.com/sketch/), with the [included sketchbook file](diagram-source/progit.sketch).

To add a figure:

1. Add a page to the sketchbook.
Try to use the included symbols wherever possible.
2. Add a "slice" to your page.
Give it a name that matches the destination PNG filename, relative from the root of the source directory.
3. Make sure your slice is set to export at "800w".


## Translations

Translations to other languages are highly encouraged but handled a little differently than the first edition.
We now keep each translation in a separate repository.

Since each translation is a different repository, we can also have different maintainers for each project.
The Pro Git team simply pulls them in and builds them for the translation teams on the git-scm.com website.

### Existing Projects

If you wish to help at translating Progit 2nd edition to your
language, first check already existing projects and get in touch with
the people in charge of them if there's already one.

Existing projects include:

  Language   |   Project
------------ | -------------
Беларуская  | [progit/progit2-be](https://github.com/progit/progit2-be)
Čeština    | [progit-cs/progit2-cs](https://github.com/progit-cs/progit2-cs)
English    | [progit/progit2](https://github.com/progit/progit2)
Español    | [progit/progit2-es](https://github.com/progit/progit2-es)
Français   | [progit/progit2-fr](https://github.com/progit/progit2-fr)
Ελληνικά   | [progit2-gr/progit2](https://github.com/progit2-gr/progit2)
Indonesian | [progit/progit2-id](https://github.com/progit/progit2-id)
Italiano   | [progit/progit2-it](https://github.com/progit/progit2-it)
日本語   | [progit/progit2-ja](https://github.com/progit/progit2-ja)
한국어   | [progit/progit2-ko](https://github.com/progit/progit2-ko)
Nederlands | [progit/progit2-nl](https://github.com/progit/progit2-nl)
Polski | [progit2-pl/progit2-pl](https://github.com/progit2-pl/progit2-pl)
Português (Brasil) | [progit2-pt-br/progit2](https://github.com/progit2-pt-br/progit2)
Русский   | [progit/progit2-ru](https://github.com/progit/progit2-ru)
Slovenščina  | [progit/progit2-sl](https://github.com/progit/progit2-sl)
Српски   | [progit/progit2-sr](https://github.com/progit/progit2-sr)
Tagalog   | [progit2-tl/progit2](https://github.com/progit2-tl/progit2)
Türkçe   | [progit/progit2-tr](https://github.com/progit/progit2-tr)
Українська| [progit/progit2-uk](https://github.com/progit/progit2-uk)
Ўзбекча  | [progit/progit2-uz](https://github.com/progit/progit2-uz)
简体中文  | [progit/progit2-zh](https://github.com/progit/progit2-zh)
正體中文  | [progit/progit2-zh-tw](https://github.com/progit/progit2-zh-tw)

### Your Language does not Exist

Then you're lucky! You're gonna be the initiator of a new translation project!

You can start to make your own version with the second edition in English, available here. To do so,

 1. Pick your the [ISO 639 code](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) and create a GitHub organization, say `progit2-[your code]` on github
 2. Create a project progit2
 3. Copy the structure of progit/progit2 (this project) in your project and start translating. You can reuse some material from the first edition, but beware that:
    1. the text has been reworked in numerous parts
    2. the markup has changed from markdown to [asciidoc](http://asciidoc.org)
 4. Push to the new repo a few translated chapters
 5. Ping an organizer so that the second edition of Progit in your language is pushed on git-scm.com.
