import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_driver/helpers/config.dart';
import 'package:taxi_driver/models/directions_model.dart';


class ApiClient {
  final Dio dio;

  ApiClient({Dio dio}):dio = dio ?? Dio();


  // factory ApiClient.instance() {
  //   final baseOptions = BaseOptions(
  //     baseUrl: Config.apiBaseUrlDirections,
  //     headers: {},
  //   );
  //   final dio = Dio(baseOptions);
  //   return ApiClient._(client: dio);
  // }

  Future<Directions> getDirections({
    @required LatLng origin,
    @required LatLng destination,
  }) async {
    final response = await dio.get(Config.apiBaseUrlDirections, queryParameters: {
      'destination': '${destination.latitude},${destination.longitude}',
      'origin': '${origin.latitude},${origin.longitude}',
      'mode':'driving',
      'key': Config.mapKey,
    });
    print('Response:$response');

    if (response.statusCode == 200) {
      return Directions.fromMap(response.data);
    }
    return null;
  }


  // Future<dynamic> get(
  //   String url, {
  //   Map<String, dynamic> queryParameters,
  // }) async {
  //   final response = await client.get(
  //     url,
  //     queryParameters: queryParameters,
  //   );
  //   return response.data;
  // }


  // Future<dynamic> post(
  //   String url, {
  //   dynamic data = const {},
  //   Map<String, dynamic> queryParameters,
  // }) async {
  //   final response = await client.post(
  //     url,
  //     data: data,
  //     queryParameters: queryParameters,
  //   );
  //   return response.data;
  // }

  // Future<dynamic> delete(
  //   String url, {
  //   dynamic data = const {},
  //   Map<String, dynamic> queryParameters,
  // }) async {
  //   final response = await client.delete(
  //     url,
  //     data: data,
  //     queryParameters: queryParameters,
  //   );
  //   return response.data;
  // }
}
