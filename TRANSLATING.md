# Translating Pro Git (2nd Edition)

The translation are managed in a decentralized way, with each translation teams maintaining their own project. Since each translation is a different repository, maintainers teams are self organized for each project.

The Pro Git team simply pulls them in and builds them for the translation teams on the git-scm.com website.

## A Word About the Activity of Translating

Pro Git is a book about a technical tool. As such it combines a double difficulty for translators:

 * The translation of a book, even in parts requires that the translators be aware of the whole content of book. This usually requires for each translator to have read the book and to agree with some common style of output. These rules ensure that the reader won't feel transitions in the text when switching from a part produced by one translator to a part from another one.
 * Git is a computer tool. Pro Git tries to make it affordable to not so technical-savy people and it's really good that the translators do not work on the core of git, because it's a user's perspective that is needed for the most part of the book. That also means that the translation may be deceiving if the translator has never used Git. Good translators must be Git users to actually keep Progit understandable.

Moreover, the book was written in a formatting language called [Asciidoc](http://asciidoctor.org/). Some parts of the files making up the book are in fact Asciidoc commands. Upsetting these commands will make it impossible to assemble and to compile of the files into the PDF, epub and html output.

Be sure to have read and understood the basics of [how Asciidoc formatting works](https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/) before starting to change any file.

Translating Pro Git is such an endeavor that if you don't want to loose your energy on poor results, stress and deceived expectations, you have to set up, enforce and abide by rules stemming from these basic advices.

## Translating the Book to Another Language

### Existing Projects

If you wish to help at translating Progit 2nd edition to your language, first check for an already existing project in the following list and get in touch with the people in charge of itif there's already one. Go to the project page, open an issue, present yourself and ask what can be done.

Existing projects include:

  Language   |   Project
------------ | -------------
Беларуская  | [progit/progit2-be](https://github.com/progit/progit2-be)
Čeština    | [progit-cs/progit2-cs](https://github.com/progit-cs/progit2-cs)
English    | [progit/progit2](https://github.com/progit/progit2)
Español    | [progit/progit2-es](https://github.com/progit/progit2-es)
Français   | [progit/progit2-fr](https://github.com/progit/progit2-fr)
Deutsch    | [progit-de/progit2](https://github.com/progit-de/progit2)
Ελληνικά   | [progit2-gr/progit2](https://github.com/progit2-gr/progit2)
Indonesian | [progit/progit2-id](https://github.com/progit/progit2-id)
Italiano   | [progit/progit2-it](https://github.com/progit/progit2-it)
日本語   | [progit/progit2-ja](https://github.com/progit/progit2-ja)
한국어   | [progit/progit2-ko](https://github.com/progit/progit2-ko)
Македонски | [progit2-mk/progit2](https://github.com/progit2-mk/progit2)
Bahasa Melayu| [progit2-ms/progit2](https://github.com/progit2-ms/progit2)
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

### Your Language is not Listed

Then you're lucky! You're gonna be the initiator of a new translation project!

You can start to make your own version with the second edition in English, available here. To do so,

 1. Pick your the [ISO 639 code](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) and [create a GitHub organization](https://help.github.com/articles/creating-a-new-organization-from-scratch/), say `progit2-[your code]` on github
 2. Create a project progit2
 3. Copy the structure of progit/progit2 (this project) in your project and start translating. You can reuse some material from the first edition, but beware that:
    1. the text has been reworked in numerous parts
    2. the markup has changed from markdown to [asciidoc](http://asciidoc.org)
 4. Push to the new repo a few translated chapters
 5. Ping an organizer so that the second edition of Progit in your language is pushed on git-scm.com.

### Updating the Status of Your Translation

On git-scm.com, the translations are listed in three categories:

 1. Translation just started. The introduction is translated at least, but there's not much to read. It's time to translate the meat of the book.
 2. Partially translated. The chapters up to chapter 6 have been translated. The book is becoming useful to help the reader become a fluent Git user.
 3. Fully Translated. The book is almost fully translated.

 Once you have reached one of these levels, just contact the maintainers of the git-scm site to make your translation appear in the right category.

## Using Travis-CI for Continuous Integration

Travis-CI is a [continuous integration](https://en.wikipedia.org/wiki/Continuous_integration) service that fits nicely with GitHub. It can be used to automatically check that the pull-requests from the collaborators don't break the Asciidoc markup but can also provide compiled versions of the books.

Setting up Travis-CI requires to have administrative privileges over the repository. If you're not an administrator of the repository, let them know that they can enhance the visibility of the project by doing the following steps.

### Checking the Validity of the Text

This is the most useful set up for contributors. It allows to check at any moment that the book compiles properly and provides the same checks for pull-requests.

#### Registering for CI

If you don't already have an account at travis-ci.org, then go to [their page](https://travis-ci.org/) and log in. Otherwise you can register with your GitHub account.

Register your project in Travis. If a build is not fired automatically, it can be forced. The logs of build provide useful data when the build fails.

Please refer to the documentation on Travis-ci.org for further information on using their system.

#### Setting up Your Repo for CI

Travis-CI works by scanning your project's root directory for a file named `.travis.yml` and following the recipe that it contains. The good news is that you don't really need to understand how all of this works. There's a project already set up to simplify the setup. Download the file [here](https://raw.githubusercontent.com/progit/progit2-pub/master/travis.yml) and save it as `.travis.yml` in your working copy. Commit it and push it; that should fire up a compilation and a check of the book's contents.


### Setting Up a Publication Chain for Ebooks

This is a quite technical task. Please ping @jnavila for this.

## Beyond Progit

Translating the book is the first step. Once this is finished, you could consider translating the user interface of Git itself.

This task requires a more technical knowledge of the tool than the book. Hopefully, after having translated the full book content, you can understand the terms used in the application. If you feel technically up to the task, the repo is [here](https://github.com/git-l10n/git-po) and you just have to follow the [guide](https://github.com/git-l10n/git-po/blob/master/po/README).

Beware though that

 * you'll need to use more specific tools to manage localization po files (such as editing them with [poedit](https://poedit.net/) and merging them. You might need to compile git in order to check your work.
 * a basic knowledge of how translating applications works is required, which is significantly different from translating books.
 * the core Git project uses more stringent [procedures](https://github.com/git-l10n/git-po/blob/master/Documentation/SubmittingPatches) to accept contributions, be sure to abide by them.
