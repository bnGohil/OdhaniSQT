// part of places;
//
// class LocationSearchScreen extends StatefulWidget {
//   const LocationSearchScreen({super.key, required this.onSelect});
//
//   final Function(Place) onSelect;
//
//   @override
//   State<LocationSearchScreen> createState() => _LocationSearchScreenState();
// }
//
// class _LocationSearchScreenState extends State<LocationSearchScreen> {
//
//   List<Place> places = [];
//
//   PlacesNetwork placesNetwork = PlacesNetwork();
//
//   Timer? timer;
//
//   bool isLoading = false;
//
//   search(String search) {
//
//     timer?.cancel();
//
//     timer = Timer(const Duration(milliseconds: 500), () {
//
//       fetchPlaces(search);
//
//     });
//
//   }
//
//   fetchPlaces(String search) async {
//
//     if(search.isEmpty) {
//       setState(() {
//         places = [];
//       });
//       return;
//     }
//
//     setState(() {
//       isLoading = true;
//     });
//
//     try {
//       final places = await placesNetwork.placesByName(q: search);
//
//       setState(() {
//         this.places = places ?? [];
//       });
//
//     } catch (e) {
//       print(e);
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//
//   }
//
//   selectLocation({required Place place}) async {
//     setState(() {
//       isLoading = true;
//     });
//
//     try {
//       final placeData = await placesNetwork.latLongFromPlaceId(placeID: place.placeId ?? "");
//
//       print("placeData ${placeData}");
//
//       if(placeData != null) {
//
//
//         widget.onSelect(Place(
//           placeId: place.placeId,
//           description: place.description,
//           lat: placeData.lat,
//           lng: placeData.lng
//         ));
//         Navigator.of(context).pop();
//       }
//
//     } catch (e) {
//       print(e);
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           onChanged: (value) {
//             search(value);
//           },
//           autofocus: true,
//           decoration: const InputDecoration(
//             hintText: "Search"
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           ListView.builder(itemBuilder: (context, index) {
//
//             final place = places[index];
//
//             return InkWell(
//               onTap: () {
//
//                 selectLocation(place: place);
//               },
//               child: Container(
//                 padding: EdgeInsets.symmetric(vertical: 12),
//                 margin: EdgeInsets.symmetric(horizontal: 15),
//                 decoration: BoxDecoration(
//                   border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.1)))
//                 ),
//                 child: Row(
//                   children: [
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     Expanded(
//                       child: Text(place.description ?? "",style: const TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 16
//                       ),),
//                     ),
//                     const Icon(Icons.arrow_forward_ios_rounded,size: 20,)
//                   ],
//                 ),
//               ),
//             );
//
//           }, itemCount: places.length),
//           if(isLoading)
//           Container(
//             color: Colors.black12,
//             alignment: Alignment.center,
//             child: const SizedBox(
//                 width: 30,
//                 height: 30,
//                 child: CircularProgressIndicator(color: Colors.black,strokeWidth: 4,)),
//           )
//         ],
//       ),
//     );
//   }
// }
