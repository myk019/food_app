class BookedItemModel{
  String BookedUser;
  String BookedUserId;
  String BookedItemName;
  double BookedItemPrice;
  int BookedItemQty;

  BookedItemModel({required this.BookedUser,required this.BookedItemName,required this.BookedItemPrice,
    required this.BookedItemQty,required this.BookedUserId});

  Map<String,dynamic> toMap(){
    return {
      "BookedUser":this.BookedUser,
      "BookedUserId":this.BookedUserId,
      "BookedItemName":this.BookedItemName,
      "BookedItemPrice":this.BookedItemPrice,
      "BookedItemQty":this.BookedItemQty,
    };
  }

  factory BookedItemModel.fromMap(Map<String,dynamic>map){
    return BookedItemModel(
        BookedUser: map["BookedUser"] ?? "",
        BookedItemName:  map["BookedUserId"] ?? "",
        BookedItemPrice:  map["BookedItemName"] ?? "",
        BookedItemQty:  map["BookedItemPrice"] ?? "",
        BookedUserId:  map["BookedItemQty"] ?? ""
    );
  }

  BookedItemModel copyWith({
    String? BookedUser,
    String? BookedUserId,
    String? BookedItemName,
    double? BookedItemPrice,
    int? BookedItemQty,
}){
    return BookedItemModel(
        BookedUser:  BookedUser ?? this.BookedUser,
        BookedItemName: BookedItemName ?? this.BookedItemName,
        BookedItemPrice: BookedItemPrice ?? this.BookedItemPrice,
        BookedItemQty: BookedItemQty ?? this.BookedItemQty,
        BookedUserId: BookedUserId ?? this.BookedUserId);

  }
}