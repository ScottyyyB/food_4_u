function initiateMap() {
    map = GMaps({
        div: '#map',
        zoom: 12,
        lat: 59.3293235,
        lng: 18.0685888
    });
    addMarkers();
};

function addMarkers() {
    restaurants.forEach(function (item) {
        map.addMarker({
            lat: item.latitude,
            lng: item.longitude,
            title: item.name,
            infoWindow: {
                content: '<h4>' + item.name + '</h4><p>' + item.city +'</p>'
            }
        });
    });
}