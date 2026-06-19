import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_aap/getx/order_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';

const String googleApiKey = "AIzaSyBglflWQihT8c4yf4q2MVa2XBtOrdAylml";

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final OrderController controller = Get.put(OrderController());
  final Completer<GoogleMapController> _mapController = Completer();

  CameraPosition? _initialCamera;
  String _currentAddress = "Finding address....";
  LatLng? _currentLatLag;
  bool _isLoadigAddress = false;
  @override
  void initState() {
    super.initState();
    _detemineInitialPosition();
  }

  Future<void> _detemineInitialPosition() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
      }
      Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      double lat = pos.latitude;
      double lng = pos.longitude;
      final saved = controller.box.read("selected_address_map");
      if (saved != null && saved is Map) {
        final s = Map<String, dynamic>.from(saved);
        final savedLat = double.tryParse(s["latiude"]?.toString() ?? "");
        final savedlng = double.tryParse(s["longitude"]?.toString() ?? "");
        if (savedLat != null && savedlng != null) {
          lat = savedLat;
          lng = savedlng;
        }
      }
      _currentLatLag = LatLng(lat, lng);
      _initialCamera = CameraPosition(target: _currentLatLag!, zoom: 16.w);
      await _updateAddressFromLatlng(_currentLatLag!);

      setState(() {});
    } catch (e) {
      _currentLatLag = LatLng(24.8629, 67.0099);
      _initialCamera = CameraPosition(target: _currentLatLag!, zoom: 12);
      _currentAddress = "Unable to find location";
      setState(() {});
    }
  }

  Future<void> _updateAddressFromLatlng(LatLng pos) async {
    setState(() {
      _isLoadigAddress = true;
      _currentAddress = "Finding address";
    });
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        pos.latitude,
        pos.longitude,
      );
      if (placemarks.isNotEmpty) {
        final p = placemarks.first;
        final addressparts = [
          if (p.street != null && p.street!.isNotEmpty) p.street,
          if (p.subLocality != null && p.subLocality!.isNotEmpty) p.subLocality,
          if (p.locality != null && p.locality!.isNotEmpty) p.locality,
          if (p.administrativeArea != null && p.administrativeArea!.isNotEmpty)
            p.administrativeArea,
          if (p.country != null && p.country!.isNotEmpty) p.country,
        ];
        _currentAddress = addressparts.join(", ");
      } else {
        _currentAddress = "${pos.latitude}, ${pos.longitude}";
      }
    } catch (e) {
      _currentAddress = "${pos.latitude}, ${pos.longitude}";
    } finally {
      setState(() {
        _isLoadigAddress = false;
      });
    }
  }

  void _onCameraIdle(CameraPosition pos) {
    final latLng = pos.target;
    _currentLatLag = latLng;
    _updateAddressFromLatlng(latLng);
  }

  void _onCameraMoveEnd(LatLng latLng) {
    _currentLatLag = latLng;
    _updateAddressFromLatlng(latLng);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Address',
          style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
        ),

        centerTitle: true,
        // actions: [SizedBox(width: 20.w)],
      ),
      body: _initialCamera == null
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 15,
                      right: 15,
                      child: GooglePlaceAutoCompleteTextField(
                        googleAPIKey: googleApiKey,
                        debounceTime: 800,
                        isLatLngRequired: true,
                        countries: const ["pk"],
                        textEditingController: TextEditingController(),
                        inputDecoration: InputDecoration(
                          hintText: "Search location",
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        getPlaceDetailWithLatLng: (prediction) async {
                          final lat = double.parse(prediction.lat!);
                          final lng = double.parse(prediction.lng!);
                          final latLng = LatLng(lat, lng);

                          final gmc = await _mapController.future;
                          gmc.animateCamera(
                            CameraUpdate.newLatLngZoom(latLng, 16),
                          );

                          _onCameraMoveEnd(latLng);
                        },

                        itemClick: (prediction) {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                    GoogleMap(
                      initialCameraPosition: _initialCamera!,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      zoomControlsEnabled: false,
                      onMapCreated: (GoogleMapController gmc) {
                        if (!_mapController.isCompleted) {
                          _mapController.complete(gmc);
                        }
                      },
                      onCameraIdle: () async {
                        final gmc = await _mapController.future;
                        final screenCenter = ScreenCoordinate(
                          // ignore: use_build_context_synchronously
                          x: (MediaQuery.of(context).size.width / 2).round(),
                          // ignore: use_build_context_synchronously
                          y: (MediaQuery.of(context).size.height / 2).round(),
                        );
                        final centerLatLng = await gmc.getLatLng(screenCenter);
                        _onCameraIdle(CameraPosition(target: centerLatLng));
                      },
                    ),
                    Center(
                      child: Icon(
                        Icons.location_pin,
                        size: 50,
                        color: Colors.red,
                      ),
                    ),
                    Positioned(
                      bottom: 80,
                      left: 20,
                      right: 20,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: _isLoadigAddress
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 18,
                                    width: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Finding address...",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              )
                            : Text(
                                _currentAddress,
                                style: TextStyle(fontSize: 16),
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_currentLatLag != null) {
                            controller.updateAddressFromMap(
                              lat: _currentLatLag!.latitude,
                              lng: _currentLatLag!.longitude,
                              addressText: _currentAddress,
                            );
                            Get.back();
                          }
                        },
                        child: Text("Save Address"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
