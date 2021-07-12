
app.fixed =
	init: ->
		if $(window).width()>=1200
			height_cols = $(".section--plans .cols--scroll").height()
			$(".col-min-height").css
				'height': height_cols

		$(window).on "scroll", ->
			if $(window).width()>=1200
	
				$(".fixed").each ->

					fixedEl = $(this)
					scroll  = $(window).scrollTop()
					top     = fixedEl.parent().offset().top - 70
					bottom  = $(window).scrollTop() + window.innerHeight >= $('.section--light .section__body .section__title').offset().top
					console.log bottom

					if scroll > top
						fixedEl.addClass("fixed--on")
						fixedEl.removeClass("fixed--on2")

						if bottom == true
							fixedEl.removeClass("fixed--on")
							fixedEl.addClass("fixed--on2")
					else
						fixedEl.removeClass("fixed--on")

