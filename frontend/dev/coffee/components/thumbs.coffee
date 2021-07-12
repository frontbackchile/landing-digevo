
app.thumb = 
		
	current: 0
	duration: 40000
	time: 0
	timeout: false
	
	init: ->


	next: (el) ->
		next = el.find(".section__thumbs .col-md-12.current").index() + 1
		next = 0 if !el.find(".col-md-12").eq(next).length
		this.go(el,next)

	go: (el,to,firstime=false) ->

		this.time = 0
		this.current = to
		
		el.find(".current").addClass("out").removeClass("current")
		el.find(".col-md-12").find(".section__thumb__bar").css width: 0+"%"
		el.find(".col-md-12").eq(to).addClass("current")


	setBar: (el) ->

		setInterval ->

			app.thumb.time += 200

			bar = el.find(".col-md-12.current").find(".section__thumb__bar")
			width = app.thumb.time * 100 / app.thumb.duration
			width = 100 if width > 100
			bar.css
				width: width+"%"

		,50
