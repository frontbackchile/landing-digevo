
app.preview =
	init: ->

		$("[data-preview-course-1]").click (e) ->
			e.preventDefault()
			app.preview.open(".preview--course-1")
			
		$("[data-preview-course-2]").click (e) ->
			e.preventDefault()
			app.preview.open(".preview--course-2")



		$(".preview__close").click ->
			app.preview.close $(this).closest(".preview")
			setTimeout ->
				$(".preview").find("iframe").remove()
			, 500

		$('.preview').click (e) ->
			if $(e.target).hasClass('preview__front')
				app.preview.close $(this).closest(".preview")


	open: (elementclass) ->
		$(elementclass).addClass("preview--in")
		$("body").addClass("body--preview")
		app.common.init()
			

	close: (preview=false) ->

		preview = $(".preview") if !preview

		preview
			.removeClass("preview--in")
			.addClass("preview--out")

		setTimeout ->
			preview.removeClass("preview--out")
		,200

