#This file creates custom color and fill functions for ggplot that use TCCD's color scheme.

#based on https://tccd.svbtle.com/creating-corporate-colour-palettes-for-ggplot2

library(ggplot2)


# TCCD corporate colors
#Any changes to these colors, or addition of new colors, are done in this vector
tccd_colors=c(blue = "#244061",
				 green = "#63a038",
				 turquoise = "#0289b2",
				 gray = "gray")



#' Function to extract TCCD colors as hex codes
#'
#' @param ... Character names of tccd_colors
#'
tccd_cols = function(...){
	cols = tolower(c(...))

	if(is.null(cols)) return(tccd_colors)

	tccd_colors[cols]
}







#Changes or new color palettes are added in this list
tccd_palettes = list(
	`main`  = tccd_cols("blue", "green", "turquoise", "gray"),
	`no_grey`  = tccd_cols("blue", "green", "turquoise")
)





#' Return function to interpolate a TCCD color palette
#'
#' @param palette Character name of palette in tccd_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to colorRampPalette()
#'
tccd_pal = function(palette = "main", reverse = FALSE, ...) {
	pal = tccd_palettes[[palette]]

	if (reverse) pal = rev(pal)

	grDevices::colorRampPalette(pal, ...)
}



#' Color scale constructor for TCCD colors
#'
#' @param palette Character name of palette in tccd_palettes
#' @param discrete Boolean indicating if color aesthetic is discrete
#' @param reverse Boolean indicating if the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_color_tccd = function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
	pal = tccd_pal(palette = palette, reverse = reverse)

	if (discrete) {
		ggplot2:::discrete_scale("colour", paste0("tccd_", palette), palette = pal, ...)
	} else {
		ggplot2:::scale_color_gradientn(colours = pal(256), ...)
	}
}

#' Fill scale constructor for tccd colors
#'
#' @param palette Character name of palette in tccd_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_fill_tccd = function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
	pal = tccd_pal(palette = palette, reverse = reverse)

	if (discrete) {
		ggplot2:::discrete_scale("fill", paste0("tccd_", palette), palette = pal, ...)
	} else {
		ggplot2:::scale_color_gradientn(colours = pal(256), ...)
	}
}
