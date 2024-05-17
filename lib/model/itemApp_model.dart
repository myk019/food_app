class itemAppModel{
  String ItemName;
  String ItemImage;
  String ItemDescription;
  int ItemPrice;
  String itemId;
  String categoryId;

  itemAppModel({required this.ItemName,required this.ItemDescription,required this.ItemImage,
    required this.ItemPrice,required this.itemId,required this.categoryId});

  Map<String,dynamic> toMap() {
    return {
      "ItemName": this.ItemName,
      "ItemImage": this.ItemImage,
      "ItemDescription": this.ItemDescription,
      "ItemPrice": this.ItemPrice,
      "ItemId":this.itemId,
      "categoryId":this.categoryId
    };
  }
  factory itemAppModel.fromMap(Map<String,dynamic>map){
    return itemAppModel(
        ItemName: map["ItemName"]??"",
        ItemDescription: map["ItemDescription"]??"",
        ItemImage: map["ItemImage"]??"",
        ItemPrice: map["ItemPrice"]??0,
        itemId: map["ItemId"]??"",
      categoryId: map["categoryId"]??""
    );
  }

  itemAppModel copyWith({
    String? ItemName,
    String? ItemImage,
    String? ItemDescription,
    int? ItemPrice,
    String? itemId,
    String?categoryId
  })
  {
    return itemAppModel(
        ItemName: ItemName??this.ItemName,
        ItemDescription: ItemDescription??this.ItemDescription,
        ItemImage: ItemImage??this.ItemImage,
        ItemPrice: ItemPrice??this.ItemPrice,
        itemId: itemId??this.itemId,
      categoryId: categoryId??this.categoryId
    );

  }
}