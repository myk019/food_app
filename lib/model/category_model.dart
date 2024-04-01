class CategoryModelApp{
  String category;
  String image;
  String id;

  CategoryModelApp(
      {required this.category, required this.image, required this.id});

  Map<String, dynamic> toMap() {
    return {"category": this.category, "image": this.image, "id": this.id};
  }

  factory CategoryModelApp.fromMap(Map<String, dynamic> map) {
    return CategoryModelApp(
      category: map["category"] ?? "",
      image: map["image"] ?? "",
      id: map["id"] ?? "",
    );
  }

  CategoryModelApp copyWith({String? category, String? image, String? id}) {
    return CategoryModelApp(
        category: category ?? this.category,
        image: image ?? this.image,
        id: id ?? this.id);
  }
}