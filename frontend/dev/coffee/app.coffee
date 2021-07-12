
app = []

=include components/*.coffee

$(document).ready ->

	for component, properties of app		
		properties.init() if properties.init


	$('.yt-video .play').click ->

		id = $(this).parents(".yt-video").attr("data-id")
		$(this).parents(".yt-video").addClass("played")
		$(this).parents(".yt-video").find(".section__close").addClass("show")
		$('.video-bg, .play').fadeOut()

		options = [
			'rel=0'
			'controls=1'
			'showinfo=0'
			'autoplay=1'
			'autohide=1'
			'iv_load_policy=3'
		]

		url = 'https://www.youtube.com/embed/'+id+'?' + options.join('&')
		iframe = '<iframe width="420" height="315" src="'+url+'" frameborder="0" allowfullscreen id="yt'+id+'"></iframe>'

		$(this).parents(".yt-video").append iframe

	$('.yt-video .section__close').click ->
		_this = $(this)
		_this.parents(".yt-video").find("iframe").fadeOut()
		_this.parents(".yt-video").find(".section__close").removeClass("show")
		setTimeout ->
			_this.parents(".yt-video").find("iframe").remove()
		,500