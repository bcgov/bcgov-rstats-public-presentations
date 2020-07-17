
# **Introduction to bcdata**: Presentation for UseR!2020

- [Video Recording](https://www.youtube.com/watch?v=ZNRouw-BmzE)

- [Rendered Slides](https://bcgov.github.io/bcgov-rstats-public-presentations/2020-07-UseR2020-bcdata/2020-07-UseR2020-bcdata.html)

- [bcdata documentation](https://bcgov.github.io/bcdata)

## Abstract

The British Columbia government hosts over 2000 tabular
and spatial data sets in the [B.C. Data
Catalogue](https://data.gov.bc.ca).  Most provincial
spatial data is available through the B.C. Data Catalogue
under an open licence, via a [Geoserver Web Feature
Service
(WFS)](https://docs.geoserver.org/latest/en/user/services/wfs/reference.html).
WFS is a powerful and flexible service for distributing
geographic features over the web, that supports both
spatial and non-spatial querying.  Our package, bcdata,
wraps this functionality and enables R users to
efficiently query and directly read spatial data from the
B.C. Data Catalogue into their R session. The bcdata
package implements a novel application of
[dbplyr](https://dbplyr.tidyverse.org/) using a web
service backend, where a locally constructed query is
processed by a remote server. The data is only downloaded,
and loaded into R as an ‘sf’ object, once the query is
complete and the user requests the final result. This
allows for fast and efficient spatial data retrieval using
familiar dplyr syntax. The package also provides
functionality that enables users to search and retrieve
many other types of data and metadata from the B.C. Data
Catalogue, thereby connecting British Columbia open data
holdings with the vast capabilities of R.

### Convert html slides to PDF:

```
$ # npm install -g decktape
$ decktape --load-timeout=200000 --chrome-arg=--disable-web-security remark 2020-07-UseR2020-bcdata.html 2020-07-UseR2020-bcdata.pdf
```
