
- data science cycle
- add "acquire"

- bc data catalogue
  - many records, non-spatial and spatial
  - searchable interface, downloadable by point and click

- but manual download means link between "aquire" and "import" is broken

- APIs
  - catalogue API
      - searching the catalogue
      - accessing non-spatial data
  - WFS for spatial data
  
- Catalogue API Demo:
  - search
  - bcdc_get_record()
  - bcdc_get_data()
  
- WFS: 
  - standard for accessing geospatial data over the web
  - offers direct fine-grained access to geographic information at the feature and feature property level
  - https://www.ogc.org/standards/wfs
  - Implemented by Geoserver (http://geoserver.org/)
  - very flexible interface allowing non-spatial and spatial querying
  - means processing is done on the server and you can query and download just 
  what you need
  
- bcdc_get_data() with spatial data Demo (no querying)
  
- dplyr + dbplyr + sf
  - dplyr has a comfortable, expressive syntax that many R users are comfortable with
  - sf has adopted the dplyr API so more and more R spatial users are using it for
  spatial operations
  - dbplyr implements a dplyr front-end for databases
  
- bcdata uses dbplyr to create a dplyr backend for the B.C. WFS service, providing
 translations for much of the WFS functionality.
 
- bcdc_query_geodata() Demo
