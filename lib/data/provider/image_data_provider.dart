import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:pinterest_clone/models/image_model.dart';

class ImageDataProvider {
  String? client_id = dotenv.env['UNSPLASH_CLIENT_ID'];

  Future<List<GeneratedImage>> getImages() async {
    try {
      // Pulling random images from the unsplash API
      final response = await http.get(
        Uri.parse('https://api.unsplash.com/photos/random?count=20'),
        headers: {
          'Authorization':'Client-ID $client_id'
        }
      );

      final List<dynamic> data = json.decode(response.body);

      //  Mapping each image to a GeneratedImage object
      return data.map((item) => GeneratedImage.fromJson(item)).toList();
    } catch (e) {
      throw e.toString();
    }
  }
}

class ImageSearchDataProvider {
  String? client_id = dotenv.env['UNSPLASH_CLIENT_ID'];

  Future<List<GeneratedImage>> searchImages(String query) async {
    try {
      // Pulling images from the unsplash API via search
      final response = await http.get(
        Uri.parse('https://api.unsplash.com/search/photos?query=$query&per_page=10&order_by=relevant'),
        headers: {
          'Authorization':'Client-ID $client_id'
        }
      );

      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];

      //  Mapping each image to a GeneratedImage object
      return results.map((item) => GeneratedImage.fromJson(item)).toList();
    } catch (e) {
      throw e.toString();
    }
  }
}
