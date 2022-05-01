# A Paper on Partisanship and Perceptions of Direct Action Paper Repo

This is an repo to hold replication materials for the paper

## Contents

This repo holds all the data and code necessary to replicate the paper "A Paper
on Partisanship and Perceptions of Direct Action." The repo includes:

[`README.md`](README.md), this readme file which provides information about the structure of the repo and steps for replication with docker.

[`data/`](data), all of the data and data documentation obtained from YouGov:

 * [`codebook.xlsx`](data/codebook.xlsx), A codebook containing the original questions and answer codes from the YouGov survey
 * [`original_yougov.csv`](data/original_yougov.csv), A csv file containing all of the original data obtained from the YouGov survey
 * [`cleaned_data.csv`](data/cleaned_data.csv), A csv file containing all of the recoded / rescaled variables used in the analysis
 * [`test_transcript.docx`](data/test_transcript.docx), A transcript of the survey design

A dockerfile, [`Dockerfile`](Dockerfile), which allows readers to reproduce the analysis on
their own computers using [Docker](https://www.docker.com/).


[`charts/`](charts), all of the plots produced by the script. Some of these are
used in the paper, others are left-overs from the data analysis. All are useful
in understanding responses to the survey.


[`report.Rmd`](report.Rmd) the data analysis write-up file, written in Rmarkdown.

## Replication / Rendering With Docker

This repository has been set up to allow readers to edit the files without
having to install any dependencies using docker. This allows readers without a
working R installation to edit the document on their own machines.

To edit the repository on your own computer, complete the following steps. It
may be helpful to have [docker](https://docs.docker.com/get-docker/) installed
for your system.

Make the desired edits to the [`report.Rmd`](report/report.Rmd) file.
Then, depending on your system, run the following commands.

### Using Linux / Mac / Windows Power Shell:

```
docker build -t report_maker .
docker run --rm -v ${PWD}:/opt/report report_maker
```
### Using Windows Command Line:

```
docker build -t report_maker .
docker run --rm -v  %cd%:/opt/report report_maker
```

## Replication With R

For those familiar with R who have access to a working installation, it may be easier to simply render the Rmarkdown document.
To do so, please ensure that you have the following packages installed:

* [ ] tidyverse
* [ ] stargazer
* [ ] effects


