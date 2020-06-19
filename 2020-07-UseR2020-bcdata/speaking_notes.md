
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

1:
- tell you about our newest package bcdata
- for retrieving public data from British Columbia data repositories, 
especially spatial data

2:
- Work for the governemt of British Columbia
- not in this building, but across the road

3:
- British Columbia is really big (almost 1M sq km)
- Lots of data
- I work in Ministry of Environment and Climate Change Strategy
- Group I work in analyses & reports on status and trends of BC's environment
- Heavy users of BCgov data, heavy proponents of open data and open science

4:

5:
If the data acquisition step is manual then collaborators, reviewers, etc can't import, 
and the entire workflow is not reproducible

If we can add the data acquisition step in code the whole cycle is reproducible

6:

7:
- Thousands of data sets, mostly under an open license
- tabular and spatial

8:

If you want to work with

Very handy, can download large spatial data files
Can specify projections and Area of Interest

- Still a manual process
- GUI
- Can't be scripted, not repeatable

9:

10:
APIs

Data BC provides important APIs:
- the catalogue
  - search and query data in the catalogue
- Web mapping service
  - download spatial data 
    - image overlay (WMS) AND
    - most importantly the features themselves as points, lines, polygons (WFS)
      - powerful and flexible service for distributing geographic features over the web
      supports both spatial and non-spatial querying via REST API

11:
  
- As with many FOSS projects, initially made to solve personal problem, 
and several people had the same problem
- Solve (shared) friction point of manual searching and downloading data from BCDC
and getting it into R
- Collaboration
- first R package sat in a room with a whiteboard and mapped out desired functionality and syntax
- Great approach
- Think landed in a good place

12:
- Today focus on _getting_ data

13:

14:

15:

16:

17:
- WFS: 
  - standard for accessing geospatial data over the web
  - offers direct fine-grained access to geographic information at the feature and feature property level
  - https://www.ogc.org/standards/wfs
  - Implemented by Geoserver (http://geoserver.org/)
  - very flexible interface allowing non-spatial and spatial querying
  - means processing is done on the server and you can query and download just 
  what you need

Object returned here is not the data itself, but a "promise"
to get the data, need to run collect() - like dbplyr.

18:
printing the object shows a brief preview (6 rows) with
some additional information

19:
  
Familiar syntax
Processing on server

20:
Some sticky columns always come along for the ride

21:

22:

23:
- Same as dbplyr

24:
- Now we have a real sf object we can work with that has
just the rows and columns we asked for

25:

26:

27:
Rather than downloading all of the greenspaces in BC (A LOT)
and then filtering, we are getting the server to do the filtering
for us and just downloading what we need.

28:

29:
- next steps - standalone wfs package use with other WFS services

30:
    

31:

