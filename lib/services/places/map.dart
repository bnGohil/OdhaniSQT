part of places;

class PlacePickerScreen extends StatefulWidget {
  const PlacePickerScreen({super.key, required this.onSelect});

  final Function(Place) onSelect;

  @override
  State<PlacePickerScreen> createState() => _PlacePickerScreenState();
}

class _PlacePickerScreenState extends State<PlacePickerScreen> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(-22.55941, 17.08323),
    zoom: 14.4746,
  );

  String? address;

  GlobalKey key = GlobalKey();

  PlacesNetwork placesNetwork = PlacesNetwork();

  LatLng? moveLatLng;

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      goToCurrentLocation();

    });

  }


  goToCurrentLocation() async {

    final location = await LocationService.determinePosition();

    moveCamera(LatLng(location.latitude, location.longitude));

  }

  moveCamera(LatLng latLng) async {
    final GoogleMapController controller = await _controller.future;

    final newCamera = CameraPosition(
      target: latLng,
      zoom: 18,
    );

    controller.animateCamera(CameraUpdate.newCameraPosition(newCamera));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        actions: [
          IconButton(onPressed: () {

            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return LocationSearchScreen(
                onSelect: (place) {

                  moveCamera(LatLng(place.lat ?? 0.0, place.lng ?? 0.0));

                },
              );
            },fullscreenDialog: true));

          }, icon: const Icon(Icons.search))
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onCameraIdle: () async {

              if(moveLatLng != null) {

                setState(() {
                  isLoading = true;
                });

                try {
                  final location = await placesNetwork.placesByLatLng(lat: moveLatLng!.latitude, lng: moveLatLng!.longitude);

                  if((location ?? []).isNotEmpty) {
                                    setState(() {
                                      address = location?.first.description;
                                    });
                                  }
                } catch (e) {
                  print(e);
                } finally {
                  setState(() {
                    isLoading = false;
                  });
                }

              }

            },
            onCameraMove: (position) {

              moveLatLng = position.target;

            },
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          
          const Center(child: Icon(Icons.location_searching_rounded, color: Colors.black,size: 50,)),

          Center(child: Container(
            key: key,
             height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          )),


          Positioned(
            bottom: 15,
            right: 15,
            left: 15,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Address: ${address ?? ""}",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                    ),),

                    SizedBox(
                      height: 15,
                    ),

                    Center(
                      child: InkWell(
                        onTap: () {
                          final place = Place(
                            description: address,
                            lat: moveLatLng?.latitude,
                            lng: moveLatLng?.longitude
                          );

                          widget.onSelect(place);

                          Navigator.of(context).pop();

                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: isLoading ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 2),
                              child: SizedBox(

                                width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(color: Colors.white)),
                            ) : Text("Select",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            ),)),
                      ),
                    )

                  ],
                ),
              ),
            ),
          )

        ],
      )
    );
  }
}


// Add google_maps_flutter package in pubsec.yaml

// Follow Android and iOS Setup from https://pub.dev/packages/google_maps_flutter

// Add geolocator: ^10.1.0