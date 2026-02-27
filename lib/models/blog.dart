class Blog {
  final String id;
  final String category;
  final String title;
  final bool isRecommended;
  final String duration;
  final String type;
  final String authorsName;
  final String occupation;
  final String date;
  final String content;
  final String image;
  final String picture;

  Blog({
    required this.id,
    required this.category,
    required this.title,
    this.isRecommended = false,
    required this.duration,
    required this.type,
    required this.authorsName,
    required this.occupation,
    required this.date,
    required this.content,
    required this.image,
    required this.picture,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'].toString(),
      category: json["category"],
      title: json["title"],
      isRecommended: json["isRecommended"] ?? false,
      duration: json["duration"],
      type: json["type"],
      authorsName: json["authorsName"],
      occupation: json["occupation"],
      date: json["date"],
      content: json["content"],
      image: json['image'],
      picture: json['picture'],
    );
  }
}
