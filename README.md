Getting and Cleaning Data - Course Project
===================

This is the README file for the submission of the Course Project for the Getting and Cleaning Data course, in this file I'll try to explain what the script does and its requirements.

The script was made in the following R version:

'R version 3.1.2 (2014-10-31) -- "Pumpkin Helmet"'
'Copyright (C) 2014 The R Foundation for Statistical Computing'
'Platform: x86_64-w64-mingw32/x64 (64-bit)'

The script doesn't rely on any other library aside from those included in the R Version stated above

## Requirements:
* The script must be located in the same directory as the folder containing the data
* The script will look for the files in a folder called "dataset", this was done to facilitate the hard coding of file paths in the script

## How does the script work?
1 Loads the data
-- * Loads datasets
-- * Loads subjects
-- * Merges subjects and datasets (preserving order)
-- * Loads variable names
-- * Filters all variables that have mean or std in its name
-- * Renames columns with feature labels
-- * Adds descriptive activity names
2 Aggregates the data
-- * Reorders the data
-- * Takes mean grouping by subject id and activity name

