import 'dart:convert';

import 'package:dio/dio.dart';

class APIServices {
  Dio dio = Dio();

  final baseUrl =
      'https://raw.githubusercontent.com/mwgg/Airports/master/airports.json';

  Future<List<dynamic>> getData() async {
    // final respo = await dio.get(baseUrl);

    // if (respo.statusCode == 200) {
    //   return respo.data as List<dynamic>;
    // }
    // throw 'Something went wrong. Please try again later.';
    try {
      final response = await dio.get(
          'https://raw.githubusercontent.com/mwgg/Airports/master/airports.json');
      if (response.statusCode == 200) {
        final jsonString = response.data.toString();
        final respo = json.decode(jsonString);
        final decodedData = respo.values.toList();
        return decodedData;
      }
    } catch (error) {
      print('Error fetching airports: $error');
    }
    return [];
  }
}
