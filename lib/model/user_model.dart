class UserModel {
  String name;
  String email;
  String password;
  String image;
  String id;
  List cart;

  UserModel({required this.name, required this.email, required this.password,required this.image,required this.cart, required this.id,});

  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "email": this.email,
      "password": this.password,
      "image": this.image,
      "id":this.id,
      "cart":this.cart
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map["name"] ?? "",
        email: map["email"] ?? "",
        password: map["password"] ?? "",
        image: map["image"] ?? "",
      cart: map["cart"]??"",
        id: map ["id"]??""
    );
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? image,
    String? id,
    List? cart
  }) {
    return UserModel(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        image: image ?? this.image,
        cart: cart??this.cart,
        id: id??this.id
    );
  }
}
