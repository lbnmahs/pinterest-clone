import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ImageDataProvider {
  String? client_id = dotenv.env['UNSPLASH_CLIENT_ID'];

  Future<List<String>> getImages() async {
    try {
      // Pulling random images from the unsplash API
      final response = await http.get(
        Uri.parse('https://api.unsplash.com/photos/random?count=30'),
        headers: {
          'Authorization':'Client-ID $client_id'
        }
      );
      if (response.statusCode == 200) {
        final List<String> images = [];
        final List<dynamic> data = json.decode(response.body);
        for (var i = 0; i < data.length; i++) {
          images.add(data[i]['urls']['regular']);
        }
        return images;
      } else {
        throw 'Failed to load images';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
