import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class ActiveTripController extends GetxController {
  RxBool stopIsLoading = false.obs;

  /// list of stops (names)
  RxList<String> tripStops = <String>[].obs;

  final Dio _dio = Dio();

  /// ADD TRIP STOP API CALL
  Future<void> addTripStops(
    BuildContext context,
    int tripId,
    String stopName,
    double lat,
    double lng,
  ) async {
    stopIsLoading.value = true;

    try {
      /// ⚠️ Dummy API (replace with your real endpoint)
      final response = await _dio.post(
        'https://example.com/api/trip/add-stop',
        data: {
          "trip_id": tripId,
          "stop_name": stopName,
          "latitude": lat,
          "longitude": lng,
        },
      );

      log('Add stop response: ${response.data}');

      Get.snackbar(
        "Success",
        "Stop added successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      log('Add stop error: $e');

      Get.snackbar(
        "Error",
        "Failed to add stop",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      stopIsLoading.value = false;
    }
  }
}
