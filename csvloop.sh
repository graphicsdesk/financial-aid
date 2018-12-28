#!/bin/bash

for year in {9..16}
do
  yr="$( printf '%02d' "$year" )"
  nxt="$( printf '%02d' "$((year+1))" )"
  echo "20${yr}"
  csvcut -c 4,NPT41_PRIV,NPT42_PRIV,NPT43_PRIV,NPT44_PRIV,NPT45_PRIV,PCTPELL data/scorecard/MERGED20${yr}_${nxt}_PP.csv | csvgrep -c 1 -m 'Columbia University in the City of New York' | csvlook
done
