class Category {
  final String icon;
  final String name;

  Category({
    required this.icon,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      icon: json['icon'] as String,
      name: json['name'] as String,
    );
  }
} 