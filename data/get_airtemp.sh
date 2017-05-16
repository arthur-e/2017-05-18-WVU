#!/bin/bash

# Parse arguments
while [[ $# -gt 1 ]]; do
    key="$1"

    case $key in
        --lat)
            LAT="$2"
            shift
            ;;
        --lon)
            LON="$2"
            shift
            ;;
        --year)
            YEAR="$2"
            shift
            ;;
        *)
        # Unknown option
            ;;
    esac
    shift
done

# Base URL
URL="http://iridl.ldeo.columbia.edu"
# Subset to main data source
URL+="/SOURCES/.NOAA/.NCEP/.CPC"
# Subset to specific variable (temperature)
#URL+="/.PRECL/.v1p0/.deg0p5/.rain"
URL+="/.GHCN_CAMS/.gridded/.deg0p5/.temp"
# Spatial subset
URL+="/X/${LON}/VALUES/Y/${LAT}/VALUES"
# Temporal subset
URL+="/T/(Jan ${YEAR})/(Dec ${YEAR})/RANGEEDGES"
# Suffix
URL+="/[T]data.tsv"

# Download file, redirecting to stdout
wget -q -O - "$URL"
