#!/bin/bash

sites=( gate.ahram.org.eg/News/419256.aspx github.com )

for site in "${sites[@]}"
do
  echo "- Processing : $site"
  phantomjs rasterize.js http://$site $site.png
  convert "$site.png" -crop 1024x768+0+0 "$site.png" && convert "$site.png" -filter Lanczos -thumbnail 580x300 "$site-thumbnail.png"
  echo "- Done processing : $site"
done
