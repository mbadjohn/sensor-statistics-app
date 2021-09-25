<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <title>View my Data</title>

    <meta name="theme-color" content="#7952b3">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script src='https://api.mapbox.com/mapbox-gl-js/v2.2.0/mapbox-gl.js'></script>
    <link href='https://api.mapbox.com/mapbox-gl-js/v2.2.0/mapbox-gl.css' rel='stylesheet'/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
            crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
            integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
            integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>

    <style>

        /*@media (min-width: 768px) {*/
        /*    .bd-placeholder-img-lg {*/
        /*        font-size: 3.5rem;*/
        /*    }*/
        /*}*/

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

        .map_box_container {
            position: relative;
            height: 50vh;
            width: 100% !important;
        }
    </style>

</head>
<body>

<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">View My Data</a>
    <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse"
            data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
</header>

<div class="container-fluid">
    <div class="row">
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
            <div class="position-sticky pt-3">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">
                            <span data-feather="home"></span>
                            My Location
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="file"></span>
                            Light Sensor Data
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="shopping-cart"></span>
                            Accelerometer Sensor Data
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">My Locations</h1>
            </div>
            <section class="map_box_container">
                <div id='map'></div>
            </section>
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h2>Light Sensor Data</h2>
            </div>
            <div>
                <canvas id="canvas"></canvas>
            </div>
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h2>Accelerometer Sensor Data</h2>
            </div>
            <div>
                <canvas id="myChart"></canvas>
            </div>
        </main>
    </div>
</div>

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

    console.log(allPoints)

    map.on('load', function () {

        allPoints.features[0].Points.forEach(function (marker) {

            // create a HTML element for each feature
            var el = document.createElement('div');
            el.className = 'marker';

            // make a marker for each feature and add to the map
            new mapboxgl.Marker(el)
                .setLngLat({"lng": marker.geometry.coordinates.longitude, "lat": marker.geometry.coordinates.latitude})
                .addTo(map);
        });

        const lightsArray = ${lights};

        var labels = lightsArray.map(function (e) {
            return e.created_at;
        });

        var lights = lightsArray.map(function (e) {
            return e.light;
        });

        var ctx = canvas.getContext('2d');
        var config = {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Light Sensor Data',
                    data: lights,
                    backgroundColor: 'rgba(0, 119, 204, 0.3)'
                }]
            }
        };

        var chart = new Chart(ctx, config);

        const accArray = ${accelerometer};

        var accLabels = accArray.map(function (e) {
            return e.created_at;
        });

        var accsLat = accArray.map(function (e) {
            return e.latitude;
        });

        var accsLong = accArray.map(function (e) {
            return e.longitude;
        });

        var accsHeight = accArray.map(function (e) {
            return e.height;
        });

        var ctx1 = document.getElementById("myChart").getContext("2d");

        var myChart = new Chart(ctx1, {
            type: 'line',
            data: {
                labels: accLabels,
                datasets: [{
                    label: "X",
                    data: accsLat,
                    borderWidth: 2,
                    backgroundColor: "rgba(6, 167, 125, 0.1)",
                    borderColor: "rgba(6, 167, 125, 1)",
                    pointBackgroundColor: "rgba(225, 225, 225, 1)",
                    pointBorderColor: "rgba(6, 167, 125, 1)",
                    pointHoverBackgroundColor: "rgba(6, 167, 125, 1)",
                    pointHoverBorderColor: "#fff"
                }, {
                    label: "Y",
                    data: accsLong,
                    borderWidth: 2,
                    backgroundColor: "rgba(246, 71, 64, 0.1)",
                    borderColor: "rgba(246, 71, 64, 1)",
                    pointBackgroundColor: "rgba(225, 225, 225, 1)",
                    pointBorderColor: "rgba(246, 71, 64, 1)",
                    pointHoverBackgroundColor: "rgba(246, 71, 64, 1)",
                    pointHoverBorderColor: "#fff"
                }, {
                    label: "Z",
                    data: accsHeight,
                    borderWidth: 2,
                    backgroundColor: "rgba(26, 143, 227, 0.1)",
                    borderColor: "rgba(26, 143, 227, 1)",
                    pointBackgroundColor: "rgba(225, 225, 225, 1)",
                    pointBorderColor: "rgba(26, 143, 227, 1)",
                    pointHoverBackgroundColor: "rgba(26, 143, 227, 1)",
                    pointHoverBorderColor: "#fff"
                }]
            }
        });

    });
</script>
</body>
</html>
