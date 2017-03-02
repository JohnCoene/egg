[![saythanks](https://img.shields.io/badge/say-thanks-ff69b4.svg)](https://saythanks.io/to/JohnCoene)

# egg

htmlwidget for R to sneak Easter eggs in your Rmarkdown documents: [egg.js](http://thatmikeflynn.com/egg.js/).

## Installation

You can install egg from github with:

```R
# install.packages("devtools")
devtools::install_github("JohnCoene/egg")
```

## [Live Example](john-coene.com/egg)

## Example

When the user strikes the keys "type" in your document the egg will appear.

```R
egg(c("t", "y", "p", "e"), "EASTER EGG", imegg = "https://upload.wikimedia.org/wikipedia/commons/5/54/Bg-easter-eggs.jpg")
```

#itsNotUseless
