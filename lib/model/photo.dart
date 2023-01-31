class Photo {
  final String id;
  final String? description;
  final String url;
  final String thumbnailUrl;
  final String userName;

  Photo(
      {required this.id,
      this.description,
      required this.url,
      required this.thumbnailUrl,
      required this.userName});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json["id"],
      description: json["description"] ?? "",
      url: json["urls"]["full"],
      thumbnailUrl: json["urls"]["regular"],
      userName: json["user"]["name"],
    );
  }
}
