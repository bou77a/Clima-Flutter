import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.latitude, this.longitude, this.key);

  final latitude;
  final longitude;
  final String key;

  Future getData() async {
    // Ensure that latitude and longitude are not null
    if (latitude == null || longitude == null) {
      print("Location not available");
      return;
    }

    // Construct the URI with query parameters, ensuring values are strings
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': latitude.toString(),
      'lon': longitude.toString(),
      'appid': key,
      'units': 'metric', // Optional: for temperature in Celsius
    });

    // Make the GET request
    http.Response response = await http.get(url);

    // Check if the response was successful
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      print("bouga bouga");

      return data;
    } else {
      print("Failed to get data: ${response.statusCode}");
    }
  }
}
