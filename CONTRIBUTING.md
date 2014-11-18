# Contributing to Pro Git (2nd Edition)


## Licensing

By opening a pull request to this repository, you agree to provide your work under the [project license](LICENSE.asc).
Also, you agree to grant such license of your work as is required for the purposes of future print editions to @ben and @schacon.
Should your changes appear in a printed edition, you'll be included in the [contributors list](book/contributors.asc).

## Small Corrections

Errata and basic clarifications will be accepted if we agree that they improve the content. You can also open an issue so we can figure out how or if it needs to be addressed.

If you've never done this before, the [flow guide](https://guides.github.com/introduction/flow/) might be useful.

## Large Rewrites

Open an issue for discussion before you start. These changes tend to be very subjective, often only clarifying things for some small percentage of people and it's rarely worth the time to accept them. Professional copy editors have already reviewed this content multiple times so while you may have somewhat better taste and grammar than we do it's unlikely that your prose is going to be *so* much better that it's worth changing vast swaths of text.

## Figures

The images in this book were generated using [Sketch 3](http://bohemiancoding.com/sketch/), with the [included sketchbook file](diagram-source/progit.sketch).

To add a figure:

1. Add a page to the sketchbook. Try to use the included symbols wherever possible.
1. Add a "slice" to your page. Give it a name that matches the destination PNG filename, relative from the root of the source directory.
1. Make sure your slice is set to export at "800w".


## Translations

Translations to other languages are highly encouraged but handled a little differently than the first edition. We now keep each translation in a separate repository and automatically build the output files through Atlas. This was something that was really difficult in the last edition.

Since each translation is a different repository, we can also have different maintainers for each project. The Pro Git team simply pulls them in and builds them for the translation teams. To get automatic builds, translations repositories will have to be under the [`progit` organization on GitHub](https://github.com/progit).

You can find out information on all the current translations and information on how to start your own at http://progit.org/translations.
