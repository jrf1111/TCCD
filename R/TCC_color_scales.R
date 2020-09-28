#This file creates custom color and fill functions for ggplot that use TCCD's color scheme.

#based on https://tccd.svbtle.com/creating-corporate-colour-palettes-for-ggplot2



# TCCD corporate colors
#Any changes to these colors, or addition of new colors, are done in this vector
tccd_colors=c(blue = "#244061",
				 green = "#63a038",
				 turquoise = "#0289b2",
				 gray = "gray")



#' Function to extract TCCD colors as hex codes
#'
#' @param ... Character names of tccd_colors
#' @export
tccd_cols = function(...){
	cols = tolower(c(...))

	if(is.null(cols)) return(tccd_colors)

	tccd_colors[cols]
}







#Changes or new color palettes are added in this list
tccd_palettes = list(
	`main`  = tccd_cols("blue", "green", "turquoise", "gray"),
	`middle_gray`  = tccd_cols("blue", "green", "gray", "turquoise"),
	`middle_gray2`  = tccd_cols("blue", "gray", "green", "turquoise"),
	`no_gray`  = tccd_cols("blue", "green", "turquoise"),
	`blue_green`  = tccd_cols("blue", "green"),
	`blue_t`  = tccd_cols("blue", "turquoise"),
	`blue_gray`  = tccd_cols("blue", "gray"),
	`green_t`  = tccd_cols("green", "turquoise"),
	`green_gray`  = tccd_cols("green", "gray"),
	`t_gray`  = tccd_cols("turquoise", "gray")
)





#' Return function to interpolate a TCCD color palette
#'
#' @param palette Character name of palette in tccd_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to colorRampPalette()
#' @export
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
#' @export
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
#' @export
scale_fill_tccd = function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
	pal = tccd_pal(palette = palette, reverse = reverse)

	if (discrete) {
		ggplot2:::discrete_scale("fill", paste0("tccd_", palette), palette = pal, ...)
	} else {
		ggplot2:::scale_color_gradientn(colours = pal(256), ...)
	}
}





#' TCC Theme For GGPlot2
#' @description A TCC theme for ggplot2.  Based on \link[ggplot2]{theme_bw}
#'
#' @param rotate_x_labs Logical. Should the labels for the x axis be rotated 90 degrees? Default is FALSE.
#' @param base_size Numeric. Base font size. Default is 11.
#' @param base_family Character. Base font family.
#' @param base_line_size Numeric. Base size for line elements.
#' @param base_rect_size Numeric. Base size for rect elements.
#'
#' @seealso \link[ggplot2]{theme_bw}
#'
#' @importFrom ggplot2 %+replace%
#' @export
#'
#' @examples
#'
#' p <- ggplot(mpg) +
#' 	geom_bar(aes(y = manufacturer, fill = drv)) +
#' 	scale_fill_tccd("blue_green") +
#' 	#No space below the bars but 10% above them
#' 	scale_x_continuous(expand = expansion(mult = c(0, 0.1))) +
#' 	coord_flip() +
#' 	labs(
#' 		title  = "This is  a chart",
#' 		subtitle = "It shows you some data",
#' 		caption = "This is a caption. Some important notes could go here."
#' 	)
#'
#' p
#'
#' p + theme_bw()
#'
#' #based on theme_bw() but aligns the caption with the plot instead of the figure
#' # and it adds some extra space between the x axis title and the caption
#' p + theme_tcc()
#'
#' #easily rotate and align x axis labels
#' p + theme_tcc(rotate_x_labs = T)
#
theme_tcc = function(rotate_x_labs = FALSE,
										 base_size = 11,
										 base_family = "",
										 base_line_size = base_size/22,
										 base_rect_size = base_size/22)
{
	res = ggplot2::theme_grey(base_size = base_size,
									 base_family = base_family,
									 base_line_size = base_line_size,
									 base_rect_size = base_rect_size) %+replace%
		ggplot2::theme(panel.background = ggplot2::element_rect(fill = "white", colour = NA),
					panel.border = ggplot2::element_rect(fill = NA, colour = "grey20"),
					panel.grid = ggplot2::element_line(colour = "grey92"),
					panel.grid.minor = ggplot2::element_line(size = rel(0.5)),
					strip.background = ggplot2::element_rect(fill = "grey85", colour = "grey20"),
					legend.key = ggplot2::element_rect(fill = "white", colour = NA),
					plot.caption.position = "plot",
					complete = TRUE) +
		ggplot2::theme(plot.caption = ggplot2::element_text(margin = ggplot2::margin(t=base_size)))

	if(rotate_x_labs){
		res = res %+replace%
			ggplot2::theme(axis.text.x = ggplot2::element_text(angle = -90, vjust = 0.5, hjust = 0))
	}

	res

}








