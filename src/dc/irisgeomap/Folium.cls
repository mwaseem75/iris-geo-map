Class dc.IrisGeoMap.Folium Extends %SwizzleObject
{

// Function to print Latitude and Longitude 

ClassMethod GetGeoDetails(addr As %String) As %Status [ Language = python ]
{
    from geopy.geocoders import Nominatim
    geolocator = Nominatim(user_agent="kaggle_learn")
    location = geolocator.geocode(addr)
    print(location.point)
    print(location.address)
    point = location.point
    print("Latitude:", point.latitude)
    print("Longitude:", point.longitude)
}

// Functiont to print my location

ClassMethod MyLocation() As %String [ Language = python ]
{
	
	from geopy.geocoders import Nominatim
	geolocator = Nominatim(user_agent="geoapiExercises")

	current_location = geolocator.geocode(None, exactly_one=True)
		
	print('latitude = {0}, longitude = {1}'.format(current_location.latitude, current_location.longitude))
	
	#lat, lon = (current_location.latitude, current_location.longitude)
	#location = geolocator.reverse(f"{lat}, {lon}", exactly_one=True)
	#address = location.raw["address"]
	#current_address = address.get("address27", "") + ", " + address.get("city", "") + ", " + address.get("state", "")
	#print(current_address)
}

ClassMethod Home() As %String [ Language = python ]
{
	import folium
	from folium import Choropleth, Circle, Marker
	from folium.plugins import HeatMap, MarkerCluster
	
	m = folium.Map(location=[42.32,-71.0589], tiles='stamenterrain', zoom_start=10)
	iframe = m.get_root()._repr_html_()

	return iframe
}

// Display Layer control do view different layors

ClassMethod Tiles() As %String [ Language = python ]
{
	import folium
	from folium import Choropleth, Circle, Marker
	from folium.plugins import HeatMap, MarkerCluster
	from folium.features import ClickForLatLng, ClickForMarker, LatLngPopup
	
	m = folium.Map(location=[42.32,-71.0589], tiles="stamenterrain", zoom_start=10)
	
	folium.TileLayer('Stamen Terrain').add_to(m)
	folium.TileLayer('OpenStreetMap').add_to(m)
	folium.TileLayer('Stamen Toner').add_to(m)
	folium.TileLayer('Stamen Watercolor').add_to(m)
	folium.TileLayer('CartoDB Positron').add_to(m)
	folium.TileLayer('CartoDB Dark_Matter').add_to(m)
	folium.LayerControl().add_to(m)
	
	iframe = m.get_root()._repr_html_()

	return iframe
}

// Funtion to mark locations to the map

ClassMethod Markers() As %String [ Language = python ]
{
	import folium
	# Import the pandas library
	import pandas as pd

	# Make a data frame with dots to show on the map
	data = pd.DataFrame({
	   'lon':[-58, 2, 145, 30.32, -4.03, -73.57, 36.82, -38.5],
	   'lat':[-34, 49, -38, 59.93, 5.33, 45.52, -1.29, -12.97],
	   'name':['Buenos Aires', 'Paris', 'melbourne', 'St Petersbourg', 'Abidjan', 'Montreal', 'Nairobi', 'Salvador']	  
	}, dtype=str)
	# Make an empty map
	m = folium.Map(location=[20,0], tiles="OpenStreetMap", zoom_start=3)
	# add marker one by one on the map
	for i in range(0,len(data)):
	   folium.Marker(
	      location=[data.iloc[i]['lat'], data.iloc[i]['lon']],
	      popup=data.iloc[i]['name'],
	   ).add_to(m)
   
	
	iframe = m.get_root()._repr_html_()

	return iframe
}

// Function to add floating image to the map

ClassMethod FloatImage() As %String [ Language = python ]
{
	import folium
	from folium.plugins import FloatImage


	url = (
    	"https://raw.githubusercontent.com/ocefpaf/secoora_assets_map/"
    	"a250729bbcf2ddd12f46912d36c33f7539131bec/secoora_icons/rose.png"
	)

	m = folium.Map([-13, -38.15], zoom_start=10)

	FloatImage(url, bottom=40, left=65).add_to(m)
	
	iframe = m.get_root()._repr_html_()

	return iframe
}

// To draw on the Map

ClassMethod MapDraw() As %String [ Language = python ]
{
	import folium
	from folium.plugins import Draw

	m = folium.Map([-13, -38.15], zoom_start=5)
	#m = folium.Map()

	draw = Draw()

	draw.add_to(m)
	
	
	iframe = m.get_root()._repr_html_()

	return iframe
}

// Draw a Mini Map on the Map

ClassMethod MiniMap() As %String [ Language = python ]
{
	import folium
	from folium.plugins import Draw
	from folium.plugins import MiniMap
	
	m = folium.Map(location=(30, 20), zoom_start=4)
	minimap = MiniMap(width=400, height=100)
	minimap.add_to(m)

	
	iframe = m.get_root()._repr_html_()

	return iframe
}

// Function to combine Markers

ClassMethod MarkerClustor() As %String [ Language = python ]
{
	import folium
	from folium.plugins import MarkerCluster


	m = folium.Map(location=[44, -73], zoom_start=5)

	marker_cluster = MarkerCluster().add_to(m)


	folium.Marker(
	    location=[40.67, -73.94],
	    popup="Add popup text here.",
	    icon=folium.Icon(color="green", icon="ok-sign"),
	).add_to(marker_cluster)

	folium.Marker(
	    location=[44.67, -73.94],
	    popup="Add popup text here.",
	    icon=folium.Icon(color="red", icon="remove-sign"),
	).add_to(marker_cluster)

	folium.Marker(
	    location=[44.67, -71.94],
	    popup="Add popup text here.",
	    icon=None,
	).add_to(marker_cluster)

	
	iframe = m.get_root()._repr_html_()

	return iframe
}

ClassMethod MousePosition() As %String [ Language = python ]
{
	import folium
	from folium.plugins import MousePosition
	
	m = folium.Map()

	formatter = "function(num) {return L.Util.formatNum(num, 3) + ' º ';};"

	MousePosition(
	    position="topright",
	    separator=" | ",
	    empty_string="NaN",
	    lng_first=True,
	    num_digits=20,
	    prefix="Coordinates:",
	    lat_formatter=formatter,
	    lng_formatter=formatter,
	).add_to(m)

	
	iframe = m.get_root()._repr_html_()

	return iframe
}

ClassMethod WeatherData() As %String [ Language = python ]
{
	import folium


	m = folium.Map(location=[41, -70], zoom_start=5, tiles=None)


	folium.raster_layers.TileLayer(
	    tiles="http://{s}.google.com/vt/lyrs=s&x={x}&y={y}&z={z}",
	    attr="google",
	    name="google maps",
	    max_zoom=20,
	    subdomains=["mt0", "mt1", "mt2", "mt3"],
	    overlay=False,
	    control=True,
	).add_to(m)

	folium.raster_layers.TileLayer(
	    tiles="http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}",
	    attr="google",
	    name="google street view",
	    max_zoom=20,
	    subdomains=["mt0", "mt1", "mt2", "mt3"],
	    overlay=False,
	    control=True,
	).add_to(m)


	folium.raster_layers.WmsTileLayer(
	    url="http://mesonet.agron.iastate.edu/cgi-bin/wms/nexrad/n0r.cgi",
	    name="test",
	    fmt="image/png",
	    layers="nexrad-n0r-900913",
	    attr=u"Weather data © 2012 IEM Nexrad",
	    transparent=True,
	    overlay=True,
	    control=True,
	).add_to(m)

	folium.LayerControl().add_to(m)
		
	iframe = m.get_root()._repr_html_()

	return iframe
}

ClassMethod BusLines() As %String [ Language = python ]
{
	import folium
	from folium import plugins
	m = folium.Map(location=[48.868, 2.365], zoom_start=15)

	geojson = {
	    "type": "FeatureCollection",
	    "features": [
	        {
	            "type": "Feature",
	            "properties": {"lines": [0, 1]},
	            "geometry": {
	                "type": "LineString",
	                "coordinates": [
	                    [2.357919216156006, 48.87621773324153],
	                    [2.357339859008789, 48.874834693731664],
	                    [2.362983226776123, 48.86855408432749],
	                    [2.362382411956787, 48.86796126699168],
	                    [2.3633265495300293, 48.86735432768131],
	                ],
	            },
	        },
	        {
	            "type": "Feature",
	            "properties": {"lines": [2, 3]},
	            "geometry": {
	                "type": "LineString",
	                "coordinates": [
	                    [2.351503372192383, 48.86443950493823],
	                    [2.361609935760498, 48.866775611250205],
	                    [2.3633265495300293, 48.86735432768131],
	                ],
	            },
	        },
	        {
	            "type": "Feature",
	            "properties": {"lines": [1, 2]},
	            "geometry": {
	                "type": "LineString",
	                "coordinates": [
	                    [2.369627058506012, 48.86619159489603],
	                    [2.3724031448364253, 48.8626397112042],
	                    [2.3728322982788086, 48.8616233285001],
	                    [2.372767925262451, 48.86080456075567],
	                ],
	            },
	        },
	        {
	            "type": "Feature",
	            "properties": {"lines": [0]},
	            "geometry": {
	                "type": "LineString",
	                "coordinates": [
	                    [2.3647427558898926, 48.86653565369396],
	                    [2.3647642135620117, 48.86630981023694],
	                    [2.3666739463806152, 48.86314789481612],
	                    [2.3673176765441895, 48.86066339254944],
	                ],
	            },
	        },
	        {
	            "type": "Feature",
	            "properties": {"lines": [0, 1, 2, 3]},
	            "geometry": {
	                "type": "LineString",
	                "coordinates": [
	                    [2.3633265495300293, 48.86735432768131],
	                    [2.3647427558898926, 48.86653565369396],
	                ],
	            },
	        },
	        {
	            "type": "Feature",
	            "properties": {"lines": [1, 2, 3]},
	            "geometry": {
	                "type": "LineString",
	                "coordinates": [
	                    [2.3647427558898926, 48.86653565369396],
	                    [2.3650002479553223, 48.86660622956524],
	                    [2.365509867668152, 48.866987337550164],
	                    [2.369627058506012, 48.86619159489603],
	                ],
	            },
	        },
	        {
	            "type": "Feature",
	            "properties": {"lines": [3]},
	            "geometry": {
	                "type": "LineString",
	                "coordinates": [
	                    [2.369627058506012, 48.86619159489603],
	                    [2.372349500656128, 48.865702850895744],
	                ],
	            },
	        },
	    ],
	}

	# manage overlays in groups to ease superposition order
	outlines = folium.FeatureGroup("outlines")
	line_bg = folium.FeatureGroup("lineBg")
	bus_lines = folium.FeatureGroup("busLines")
	bus_stops = folium.FeatureGroup("busStops")

	line_weight = 6
	line_colors = ["red", "#08f", "#0c0", "#f80"]
	stops = []
	for line_segment in geojson["features"]:
	    # Get every bus line coordinates
	    segment_coords = [[x[1], x[0]] for x in line_segment["geometry"]["coordinates"]]
	    # Get bus stops coordinates
	    stops.append(segment_coords[0])
	    stops.append(segment_coords[-1])
	    # Get number of bus lines sharing the same coordinates
	    lines_on_segment = line_segment["properties"]["lines"]
	    # Width of segment proportional to the number of bus lines
	    segment_width = len(lines_on_segment) * (line_weight + 1)
	    # For the white and black outline effect
	    folium.PolyLine(
	        segment_coords, color="#000", weight=segment_width + 5, opacity=1
	    ).add_to(outlines)
	    folium.PolyLine(
	        segment_coords, color="#fff", weight=segment_width + 3, opacity=1
	    ).add_to(line_bg)
	    # Draw parallel bus lines with different color and offset
	    for j, line_number in enumerate(lines_on_segment):
	        plugins.PolyLineOffset(
	            segment_coords,
	            color=line_colors[line_number],
	            weight=line_weight,
	            opacity=1,
	            offset=j * (line_weight + 1) - (segment_width / 2) + ((line_weight + 1) / 2),
	        ).add_to(bus_lines)

	# Draw bus stops
	for stop in stops:
	    folium.CircleMarker(
	        stop,
	        color="#000",
	        fill_color="#ccc",
	        fill_opacity=1,
	        radius=10,
	        weight=4,
	        opacity=1,
	    ).add_to(bus_stops)

	outlines.add_to(m)
	line_bg.add_to(m)
	bus_lines.add_to(m)
	bus_stops.add_to(m)

		
	iframe = m.get_root()._repr_html_()

	return iframe
}

}