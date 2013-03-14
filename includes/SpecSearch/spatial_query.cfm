<script>
	var map;
	var bounds;
	var rectangle;
	function initialize() {
		var mapTypeControlOpts = {
    	var mapTypeIds: [google.maps.MapTypeId.ROADMAP, google.maps.MapTypeId.HYBRID],
           position: google.maps.ControlPosition.BOTTOM,
    		style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
		};
		var mapOptions = {
			zoom: 3,
		    center: new google.maps.LatLng(55, -135),
		    mapTypeId: google.maps.MapTypeId.ROADMAP,
		    panControl: true,
		    scaleControl: true,
		    mapTypeControlOptions: mapTypeControlOpts
		};
		map = new google.maps.Map(document.getElementById('map_canvas'),mapOptions);
		var mcd = document.createElement('div');
		mcd.id='mcd';
		mcd.style.cursor="pointer";
		var cImg=document.createElement("img");
		cImg.src='/images/selector.png';
		mcd.appendChild(cImg);
		map.controls[google.maps.ControlPosition.TOP_CENTER].push(mcd);
		google.maps.event.addDomListener(mcd, 'click', function() {
		  selectControlClicked();
		});
		var input = document.getElementById('gmapsrchtarget');
		var searchBox = new google.maps.places.SearchBox(input);
		var markers = [];
		google.maps.event.addListener(searchBox, 'places_changed', function() {
			var places = searchBox.getPlaces();
			for (var i = 0, marker; marker = markers[i]; i++) {
				marker.setMap(null);
			}
			markers = [];
			var bounds = new google.maps.LatLngBounds();
			for (var i = 0, place; place = places[i]; i++) {
				var image = {
					url: place.icon,
					size: new google.maps.Size(71, 71),
					origin: new google.maps.Point(0, 0),
					anchor: new google.maps.Point(17, 34),
					scaledSize: new google.maps.Size(25, 25)
				};
				var marker = new google.maps.Marker({
					map: map,
					icon: image,
					title: place.name,
					position: place.geometry.location
				});
				markers.push(marker);
				bounds.extend(place.geometry.location);
			}
			map.fitBounds(bounds);
		});
		google.maps.event.addListener(map, 'bounds_changed', function() {
			var bounds = map.getBounds();
			searchBox.setBounds(bounds);
		});
	}
	function selectControlClicked(){
		$("#selectedCoords").val('');
		$("#NELat").val('');
		$("#NELong").val('');
		$("#SWLat").val('');
		$("#SWLong").val('');
		var theImage=$("#mcd").children('img').attr('src');
		if (theImage=='/images/del.gif') {
			$("#mcd").html('').append('<img src="/images/selector.png">');
			dieRectangleDie();
		} else {
			$("#mcd").html('').append('<img src="/images/del.gif">');
			addARectangle();
		}
	}
	function addARectangle(){
		dieRectangleDie();
		var theBounds=map.getBounds();
		var NELat=theBounds.getNorthEast().lat();
		var NELong=theBounds.getNorthEast().lng();
		var SWLat=theBounds.getSouthWest().lat();
		var SWLong=theBounds.getSouthWest().lng();
		// latitude is easy.....
		var latrange=NELat-SWLat;
		var nela=NELat-(latrange*.3);
		var swla=SWLat+(latrange*.3);
		// if longitudes are same sign....
		if ((NELong>0 && SWLong>0) || (NELong<0 && SWLong<0)){
			var longrange=NELong-SWLong;
			var nelo=NELong-(longrange*.3);
			var swlo=SWLong+(longrange*.3);
		} else if (NELong<0 && SWLong>0) {
			var longrange=NELong+SWLong;
			var nelo=NELong-(longrange*.3);
			var swlo=SWLong+(longrange*.3);
		} else if (NELong>0 && SWLong<0) {
			var longrange=NELong+SWLong;
			var nelo=NELong-(longrange*.3);
			var swlo=SWLong+(longrange*.3);
		} else {
			alert('ERROR: long_combo_not_found: use the Contact link in the footer, include this message - aborting');
			return false;
		}
		bounds = new google.maps.LatLngBounds(
			new google.maps.LatLng(swla , swlo ),
			new google.maps.LatLng(nela, nelo)
		);
		rectangle = new google.maps.Rectangle({
			bounds: bounds,
			editable: true,
			draggable: true
		});
		rectangle.setMap(map);
		google.maps.event.addListener(rectangle,'bounds_changed',whereIsTheRectangle);
		whereIsTheRectangle();
	}
	function dieRectangleDie(){
		try {
			rectangle.setMap();
		} catch(e){}
	}
	function whereIsTheRectangle () {
		var theBounds=rectangle.getBounds();
		var NELat=theBounds.getNorthEast().lat();
		var NELong=theBounds.getNorthEast().lng();
		var SWLat=theBounds.getSouthWest().lat();
		var SWLong=theBounds.getSouthWest().lng();
		$("#NELat").val(NELat);
		$("#NELong").val(NELong);
		$("#SWLat").val(SWLat);
		$("#SWLong").val(SWLong);
		$("#selectedCoords").val(NELat + ', ' + NELong + '; ' + SWLat + ', ' + SWLong);
	}
	jQuery(document).ready(function() {
	  	initialize();
	});
</script>
<label for="map">
	Click <img src="/images/selector.png" class="likeLink" onclick="selectControlClicked();"> to open spatial query tool,
	click <img src="/images/del.gif" class="likeLink" onclick="selectControlClicked();"> to cancel.
	<span class="likeLink" onclick="getDocs('pageHelp/spatial_query')";>More Info</span>
	<br>Click the Arctos Search button (at the top or bottom of the page), NOT the Google Search button on the map, to run your query.
</label>
<div id="search-panel">
	<input id="gmapsrchtarget" type="text" placeholder="Search the Map" onKeyPress="return noenter(event);">
</div>
<input type="text" style="font-weight:bold;border:none;width:100%;color:red;" id="selectedCoords" name="selectedCoords" placeholder="NE coordinates; SW coordinates">
<div id="map_canvas"></div>
<input type="hidden" name="NELat" size="6" id="NELat">
<input type="hidden" name="NELong" size="6" id="NELong">
<input type="hidden" name="SWLat" size="6" id="SWLat">
<input type="hidden" name="SWLong" size="6" id="SWLong">