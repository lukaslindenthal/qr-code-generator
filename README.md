# QR Code Generator (R)

A small R helper to generate QR codes from a URL and export them as **PNG** and **PDF** (optionally **SVG**).

## Features
- Exports **PNG** (bitmap) and **PDF** (print-friendly)
- Optional **SVG** export (vector, great for print/editing)
- Automatically creates the output folder if it doesn’t exist
- Supports QR error correction levels: `L`, `M`, `Q`, `H`

## Requirements
- R (recent version)
- Package: `qrcode`

Install the dependency:
```r
install.packages("qrcode")
```

## Project Structure
.
├─ qr_generator.R        # contains generate_qr_for_link()
├─ README.md
└─ qr-codes/             # output folder (auto-created if missing)


## Setup

Source the generator function in your R session:

```r
source("qr_generator.R")
```

## Usage
Generate a QR code for a link:

```r
generate_qr_for_link(
  url      = "https://github.com/lukaslindenthal",
  out_base = "qr-codes/github_lukaslindenthal",
  png_size = 1000,   # pixels (PNG)
  ecl      = "M",    # L, M, Q, H
  svg      = TRUE    # also write .svg
)
```


