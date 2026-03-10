#!/usr/bin/env Rscript
# plot_data.R
# usage: Rscript scripts/plot_data.R data/pandas_out_50.csv plots/pandas_plot_50.png

args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 2) {
  stop("Usage: Rscript plot_data.R <in_csv> <out_png>")
}
infile <- args[1]
outfile <- args[2]

library(ggplot2)

df <- read.csv(infile)

# Basic scatter plot with points
p <- ggplot(df, aes(x = x, y = y)) +
  geom_point(size = 2, shape = 8,color='purple') +
  labs(title = paste("Scatter of x vs y (N =", nrow(df), ")"),
       x = "x", y = "y") +
  theme_minimal()

# Use ggsave (it guesses device by extension)
ggsave(filename = outfile, plot = p, width = 5, height = 4, units = "in", dpi = 150)
message("Wrote ", outfile)
