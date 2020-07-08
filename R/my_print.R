my_print = function(df, ...){
	
	if(is.null(title)){
		title = NULL
	}
	
	DT::datatable(df, 
								extensions = c("Buttons"),
								rownames = F, 
								options = list(dom = 'Blfrtip',
															 scrollX = TRUE,
															 buttons = 
															 	list(list(extend = 'copy', title = title),
															 			 list(extend = 'print', title = title),
															 			 list(extend = 'collection',
															 			 		 buttons = c('csv', 'excel', 'pdf'),
															 			 		 text = 'Download',
															 			 		 title = title
															 			 )),
															 lengthMenu = list(c(10,25,50,-1),
															 									c(10,25,50,"All"))))
	
	
}
