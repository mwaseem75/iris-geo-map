## Summary
folium builds on the data wrangling strengths of the Python ecosystem and the mapping strengths of the leaflet.js library. Manipulate your data in Python, then visualize it in on a Leaflet map via folium.
folium makes it easy to visualize data that’s been manipulated in Python on an interactive leaflet map. It enables both the binding of data to a map for choropleth visualizations as well as passing rich vector/raster/HTML visualizations as markers on the map.

The library has a number of built-in tilesets from OpenStreetMap, Mapbox, and Stamen, and supports custom tilesets with Mapbox or Cloudmade API keys. folium supports both Image, Video, GeoJSON and TopoJSON overlays.

## Application Layout
![ezgif com-gif-maker (6)](https://user-images.githubusercontent.com/18219467/216850208-95f9c854-0066-43dd-a1aa-3dd52cc55935.gif)

## Online Demo
https://irisgeomap.demo.community.intersystems.com/csp/irisgeomap/index.csp by using SuperUser | SYS
![image](https://user-images.githubusercontent.com/18219467/216850552-2f20e22c-8577-4642-9aaf-ccb3a78e57ff.png)


## Recommendation 
 Read related documentations 
* [Embedded Python](https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=PAGE_epython).
* [Folium Python Liabrary](https://python-visualization.github.io/folium/).

## How to Run

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
## Repo Contents   
* Dockerfile, docker-compose.yml, and Installer.cls to create container
* iris.script, contains script to execute during container initialization 
* /src with source files 
* /.vscode/settings.json for automatic server connections when opened in VS Code.

## Requirements:  
* [Docker desktop]( https://www.docker.com/products/docker-desktop)
* Get the latest InterSystems IRIS for Health image for use in the Dockerfile: https://hub.docker.com/_/intersystems-iris-for-health  

## Getting Started 
## Importing DataSet from Terminal
###### Connect to IRIS Terminal
```
docker-compose exec iris iris session iris
```
###### Change Namespace
```
ZN "USERS"
```
###### Run below command to import Synthetic Medical Data dataset by passing dataset ID(1) 
```
do ##class(dc.irisgeomap.folium).MyLocation(1)
```

###### To view app
'''
http://localhost:52773/csp/irisgeomap/index.csp
'''

## Thanks
