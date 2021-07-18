
app.common =

	init: ->


		applyArticlesMinHeight = ->

			$("section").each ->
				section  = $(this)
				articles = section.find("article")
				main = $(this).hasClass("section--main") 

				if articles.length >= 2 && main == false
					#console.log "---", section

					minheight = 0

					articles.attr("style","")

					if $(window).width() > 480

						articles.each ->
							article   = $(this)
							height    = article.outerHeight()
							#console.log $(this), height
							minheight = height if height > minheight

						articles.css
							'min-height': minheight+"px"

					#console.log "end",minheight

		applyArticlesMinHeight()

		setTimeout ->
			applyArticlesMinHeight()
		,1000

		$(window).on 'resize', ->
			applyArticlesMinHeight()

