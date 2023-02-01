class Photo {
  final String id;
  final String? description;
  final String url;
  final String fullHDUrl;
  final String thumbnailUrl;
  final String? userAvatar;
  final String userName;
  final String? likes;

  Photo(
      {required this.id,
      this.description,
      required this.url,
      required this.fullHDUrl,
      required this.thumbnailUrl,
      this.userAvatar,
      required this.userName,
      this.likes});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json["id"],
      description: json["description"] ?? "",
      url: json["urls"]["regular"],
      fullHDUrl: json["urls"]["full"],
      thumbnailUrl: json["urls"]["small"],
      userName: json["user"]["name"],
      userAvatar: json["user"]["profile_image"]["medium"],
      likes: json["likes"].toString(),
    );
  }
}
