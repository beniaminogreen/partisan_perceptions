# A Paper on Partisanship and Perceptions of Direct Action Paper Repo

This is an repo to hold replication materials for the paper "A Paper on Partisanship and
Perceptions of Direct Action"

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

[`report/`](report/), a folder containing the resources needed to render and run the
paper, including :

 * [`report.rmd`](report/report.rmd) the manuscript file, written in Rmarkdown
 * [`bibliography.bib`](report/bibliography.bib) the bibtex bibliography file

## Replication With Docker
Clone this repository using git:

```
git clone git@github.com:beniaminogreen/this_thing.git
```

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
