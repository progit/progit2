# Translating Pro Git (2nd Edition)

The translations are managed in a decentralized way. Each translation team maintains their own project. Each translation is in its own repository, the Pro Git team simply pulls the changes and builds them into the https://git-scm.com website when ready.

## General guidance for translating Pro Git

Pro Git is a book about a technical tool, therefore translating it is difficult compared to a non-technical translation.

The following are guidelines to help you on your way:
* Before you begin, read the whole Git Pro book in English, so that you're aware of the content, and are familiar with the style used.
* Ensure you have a good working knowledge of git, so that explaining the technical terms is doable.
* Stick to a common style and format for the translation.
* Be sure to read and understand the basics of [Asciidoc formatting](https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/). Not following the asciidoc syntax can lead to problems with building/compilation of the pdf, epub and html files needed for the book.

## Translating the book to another language

### Helping with a existing project

* Check for an already existing project in the following table.
* Go to the project's page on GitHub.
* Open an issue, introduce yourself and ask where you can help.

| Language     | GitHub page     |
| :------------- | :------------- |
| العربية | [progit2-ar/progit2](https://github.com/progit2-ar/progit2) |
| Беларуская  | [progit/progit2-be](https://github.com/progit/progit2-be) |
| български език | [progit/progit2-bg](https://github.com/progit/progit2-bg) |
| Čeština    | [progit-cs/progit2-cs](https://github.com/progit-cs/progit2-cs) |
| English    | [progit/progit2](https://github.com/progit/progit2) |
| Español    | [progit/progit2-es](https://github.com/progit/progit2-es) |
| فارسی | [progit2-fa/progit2](https://github.com/progit2-fa/progit2) |
| Français   | [progit/progit2-fr](https://github.com/progit/progit2-fr) |
| Deutsch    | [progit/progit2-de](https://github.com/progit/progit2-de) |
| Ελληνικά   | [progit2-gr/progit2](https://github.com/progit2-gr/progit2) |
| Indonesian | [progit/progit2-id](https://github.com/progit/progit2-id) |
| Italiano   | [progit/progit2-it](https://github.com/progit/progit2-it) |
| 日本語   | [progit/progit2-ja](https://github.com/progit/progit2-ja) |
| 한국어   | [progit/progit2-ko](https://github.com/progit/progit2-ko) |
| Македонски | [progit2-mk/progit2](https://github.com/progit2-mk/progit2) |
| Bahasa Melayu| [progit2-ms/progit2](https://github.com/progit2-ms/progit2) |
| Nederlands | [progit/progit2-nl](https://github.com/progit/progit2-nl) |
| Polski | [progit2-pl/progit2-pl](https://github.com/progit2-pl/progit2-pl) |
| Português (Brasil) | [progit/progit2-pt-br](https://github.com/progit/progit2-pt-br) |
| Русский   | [progit/progit2-ru](https://github.com/progit/progit2-ru) |
| Slovenščina  | [progit/progit2-sl](https://github.com/progit/progit2-sl) |
| Српски   | [progit/progit2-sr](https://github.com/progit/progit2-sr) |
| Svenska  | [progit2-sv/progit2](https://github.com/progit2-sv/progit2) |
| Tagalog   | [progit2-tl/progit2](https://github.com/progit2-tl/progit2) |
| Türkçe   | [progit/progit2-tr](https://github.com/progit/progit2-tr) |
| Українська| [progit/progit2-uk](https://github.com/progit/progit2-uk) |
| Ўзбекча  | [progit/progit2-uz](https://github.com/progit/progit2-uz) |
| 简体中文  | [progit/progit2-zh](https://github.com/progit/progit2-zh) |
| 正體中文  | [progit/progit2-zh-tw](https://github.com/progit/progit2-zh-tw) |

### Starting a new translation

If there is no project for your language, you can start your own translation.

Base your work on the second edition of the book, available [here](https://github.com/progit/progit2). To do so:
 1. Pick the correct [ISO 639 code](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) for your language.
 1. Create a [GitHub organization](https://help.github.com/articles/creating-a-new-organization-from-scratch/), for example: `progit2-[your code]` on GitHub.
 1. Create a project ``progit2``.
 1. Copy the structure of progit/progit2 (this project) in your project and start translating.

### Updating the status of your translation

On https://git-scm.com, the translations are divided into three categories. Once you have reached one of these levels, contact the maintainers of https://git-scm.com/ so that they can pull the changes.

| Category | Completion     |
| :------------- | :------------- |
| Translation started for | Introduction translated, not much else. |
| Partial translations available in | up to chapter 6 has been translated. |
| Full translation available in |the book is (almost) fully translated. |

## Continuous integration with Travis CI

Travis CI is a [continuous integration](https://en.wikipedia.org/wiki/Continuous_integration) service that integrates with GitHub. Travis CI is used to ensure that a pull-request doesn't break the build or compilation. Travis CI can also provide compiled versions of the book.

Setting up Travis CI requires administrative control over the repository.

### Registering for Travis continuous integration

1. Register a Travis account [here](https://travis-ci.org/).
1. Register your project in Travis.
Please refer to the [Travis documentation](https://docs.travis-ci.com/) for more information.

### Setting up your repository for continuous integration

Travis CI works by scanning your project's root directory for a file named `.travis.yml` and following the 'recipe' that it contains. The good news is: there's already a working `.travis.yml` file in the Pro Git 2 source [here](https://raw.githubusercontent.com/progit/progit2-pub/master/travis.yml).
Copy that file, and put it in your working directory. Commit the .yml file and push it to your translation repository; that should fire up a compilation and a check of the book's contents.

## Setting up a publication chain for e-books

This is a technical task, please ping @jnavila to get started with epub publication.

## Beyond Pro Git

Translating the book is the first step. Once this is finished, you could consider translating the user interface of Git itself.

This task requires a more technical knowledge of the tool than the book. Hopefully, after having translated the full book content, you can understand the terms used in the application. If you feel technically up to the task, the repo is [here](https://github.com/git-l10n/git-po) and you just have to follow the [guide](https://github.com/git-l10n/git-po/blob/master/po/README).

Beware though that

 * you'll need to use more specific tools to manage localization po files (such as editing them with [poedit](https://poedit.net/) and merging them. You might need to compile git in order to check your work.
 * a basic knowledge of how translating applications works is required, which is significantly different from translating books.
 * the core Git project uses more stringent [procedures](https://github.com/git-l10n/git-po/blob/master/Documentation/SubmittingPatches) to accept contributions, be sure to abide by them.
