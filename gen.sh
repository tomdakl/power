#!/bin/sh

GEN=gen.xml

echo '<?xml version="1.0" encoding="UTF-8"?>' > "$GEN"
echo '<generation>' >> "$GEN"
curl -s "https://www.transpower.co.nz/system-operator/live-system-and-market-data/consolidated-live-data" > live.html
cat live.html | grep "pgen-date" | grep "as at" | sed 's/(as at) //' >> "$GEN"
cat live.html| grep -B1 'class="generation"' | sed 's/--//' >> "$GEN"
echo '</generation>' >> "$GEN"
xsltproc gen.xsl "$GEN" | jq '. | del( .Magic)'  > gen.json 
echo "insert into generation(raw) values ('" > gen.sql
cat gen.json >> gen.sql
echo "')" >> gen.sql
cat gen.sql| mysql -h 192.168.1.20 -u power -p65421 power
rm "$GEN" gen.json gen.sql live.html
