This nascent project attempts to [knit](http://yihui.name/knitr/) R code into [OpenIntro Statistics](https://github.com/OpenIntroOrg/openintro-statistics), the book from which this project is derived.

Project Organization
--------------------

- Each chapter's content is in one of the eight chapter folders that start with "ch_". Within each folder, there is a "figures" folder, and files named content.Rnw and exercises.Rnw, which contain the content and exercises for the respective chapter. The Rnw files contain the text that are used to typeset the chapters in the textbook.
- In many cases, R code is supplied with figures to regenerate the figure. It will often be necessary to install the "openintro" R package that is available from GitHub (https://github.com/OpenIntroOrg) if you would like to regenerate a figure. Other packages may also occasionally be required.
- Exercise figures may be found in [chapter folder] > figures > eoce > [exercise figure folders]. "EOCE" means end-of-chapter exercises.
- The extraTeX folder contains files for the front and back matter of the textbook and also the style files. Note that use of any style files, like all other files here, is under the Creative Commons license cited in the LICENSE file.

- - -

Typesetting the Textbook
------------------------

The textbook may be typeset using the files main.Rnw and Makefile.  From the command line, run

```
$ make
```

To compile the book with R code knit into the text, specify the make option

```
$ make build=code
```

- - -

Dependencies
------------

- [LaTeX](https://www.latex-project.org/)
- [Make](https://www.gnu.org/software/make/)
- [R](https://cran.r-project.org/)
- [knitr](http://yihui.name/knitr/)
- [tidyverse](https://cran.r-project.org/web/packages/tidyverse/index.html)
- [openintro](https://cran.r-project.org/web/packages/openintro/index.html)