
app.loader =

	init: ->
		
		#$(".header__loader").show()
		#app.loader.in( $(".header__loader") )		


		if $("[data-loader]").length
			app.loader.in()
			$("body").imagesLoaded ->
				app.loader.out()


	html: ->
		console.log "loader in 2"
		return ''+
			'<div class="loader">'+
				'<svg viewBox="25 25 50 50">'+
				'	<circle cx="50" cy="50" r="20"></circle>'+
				'</svg>'+
			'</div>'

	in: (element) ->
		element = $("body") if !element
		element.append app.loader.html()


	out: ->
		$(".loader").addClass "out"
		setTimeout ->
			$(".loader").remove()
		,500
		$("body").addClass("loaded")

