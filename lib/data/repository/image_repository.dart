import 'package:pinterest_clone/data/provider/image_data_provider.dart';
import 'package:pinterest_clone/models/image_model.dart';

class ImageRepository {
  const ImageRepository(this.dataProvider);
  final ImageDataProvider dataProvider;

  Future<List<GeneratedImage>> getGeneratedImages() async {
    return await dataProvider.getImages();
  }
}
