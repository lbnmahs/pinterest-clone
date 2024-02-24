class GeneratedImage {
  final String id;
  final String url;

  const GeneratedImage({required this.id, required this.url});

  factory GeneratedImage.fromJson(Map<String, dynamic> json) {
    return GeneratedImage(
      id: json['id'],
      url: json['url'],
    );
  }
}
