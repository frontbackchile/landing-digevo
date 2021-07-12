
app.header =

	init: ->

		app.header.events()
		app.header.nav.events()
		$(".header__icon--hamburger").click ->
			if !$("header").hasClass("header--nav-in")
				$("header").addClass("header--nav-in")
				$("header").addClass("header--color")
		
			else
				$("header").removeClass("header--nav-in")
				$("header").addClass("header-nav-out")
				setTimeout ->
					$("header").removeClass("header--nav-in header-nav-out")
				,200

		$("[data-open-login]").click (e) ->
			$(".login").addClass("login--show")
			$(".login__front--login").addClass("login__front--show")
			$(".login").addClass("login--show--in")
			$("#sections").addClass("sections--left")
			$("header").addClass("header--left")
			$(".login form textarea").val("")

		$("[data-open-contact]").click (e) ->
			value = $(this).attr("valor")
			$(".login").addClass("login--show")
			$(".login__front--login").addClass("login__front--show")
			$(".login").addClass("login--show--in")
			$("#sections").addClass("sections--left")
			$("header").addClass("header--left")
			$(".login form textarea").val(value)

		$("[data-open-contact-form]").click (e) ->
			pass = []
			values3 = []
			$(".section__form__body .form__element").each ->
				if $(this).find("input").val() == ""

					$(this).addClass("form__element--error")
					pass.push(1)
				else	
					$(this).removeClass("form__element--error")
					pass.push(0)
				
				if $(this).find("textarea").val() == ""
					$(this).addClass("form__element--error")
					pass.push(1)
				

			if pass.indexOf(1) == -1
				$(".form__elemet__alert").removeClass("show")
				$(".section__form__body .form__element input").each ->
					value = $(this).val()
					values3.push(value)
				
				textarea = $(".section__form__body .form__element textarea").val()

				string_textarea = "¿Cuantos usuarios navegaran el sitio web? :" +values3[0]+" ¿Cuantos sitios alojaras con nosotros? : "+values3[1]+" ¿Es un sitio nuevo o ya existe desde hace tiempo? : "+values3[2]+" ¿Cuales son las urls? : " +textarea+ " ¿Necesitas ayuda técnicaen la migración? : "+values3[3]+""

				$(".section__form__body a").attr("valor",string_textarea)	
				value = $(this).attr("valor")
				$(".login").addClass("login--show")
				$(".login__front--login").addClass("login__front--show")
				$(".login").addClass("login--show--in")
				$("#sections").addClass("sections--left")
				$("header").addClass("header--left")
				$(".login form textarea").val(value)
			
			else
				$(".form__elemet__alert").addClass("show")

			
		$(".login .login__back").click ->

			$(".login").addClass("login--show--out")
			$(".login").removeClass("login--show--in")
			$("#sections").removeClass("sections--left")
			$("header").removeClass("header--left")
			$(".login form textarea").val("")
			$(".login__box--form").addClass("login__box--show")
			$(".login__box--success").removeClass("login__box--show")
			setTimeout ->
				$(".login").removeClass("login--show")
				$(".login__front").removeClass("login__front--show")
			,500

		$(".login .login__close").click ->	
			$(".login").addClass("login--show--out")
			$(".login").removeClass("login--show--in")
			$("#sections").removeClass("sections--left")
			$("header").removeClass("header--left")
			$(".login form textarea").val("")
			$(".login__box--form").addClass("login__box--show")
			$(".login__box--success").removeClass("login__box--show")
			setTimeout ->
				$(".login").removeClass("login--show")
				$(".login__front").removeClass("login__front--show")
			,500


		$("[data-open-form]").click (e) ->
			$(".section__plan").removeClass("show")
			$(".section__form").addClass("show")

		$("[data-open-plan]").click (e) ->
			$(".section__form").removeClass("show")
			$(".section__plan").addClass("show")

	onScroll: (scroll) ->

		if scroll > 10
			$("header").addClass("header--color")
		else
			if !$("header").hasClass("header--nav-in")

				$("header").removeClass("header--color")


	events: ->

		$("header").on "mouseenter", (e) ->
			$("header").addClass("header--hover")

		$("header").on "mouseleave", (e) ->
			$("header").removeClass("header--hover")


	nav:

		events: ->

			# Nav ham

			$('.header__ham').on 'click', (e) ->
				app.header.nav.toggle()

			$(".header__nav__close, .header__nav__bg").on 'click', ->
				app.header.nav.out()


			# Nav childrens

			$(".header__nav__nav li").each ->
				if $(this).find("ul").length || $(this).is("[supernav]")
					#$(this).append("<span class='fa fa-angle-right'></span>")
					$(this).children("a").append("<span class='fa fa-angle-right'></span>")

			$(".header__nav__nav a").on 'click', (e) ->
				app.header.nav.enterLvl($(this), e)

			# Back

			$(".header__nav__back").on "click", ->
				app.header.nav.backLvl()



		toggle: ->
			if !$("header").is(".header--nav-in")
				this.in()
			else
				this.out()

		in: ->
			if !$("header").hasClass("header--nav-out")
				$("header").addClass("header--nav-in")

		out: ->
			if !$("header").hasClass("header--nav-out")
				$("header").addClass("header--nav-out")
				setTimeout ->
					$("header").removeClass("header--nav-out")
					$("header").removeClass("header--nav-in")
					app.header.nav.backLvl()
				,500

		enterLvl: (el,e) ->
			if el.siblings("ul").length && $(window).width() < 1090
				e.preventDefault()
				el.siblings("ul").addClass("ul--in")
				$(".header__nav").addClass("header__nav--ul-in")

		backLvl: ->
			if $(".header__nav--ul-in").length
				$(".header__nav").removeClass("header__nav--ul-in")
				$(".header__nav__nav ul.ul--in").addClass("ul--out")
				setTimeout ->
					$(".header__nav__nav ul.ul--in").removeClass("ul--in ul--out")
				,500
