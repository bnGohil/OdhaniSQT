part of places;

class PlacesNetwork {
  final dio = Dio();

  // static var mapsId = "AIzaSyD_RGCgdBf5mwNlNP9InqubPbdZ8oIkwIE";
  static var mapsId = "AIzaSyA_0G86KK3NNXQ3X4BaWFweUPp_XnbhPio";

  Future<List<Place>?> placesByName({required String q}) async {

    try {
      final uri = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$q&types=geocode&key=$mapsId";

      final response = await dio.get(uri);

      final json = response.data;

      final places = List<Place>.from(json["predictions"].map((x) => Place.fromJson(x)));

      return places;
    } catch (e) {
      return null;
    }

  }

  Future<List<Place>?> placesByLatLng({required double lat, required double lng}) async {

    try {
      final uri = "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$mapsId";

      final response = await dio.get(uri);

      final json = response.data;

      final places = List<Place>.from(json["results"].map((x) {

        return Place.fromLatLngJson(x);
      }));

      return places;

    } catch (e) {
      return null;
    }

  }

  Future<LatLong?> latLongFromPlaceId({required String placeID}) async {

    try {
      final uri = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeID&fields=geometry&key=$mapsId";

      final response = await dio.get(uri);

      final json = response.data;

      print("json ${json}");

      final result = json["result"];
      final location = result["geometry"]["location"];

      print("lat ${location["lat"]}");
      print("lng ${location["lng"]}");

      final lat = location["lat"];
      final lng = location["lng"];

      return LatLong(

        lat: lat,
        lng: lng,
      );
    } catch (e) {
      return null;
    }

  }

}

class Place {
  String? description;
  String? placeId;

  double? lat;
  double? lng;

  Place({
    this.description,
    this.placeId,
    this.lat,
    this.lng,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
    description: json["description"],
    placeId: json["place_id"],
  );

  factory Place.fromLatLngJson(Map<String, dynamic> json) => Place(
    description: json["formatted_address"],
    placeId: json["place_id"],
  );

}

class LatLong {
  double? lat;
  double? lng;

  LatLong({this.lat, this.lng});

}