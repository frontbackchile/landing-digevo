

app.faq =

	init: ->
		$(".faq").each ->
			faq = $(this)
			faq.find(".faq__item:not(.faq__open) .faq__answer").hide()
			faq.find(".faq__question").click ->
				index = $(this).parent().index()
				app.faq.open faq, index
			

	open: (faq,index) ->
		faq.find(".faq__item").each ->
			if $(this).index() == index
				$(this).find(".faq__answer").slideToggle()
				$(this).toggleClass("faq__open")
			else
				$(this).find(".faq__answer").slideUp()
				$(this).removeClass("faq__open")
