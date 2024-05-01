class BookingModel {
  String Bname;
  String Bstate;
  String Baddress;
  String Bplace;
  // String id;
  // List cart;
  // bool status;
  // List fav;

  BookingModel({required this.Bname, required this.Bstate, required this.Baddress,required this.Bplace});

  Map<String, dynamic> toMap() {
    return {
      "Bname": this.Bname,
      "Bstate": this.Bstate,
      "Baddress": this.Baddress,
      "Bplace": this.Bplace,
      // "id":this.id,
      // "cart":this.cart,
      // "status":this.status,
      // "Fav":this.fav,
    };
  }

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      Bname: map["Bname"] ?? "",
      Bstate: map["Bstate"] ?? "",
      Baddress: map["Baddress"] ?? "",
      Bplace: map["Bplace"] ?? "",
      // cart: map["cart"]??"",
      // id: map ["id"]??"",
      // status: map["status"]??"",
      // fav: map["Fav"]??"",
    );
  }

  BookingModel copyWith({
    String? Bname,
    String? Bstate,
    String? Baddress,
    String? Bplace,
    // String? id,
    // List? cart,
    // bool? status,
    // List? fav,
  }) {
    return BookingModel(
      Bname: Bname ?? this.Bname,
      Bstate: Bstate ?? this.Bstate,
      Baddress: Baddress ?? this.Baddress,
      Bplace: Bplace ?? this.Bplace,
      // cart: cart??this.cart,
      // id: id??this.id,
      // status: status??this.status,
      // fav: fav??this.fav,
    );
  }
}