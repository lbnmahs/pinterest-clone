import 'package:pinterest_clone/data/provider/image_data_provider.dart';
import 'package:pinterest_clone/models/image_model.dart';

class ImageRepository {
  const ImageRepository(this.dataProvider);
  final ImageDataProvider dataProvider;

  Future<List<GeneratedImage>> getGeneratedImages() async {
    return await dataProvider.getImages();
  }
}

class ImageSearchRepository {
  const ImageSearchRepository(this.dataProvider);
  final ImageSearchDataProvider dataProvider;

  Future<List<GeneratedImage>> searchImages(String query) async {
    return await dataProvider.searchImages(query);
  }
}
