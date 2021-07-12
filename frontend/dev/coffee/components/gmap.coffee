

app.gmap =

	init: ->
		$(".map").each ->
			app.gmap.insert $(this)


	insert: (m) ->

		if m.length && !m.hasClass("map-ready")

			# Markers & infowindows
			markers = new Array()
			infowindow = false

			# Config
			map_zoom = parseInt(m.attr("data-zoom"))
			map_lat = m.attr("data-lat")
			map_lng = m.attr("data-lng")

			# Options
			mapOptions =
				center: new google.maps.LatLng(map_lat,map_lng)
				zoom: map_zoom
				mapTypeId: google.maps.MapTypeId.ROADMAP
				disableDefaultUI: true
				scrollwheel: false
				streetViewControl: false
				backgroundColor: "#fafafa"
				styles:[
					{
						"elementType":"geometry",
						"stylers":[
							{
								"color":"#212121"
							}
						]
					},
					{
						"elementType":"labels.icon",
						"stylers":[
							{
								"visibility":"off"
							}
						]
					},
					{
						"elementType":"labels.text.fill",
						"stylers":[
							{
								"color":"#757575"
							}
						]
					},
					{
						"elementType":"labels.text.stroke",
						"stylers":[
							{
								"color":"#212121"
							}
						]
					},
					{
						"featureType":"administrative",
						"elementType":"geometry",
						"stylers":[
							{
								"color":"#757575"
							}
						]
					},
					{
						"featureType":"administrative.country",
						"elementType":"labels.text.fill",
						"stylers":[
							{
								"color":"#9e9e9e"
							}
						]
					},
					{
						"featureType":"administrative.land_parcel",
						"stylers":[
							{
								"visibility":"off"
							}
						]
					},
					{
						"featureType":"administrative.locality",
						"elementType":"labels.text.fill",
						"stylers":[
							{
								"color":"#bdbdbd"
							}
						]
					},
					{
						"featureType":"poi",
						"elementType":"labels.text.fill",
						"stylers":[
							{
								"color":"#757575"
							}
						]
					},
					{
						"featureType":"poi.park",
						"elementType":"geometry",
						"stylers":[
							{
								"color":"#181818"
							}
						]
					},
					{
						"featureType":"poi.park",
						"elementType":"labels.text.fill",
						"stylers":[
							{
								"color":"#616161"
							}
						]
					},
					{
						"featureType":"poi.park",
						"elementType":"labels.text.stroke",
						"stylers":[
							{
								"color":"#1b1b1b"
							}
						]
					},
					{
						"featureType":"road",
						"elementType":"geometry.fill",
						"stylers":[
							{
								"color":"#2c2c2c"
							}
						]
					},
					{
						"featureType":"road",
						"elementType":"labels.text.fill",
						"stylers":[
							{
								"color":"#8a8a8a"
							}
						]
					},
					{
						"featureType":"road.arterial",
						"elementType":"geometry",
						"stylers":[
							{
								"color":"#373737"
							}
						]
					},
					{
						"featureType":"road.highway",
						"elementType":"geometry",
						"stylers":[
							{
								"color":"#3c3c3c"
							}
						]
					},
					{
						"featureType":"road.highway.controlled_access",
						"elementType":"geometry",
						"stylers":[
							{
								"color":"#4e4e4e"
							}
						]
					},
					{
						"featureType":"road.local",
						"elementType":"labels.text.fill",
						"stylers":[
							{
								"color":"#616161"
							}
						]
					},
					{
						"featureType":"transit",
						"elementType":"labels.text.fill",
						"stylers":[
							{
								"color":"#757575"
							}
						]
					},
					{
						"featureType":"water",
						"elementType":"geometry",
						"stylers":[
							{
								"color":"#666666"
							}
						]
					},
					{
						"featureType":"water",
						"elementType":"labels.text.fill",
						"stylers":[
							{
								"color":"#3d3d3d"
							}
						]
					}

				]

			# Create map

			if !m.find(".map-gmap").length
				m.append '<div class="map-gmap"></div>'

			map = new google.maps.Map(m.find(".map-gmap")[0], mapOptions)




			# Load markers

			m.find(".map-marker").each ->

				m_marker          = $(this)
				m_marker_content  = "<div class='map-infowindow'>" + m_marker.html() + "</div>"
				m_marker_lat      = m_marker.attr("data-lat")
				m_marker_lng      = m_marker.attr("data-lng")
				m_marker_index    = m_marker.index()

				marker = new google.maps.Marker(
					position: new google.maps.LatLng(m_marker_lat, m_marker_lng)
					animation: google.maps.Animation.DROP
					map: map
					icon: "../img/icons/pin.png"
				)

				marker['content'] = m_marker_content
				marker['index']   = m_marker_index


				# Click infowindow
				
				infowindow = new google.maps.InfoWindow(content:"") if !infowindow

				google.maps.event.addListener map, 'click', ->
					infowindow.close()


				google.maps.event.addListener marker, "click", ->
					infowindow.close()
					selectMarker( this.index )

				if m_marker.html().length
					google.maps.event.addListener marker, "click", ->
						infowindow.close()
						infowindow.setContent m_marker_content
						infowindow.open map, this

						#map.setCenter(marker.getPosition())

				markers.push(marker)




			m.addClass("map-ready")