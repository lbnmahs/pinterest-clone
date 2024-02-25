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
        Uri.parse('https://api.unsplash.com/photos/random?count=30'),
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
