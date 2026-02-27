class SearchCarousel {
  final String id;
  final String picture;
  final String title;
  final String authorName;

  SearchCarousel({
    required this.id,
    required this.picture,
    required this.title,
    required this.authorName,
  });

  factory SearchCarousel.fromJson(Map<String, dynamic> json) {
    return SearchCarousel(
      id: json['id'].toString(),
      picture: json['picture'].toString(),
      title: json['title'].toString(),
      authorName: json['authorName'].toString(),
    );
  }
}
