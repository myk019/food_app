class UserModel {
  String name;
  String email;
  String password;
  String image;
  String id;
  List cart;
  bool status;
  List fav;
  List bookedItems;
  List search;

  UserModel({required this.name, required this.email, required this.password,required this.image,
    required this.cart, required this.id,required this.status,required this.fav,required this.bookedItems,required this.search});

  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "email": this.email,
      "password": this.password,
      "image": this.image,
      "id":this.id,
      "cart":this.cart,
      "status":this.status,
      "Fav":this.fav,
      "bookedItems":this.bookedItems,
      "search":this.search
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map["name"] ?? "",
        email: map["email"] ?? "",
        password: map["password"] ?? "",
        image: map["image"] ?? "",
      cart: map["cart"]??"",
        id: map ["id"]??"",
      status: map["status"]??"",
      fav: map["Fav"]??"",
      bookedItems: map["bookedItems"]??"",
      search: map["search"]??""
    );
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? image,
    String? id,
    List? cart,
    bool? status,
    List? fav,
    List? bookedItems,
    List? search
  }) {
    return UserModel(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        image: image ?? this.image,
        cart: cart??this.cart,
        id: id??this.id,
        status: status??this.status,
      fav: fav??this.fav,
      bookedItems: bookedItems??this.bookedItems,
      search: search??this.search
    );
  }
}
