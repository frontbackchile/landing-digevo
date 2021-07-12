
app.testimonies =
	init: ->

		app.testimonies.autoplay()

		$(".section--testimonies").find(".section__avatar").click ->
			index     = $(this).index()
			container = $(this).closest(".section--testimonies")
			app.testimonies.goto(container,index)
			app.testimonies.autoplay()

	autoplayInterval: undefined

	autoplay: ->

		clearTimeout(app.testimonies.autoplayInterval)

		app.testimonies.autoplayInterval = setInterval ->
			$(".section--testimonies").each ->
				container = $(this)
				app.testimonies.next(container)
		,10000

	next: (container) ->

		current = container.find(".section__avatar.current").index()
		next    = current + 1
		next    = 0 if next >= container.find(".section__avatar").length

		app.testimonies.goto(container,next)


	goto: (container,index) ->

		container.find(".section__avatar")
			.removeClass("current")
			.eq(index)
			.addClass("current")

		container.find(".section__testimony")
			.removeClass("in")
			.addClass("out")
			.eq(index)
			.removeClass("out")
			.addClass("in")




