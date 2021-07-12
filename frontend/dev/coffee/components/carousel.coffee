
app.carousel = 
		
	current: 0
	duration: 6000
	time: 0
	timeout: false
	
	init: ->

		el = $(".carousel")
		app.carousel.go(el,0,true)
		app.carousel.setBar(el)
		app.carousel.eventSwipe (el)

		$(".carousel-thumbnail").click ->
			parent = $(this).closest(".carousel")
			app.carousel.go parent, $(this).index()

	next: (el) ->
		next = el.find(".section__thumbs .carousel-thumbnail.current").index() + 1
		next = 0 if !el.find(".carousel-content").eq(next).length
		this.go(el,next)

	prev: (el) ->
		prev = el.find(".section__thumbs .carousel-thumbnail.current").index() - 1
		prev = 0 if !el.find(".carousel-content").eq(prev).length
		this.go(el,prev)


	go: (el,to,firstime=false) ->

		this.time = 0
		this.current = to
		delay = 50
		delay = 0 if firstime

		el.find(".current").addClass("out").removeClass("current")
		el.find(".carousel-thumbnail").find(".section__thumb__bar").css width: 0+"%"
		el.find(".carousel-thumbnail").eq(to).addClass("current")
		setTimeout ->
			el.find(".out").removeClass("out")
			el.find(".carousel-content").eq(to).addClass("current")
		,delay

		current = el.find(".carousel-thumbnail.current").index()

		if el.find(".carousel-content video").length
			el.find("video")[current].pause()
			el.find("video")[current].currentTime = 0
			el.find("video")[current].play()


		this.autoplay(el)

	autoplay: (el) ->
		clearTimeout app.carousel.timeout
		app.carousel.timeout = setTimeout ->
			app.carousel.next(el)
		,this.duration

	setBar: (el) ->

		setInterval ->

			app.carousel.time += 50

			bar = el.find(".carousel-thumbnail.current").find(".section__thumb__bar")
			width = app.carousel.time * 100 / app.carousel.duration
			width = 100 if width > 100
			bar.css
				width: width+"%"

		,50


	eventSwipe: (carousel) ->
		carousel.hammer().bind "swipeleft", (e) ->
			app.carousel.next $(this)
		carousel.hammer().bind "swiperight", (e) ->
			app.carousel.prev $(this)	