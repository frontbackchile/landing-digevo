
app.modal =
	init: ->

		$("[data-modal-login]").click (e) ->
			e.preventDefault()
			app.modal.open(".modal--login")

		$(".modal__close").click ->
			app.modal.close $(this).closest(".modal")


	open: (elementclass) ->
		$(elementclass).addClass("modal--in")
			

	close: (modal=false) ->

		modal = $(".modal") if !modal

		modal
			.removeClass("modal--in")
			.addClass("modal--out")

		setTimeout ->
			modal.removeClass("modal--out")
		,200

