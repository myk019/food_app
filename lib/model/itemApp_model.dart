class itemAppModel{
  String ItemName;
  String ItemImage;
  String ItemDescription;
  int ItemPrice;
  List fav;
  String itemId;

  itemAppModel({required this.ItemName,required this.ItemDescription,required this.ItemImage,
    required this.ItemPrice,required this.fav,required this.itemId,});

  Map<String,dynamic> toMap() {
    return {
      "ItemName": this.ItemName,
      "ItemImage": this.ItemImage,
      "ItemDescription": this.ItemDescription,
      "ItemPrice": this.ItemPrice,
      "Fav":this.fav,
      "ItemId":this.itemId,
    };
  }
  factory itemAppModel.fromMap(Map<String,dynamic>map){
    return itemAppModel(
        ItemName: map["ItemName"]??"",
        ItemDescription: map["ItemDescription"]??"",
        ItemImage: map["ItemImage"]??"",
        ItemPrice: map["ItemPrice"]??0,
      fav: map["Fav"]??"",
        itemId: map["ItemId"]??"",
    );
  }

  itemAppModel copyWith({
    String? ItemName,
    String? ItemImage,
    String? ItemDescription,
    int? ItemPrice,
    List? fav,
    String? itemId,
  })
  {
    return itemAppModel(
        ItemName: ItemName??this.ItemName,
        ItemDescription: ItemDescription??this.ItemDescription,
        ItemImage: ItemImage??this.ItemImage,
        ItemPrice: ItemPrice??this.ItemPrice,
        fav: fav??this.fav,
        itemId: itemId??this.itemId,
    );

  }
}