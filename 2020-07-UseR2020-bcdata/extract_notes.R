library(stringi)

Rmd_text <- paste(readLines("2020-07-UseR2020-bcdata/2020-07-UseR2020-bcdata.Rmd"), collapse = "\n")

notes_list <- stri_extract_all_regex(Rmd_text, "\\?\\?\\?.*?(---|$)", opts_regex = list(dotall = TRUE))[[1]]

notes_list <- gsub("\\?\\?\\?|---", "", notes_list)
notes_list <- gsub("^\n*|\n*$", "", notes_list)

notes_list[nzchar(notes_list)] <- paste0(notes_list[nzchar(notes_list)], "\n")

writeLines(c(
  "
## Abstract

The British Columbia government hosts over 2000 tabular and spatial data sets
in the B.C. Data Catalogue.  Most provincial spatial data is available through
the B.C. Data Catalogue under an open licence, via a Geoserver Web Feature
Service (WFS). WFS is a powerful and flexible service for distributing
geographic features over the web, that supports both spatial and non-spatial
querying.  Our package, bcdata, wraps this functionality and enables R users
to efficiently query and directly read spatial data from the B.C. Data
Catalogue into their R session. The bcdata package implements a novel
application of dbplyr using a web service backend, where a locally constructed
query is processed by a remote server. The data is only downloaded, and loaded
into R as an ‘sf’ object, once the query is complete and the user requests the
final result. This allows for fast and efficient spatial data retrieval using
familiar dplyr syntax. The package also provides functionality that enables
users to search and retrieve many other types of data and metadata from the
B.C. Data Catalogue, thereby connecting British Columbia open data holdings
with the vast capabilities of R.

## Slides:
",
  paste(seq_along(notes_list), notes_list, sep = ":\n")), 
"2020-07-UseR2020-bcdata/speaking_notes.md")

system(sprintf("pandoc -s %s -o %s", 
               "2020-07-UseR2020-bcdata/speaking_notes.md", 
               "2020-07-UseR2020-bcdata/speaking_notes.docx"))

