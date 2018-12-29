#!/bin/bash

for year in {9..16}
do
  yr="$( printf '%02d' "$year" )"
  nxt="$( printf '%02d' "$((year+1))" )"
  echo "20${yr}"
  csvcut -c 4,LO_INC_RPY_1YR_N,MD_INC_RPY_1YR_N,HI_INC_RPY_1YR_N,LO_INC_RPY_3YR_N,MD_INC_RPY_3YR_N,HI_INC_RPY_3YR_N data/scorecard/MERGED20${yr}_${nxt}_PP.csv | csvgrep -c 1 -m 'Columbia University in the City of New York' | csvlook
done
