# Dependencies
library(qrcode)

# Generate a QR code for a URL and save as PNG + PDF (+ optional SVG)
generate_qr_for_link <- function(url,
                                 out_base = "qr_code",
                                 png_size = 800,
                                 ecl = c("M", "L", "Q", "H"),
                                 pdf_width = 4,
                                 pdf_height = 4,
                                 svg = FALSE) {
  stopifnot(is.character(url), length(url) == 1, nzchar(url))
  stopifnot(is.character(out_base), length(out_base) == 1, nzchar(out_base))
  stopifnot(is.numeric(png_size), length(png_size) == 1, png_size > 0)
  
  ecl <- match.arg(ecl)
  
  # Build QR
  qr <- qr_code(url, ecl = ecl)
  
  # Output paths
  png_file <- paste0(out_base, ".png")
  pdf_file <- paste0(out_base, ".pdf")
  svg_file <- paste0(out_base, ".svg")
  
  # Ensure output directory exists
  out_dir <- dirname(out_base)
  if (!identical(out_dir, ".") && !dir.exists(out_dir)) {
    dir.create(out_dir, recursive = TRUE)
  }
  
  # --- PNG (bitmap) ---
  png(filename = png_file, width = png_size, height = png_size)
  op <- par(mar = c(0, 0, 0, 0))
  plot(qr)
  dev.off()
  par(op)
  
  # --- PDF (usually vector on a PDF device) ---
  pdf(file = pdf_file, width = pdf_width, height = pdf_height, useDingbats = FALSE)
  op2 <- par(mar = c(0, 0, 0, 0))
  plot(qr)
  dev.off()
  par(op2)
  
  # --- SVG (vector) ---
  produced <- c(png = png_file, pdf = pdf_file)
  if (isTRUE(svg)) {
    generate_svg(qr, filename = svg_file)
    produced <- c(produced, svg = svg_file)
  }
  
  invisible(produced)
}

# Example usage:
generate_qr_for_link(
  url      = "https://github.com/lukaslindenthal",
  out_base = "qr-codes/github_lukaslindenthal",
  png_size = 1000,
  ecl      = "M",
  svg      = TRUE
)

