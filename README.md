# ecoCode rules specification repository

## Description

This project contains the technical specifications of the ecoCode rules.

To build the documentation please install `pandoc` and a `LaTeX engine` (for pdf).

## How to build

### HTML

Use the following pandoc command line to build the html document in `build/html`.

```sh
pandoc -s -c ecocode-rules.css --toc --metadata title="Environment and Social Smells For Android" -o build/html/doc.html **/*.md */*/*.md && cp ecocode-rules.css build/html/
```

### PDF

Use the following pandoc command line to build the pdf document in `build/pdf`.

```sh
pandoc -s -V geometry:margin=1in --toc -o build/pdf/doc.pdf **/*.md */*/*.md
```
