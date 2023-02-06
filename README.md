## Summary
IRIS Geo Map application is a tool to visualize geographic data by generating interative maps by using [Embedded Python](https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=PAGE_epython) functionality.
Application is using [**Folium**](https://python-visualization.github.io/folium/) Python library

folium builds on the data wrangling strengths of the Python ecosystem and the mapping strengths of the leaflet.js library. Manipulate your data in Python, then visualize it in on a Leaflet map via folium.
folium makes it easy to visualize data that’s been manipulated in Python on an interactive leaflet map. It enables both the binding of data to a map for choropleth visualizations as well as passing rich vector/raster/HTML visualizations as markers on the map.

## Features
* Get geographic data details
* Mark particular location/locations and Save Interactive Maps to HTML 
* Map Tile Layors (To display different layors we can use with the Map)
* Mark Locations (Mark locations on the map based on SQL data)
* Markers Clustors (Combine Locations while zooming out) 
* Map Draw (Mark locations, Lines, View distance between two locations)
* Draw Bus Lines (Draw Bus lines by using polyline functionality)
* Weather Data (Weather deta by using folium raster_layers)
* Mini Map (Display mini map at the bottom)
* Mouse Positoin (Display latitude,longitude values with the mouse movement)
* Float Image (Display float image to the Map) 

## Application Layout
![ezgif com-gif-maker (6)](https://user-images.githubusercontent.com/18219467/216850208-95f9c854-0066-43dd-a1aa-3dd52cc55935.gif)

## Online Demo
https://irisgeomap.demo.community.intersystems.com/csp/irisgeomap/index.csp by using SuperUser | SYS
![image](https://user-images.githubusercontent.com/18219467/216850552-2f20e22c-8577-4642-9aaf-ccb3a78e57ff.png)


## Recommendation 
 Read related documentations 
* [Embedded Python](https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=PAGE_epython).
* [Folium Python Liabrary](https://python-visualization.github.io/folium/).

## How to Run (Docker)

To start coding with this repo, you do the following:

1. Clone/git pull the repo into any local directory

```shell
git clone https://github.com/mwaseem75/iris-geo-map.git
```

2. Open the terminal in this directory and run:

```shell
docker-compose build
```

3. Run the IRIS container with your project:

```shell
docker-compose up -d
```
## Installation with ZPM
```
zpm "install iris-geo-map"
```

## Getting Started 
#### Get geographic data details
To get geographic data details we will use GetGeoDetails() function of dc.IrisGeoMap.Folium class. Function requies one address parameter.
Let invoke the function and get the details of "Cambridge MA 02142"
###### Connect to IRIS Terminal and run below code
```
do ##class(dc.IrisGeoMap.Folium).GetGeoDetails("Cambridge MA 02142")
```
Below is the output

![image](https://user-images.githubusercontent.com/18219467/216948111-94ec04a3-4b65-4c29-b5a0-a6a4fe367009.png)

#### Mark some locations and save to HTML file
Let us Mark some locations and save it to HTML file.
we will use MarkGeoDetails() function of dc.IrisGeoMap.Folium class. 
Function requies two parameter:
1-location/locations(We can pass multiple location by adding "," in between)
2-HTML file path
Let us run below command to mark Cambridge MA 02142,NY,London,UAE,Jeddah,Lahore and Glasgow on the Map and save it as "irisgeomap_locations.html" file
```
do ##class(dc.IrisGeoMap.Folium).MarkGeoDetails("Cambridge MA 02142,NY,London,UAE,Jeddah,Lahore,Glasgow","d:\irisgeomap_locations.html")
```
Below is the view of irisgeomap_locations.html file
![image](https://user-images.githubusercontent.com/18219467/216950085-c5f4d2ed-f7bf-41e0-ad85-7e83a3e83fa0.png)

#### CSP application
Navigate to [http://localhost:52773/csp/irisgeomap/index.csp](http://localhost:52773/csp/irisgeomap/index.csp) by using SuperUser | SYS
![image](https://user-images.githubusercontent.com/18219467/216952968-b7d8f1b0-8dc5-4ea5-95c2-f3c867f7ad5b.png)

Web application demonstrate below functionlity:
* Map Tile Layors (To display different layors we can use with the Map)
* Mark Locations (Mark locations on the map based on SQL data)
* Markers Clustors (Combine Locations while zooming out) 
* Map Draw (Mark locations, Lines, View distance between two locations)
* Draw Bus Lines (Draw Bus lines by using polyline functionality)
* Weather Data (Weather deta by using folium raster_layers)
* Mini Map (Display mini map at the bottom)
* Mouse Positoin (Display latitude,longitude values with the mouse movement)
* Float Image (Display float image to the Map) 


## Thanks
