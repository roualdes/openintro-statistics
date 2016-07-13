This nascent project attempts to introduce `R` code into [OpenIntro Statistics](https://github.com/OpenIntroOrg/openintro-statistics), the book from which this project is derived.

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

There are some errors along the way, but the book also appears to compile.  Any help on reducing the number of compilation errors is welcome.

- - -
