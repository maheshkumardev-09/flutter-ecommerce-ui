import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_aap/getx/active_trip_controller.dart';
import 'package:e_commerce_aap/getx/app_constant.dart';

class AddStopScreen extends StatefulWidget {
  final int tripId;
  const AddStopScreen({super.key, required this.tripId});

  @override
  State<AddStopScreen> createState() => _AddStopScreenState();
}

class _AddStopScreenState extends State<AddStopScreen> {
  GoogleMapController? mapController;
  final activeTripController = Get.find<ActiveTripController>();
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;
  LatLng currentLatLng = const LatLng(24.8607, 67.0011);
  List<dynamic> suggestions = [];

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) => mapController = controller,
            initialCameraPosition: CameraPosition(
              target: currentLatLng,
              zoom: 14,
            ),
            markers: {
              Marker(
                markerId: const MarkerId("selected-location"),
                position: currentLatLng,
              ),
            },
          ),
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.sp),
                        margin: EdgeInsets.only(right: 6.sp),
                        decoration: BoxDecoration(
                          // color: AppColors.textFieldBackground,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          // color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: "Search Location...",
                          suffixIcon: IconButton(
                            onPressed: () {
                              _searchController.clear();
                            },
                            icon: Icon(Icons.close),
                          ),
                        ),
                        onChanged: onSearchChanged,
                      ),
                    ),
                  ],
                ),

                /// 🔽 SEARCH RESULTS DROPDOWN
                if (suggestions.isNotEmpty)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 8),
                      ],
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: suggestions.length,
                      itemBuilder: (context, index) {
                        final s = suggestions[index];
                        return ListTile(
                          title: Text(s["description"]),
                          onTap: () {
                            _searchController.text = s["description"];
                            suggestions.clear();
                            setState(() {});
                            goToPlace(s["place_id"]);
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 16,
            right: 75,
            child: Obx(
              () => ElevatedButton(
                child: Text("Add Stop"),
                onPressed: () {
                  if (_searchController.text.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Please enter a location",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    // SnackbarService.show(
                    // message: "Ple.ki[ase enter a location",
                    // isError: true,
                    // );
                    Get.snackbar("Title", "Message");
                  } else {
                    activeTripController.tripStops.add(_searchController.text);
                    activeTripController.addTripStops(
                      context,
                      widget.tripId,
                      _searchController.text,
                      currentLatLng.latitude,
                      currentLatLng.longitude,
                    );
                    log('SearchController ${activeTripController.tripStops}');
                    log('SearchController ${_searchController.text}');
                    log('currentLatLng $currentLatLng');
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔍 Debounced Google Places Search
  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      fetchSuggestions(query);
    });
  }

  /// 📌 Autocomplete search
  Future<void> fetchSuggestions(String query) async {
    if (query.isEmpty) {
      setState(() => suggestions = []);
      return;
    }
    final url = "https://maps.googleapis.com/maps/api/place/autocomplete/json";
    try {
      final response = await Dio().get(
        url,
        queryParameters: {
          "input": query,
          "key": AppConstant.googleApiKey,
          "components": "country:pk",
        },
      );
      suggestions = response.data["predictions"];
      setState(() {});
    } catch (e) {
      print("Autocomplete Error: $e");
    }
  }

  /// 📍 Fetch selected place lat/lng
  Future<void> goToPlace(String placeId) async {
    final url = "https://maps.googleapis.com/maps/api/place/details/json";

    try {
      final response = await Dio().get(
        url,
        queryParameters: {"place_id": placeId, "key": AppConstant.googleApiKey},
      );

      final location = response.data["result"]["geometry"]["location"];

      double lat = location["lat"];
      double lng = location["lng"];

      currentLatLng = LatLng(lat, lng);

      mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(currentLatLng, 15),
      );
      setState(() {});
    } catch (e) {
      print("Place Details Error: $e");
    }
  }
}
