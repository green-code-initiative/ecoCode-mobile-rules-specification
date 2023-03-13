# ecoCode rules specification repository

## Description

This project contains the technical specifications of the ecoCode rules for Android.

To build the documentation please install `pandoc` and a `LaTeX engine` (for pdf).

## How to specify a rule

To learn how to specify a rule, please follow the documentation:

- [About Rule Specification](https://github.com/green-code-initiative/ecoCode-mobile-rules-specification/blob/main/rules/AboutRuleSpecification.md)
- [SonarQube Integration](https://github.com/green-code-initiative/ecoCode-mobile-rules-specification/blob/main/rules/SonarQubeIntegration.md)

All the existing rules can be found in the [rules folder](https://github.com/green-code-initiative/ecoCode-mobile-rules-specification/tree/main/rules).

Here is the an example of a complete rule specification: [Uncompressed Data Transmission](https://github.com/green-code-initiative/ecoCode-mobile-rules-specification/blob/main/rules/environment/bottleneck/003_UncompressedDataTransmission.md)


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
