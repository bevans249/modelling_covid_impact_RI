[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5750111.svg)](https://doi.org/10.5281/zenodo.5750111)


# Welcome to this repository

This github repository provides data and code for modelling changes in Routine
Immunisation (RI) globally in 2020 and 2021, in relation with the COVID-19 pandemic, 
as first published by Evans & Jombart (2021).


## Reproducing the analyses

This repository contains all material necessary to reproduce the analyses of
Evans & Jombart 2021. All analyses are done using the R software. We recommend
using R 4.1.2 or later.

To reproduce the analyses, you will need to follow the steps below:

1. Download the archive (either using `git clone` or simply downloading a `zip`
   archive and unzipping it.
   
2. Install dependencies (see below)

3. Compile analysis reports (see below)



### Installing dependencies

The analysis infrastructure is an instance of a
[*reportfactory*](https://www.reconverse.org/reportfactory/), which provides a
tidy folder structure for the data, analyses and outputs, and functionalities
for installing required packages. You will need to install the *reportfactory*
if it is not installed already:

```r

install.packages("reportfactory")

```

Then to install all packages needed by the analyses, run:
```r

reportfactory::install_deps()

```



### Generating results

Analysis reports using Rmarkdown format are in the *report_sources* folder, and
can be compiled as regular Rmarkdown documents. However, to facilitate the
book-keeping, we recommend using the *reportfactory* function
`compile_reports()`, after opening the Rstudio session by double-clicking on
*analyses.Rproj*.

A single report is used to perform all the analyses. It can use DTP1, DTP3, or MCV1
data depending on the value of the parameter *data*, which can be specified as
shown below (default: DTP3):

```r

# For 2020 results, run analyses.Rmd instead of "analyses_2021.Rmd" - note that this re-creates 
outputs from the Evans & Jombart (2021) rather than using the latest (retrospectively updated)
WUENIC coverage data 

# DTP1
reportfactory::compile_reports("analyses_2021.Rmd",
                               params = list(data = "dtp1"),
                               subfolder = "dtp1")

# DTP3
reportfactory::compile_reports("analyses_2021.Rmd",
                               params = list(data = "dtp3"),
                               subfolder = "dtp3")

# MCV1
reportfactory::compile_reports("analyses_2021.Rmd",
                               params = list(data = "mcv1"),
                               subfolder = "mcv1")

```

Most outputs, including compiled versions of the analysis reports in *html*,
will be stored in the *outputs/* folder. Figures will be stored in the *figures*
folder, and tables/ dataframes in the *csv* folder.


## Licensing
Copyright: Beth Evans 2021
License: [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/)
