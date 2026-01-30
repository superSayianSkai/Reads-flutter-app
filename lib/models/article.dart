class Blog {
  final String id;
  final String category;
  final String title;
  final bool isRecommended;
  final String duration;
  final String authorsName;
  final String occupation;
  final String date;
  final String content;

  Blog({
    required this.id,
    required this.category,
    required this.title,
    required this.isRecommended,
    required this.duration,
    required this.authorsName,
    required this.occupation,
    required this.date,
    required this.content,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'].toString(),
      category: json["category"],
      title: json["title"],
      isRecommended: json["isRecommended"],
      duration: json["duration"],
      authorsName: json["authorsName"],
      occupation: json["occupation"],
      date: json["date"],
      content: json["content"],
    );
  }
}
