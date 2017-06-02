WARNING: The word nascent below is to mean that only the *structure* of this project is complete. I have not, yet, upated all the exercises and solutions. See Roadmap below.

This nascent project attempts to use [R](https://cran.r-project.org/) and [knitr](https://cran.r-project.org/web/packages/knitr/index.html) to randomly generate numbers for the exercises (and their solutions naturally follow) for the book [OpenIntro Statistics](https://github.com/OpenIntroOrg/openintro-statistics), the book from which this project is derived.

This derivative work grew out of a need for "new" problems.  All exercises' contexts remain the same, only the numbers within the exercises and their solutions change.  Since valuable lessons are often learned from the sign and/or the magnitude of the numbers, there has been an attempt to maintain (with respect to the original work) the sign and relative magnitudes of all the randomly generated numbers.


## Other Changes
   - Converted .tex to .Rnw files
   - Reorganized the original file structure
   - Simplified typesetting with a Makefile
   - Allowed R code to be included within the text
   - Replaced some plots (mostly in solutions) to match the randomly generated numbers


## Typesetting the Textbook

From the command line, run

```
$ make
```


## Dependencies
   - [LaTeX](https://www.latex-project.org/)
   - [Make](https://www.gnu.org/software/make/)
   - [R](https://cran.r-project.org/)
   - [knitr](https://cran.r-project.org/web/packages/knitr/index.html)
   - [tidyverse](https://cran.r-project.org/web/packages/tidyverse/index.html)
   - [OpenIntro](https://cran.r-project.org/web/packages/openintro/index.html)
   - [gridExtra](https://cran.r-project.org/web/packages/gridExtra/index.html)


## Roadmap
   So far only the structure of this project is complete.  Here's a task list of completed chapters.

   - [] Chapter 1
   - [] Chapter 2
   - [] Chapter 3
   - [] Chapter 4
   - [] Chapter 5
   - [] Chapter 6
   - [] Chapter 7
   - [] Chapter 8