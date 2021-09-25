<!DOCTYPE html>
<script src='https://api.mapbox.com/mapbox-gl-js/v2.2.0/mapbox-gl.js'></script>
<link href='https://api.mapbox.com/mapbox-gl-js/v2.2.0/mapbox-gl.css' rel='stylesheet' />
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        #map {
            position: absolute;
            top: 0;
            bottom: 0;
            width: 100%;
        }
        .marker {
            background-image: url('https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Google_Maps_pin.svg/1200px-Google_Maps_pin.svg.png');
            background-size: cover;
            width: 25px;
            height: 50px;
            border-radius: 50%;
            cursor: pointer;
        }

    </style>
</head>
<body>
    <div id="map"></div>
</body>
</html>
<script>
    const pointsArr = ${points};

    const Points = pointsArr.map(point => ({
        type: 'Feature',
        geometry: {
            type: 'Point',
            coordinates: point
        }
    }));

    mapboxgl.accessToken = 'pk.eyJ1IjoibWtha29naWFubm91IiwiYSI6ImNrbjdpampqNjAwamwydnBkOWtjOWhrN2IifQ._dgP3YsVmh5qYVwenebBgA';
    var map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/light-v10',
        center: [-122.084, 37.421997],
        zoom: 9
    });

    var allPoints = {
        type: 'FeatureCollection',
        features: [{
            Points
        }]
        };

    map.on('load', function() {

        allPoints.features[0].Points.forEach(function(marker)  {

            // create a HTML element for each feature
            var el = document.createElement('div');
            el.className = 'marker';

            console.log(marker);

            // make a marker for each feature and add to the map
            new mapboxgl.Marker(el)
                .setLngLat({"lng":marker.geometry.coordinates.longitude, "lat":marker.geometry.coordinates.latitude})
                .addTo(map);
        });


    });
    console.log(allPoints);

</script>