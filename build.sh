#!/bin/sh
pandoc -s -c ecocode-rules.css --toc --metadata title="Environment and Social Smells For Android" -o build/html/index.html **/*.md */*/*/*.md && cp ecocode-rules.css build/html/
pandoc -s -V geometry:margin=1in --toc -o build/pdf/ecocode-rules-specification.pdf **/*.md */*/*/*.md
