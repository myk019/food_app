class itemAppModel{
  String ItemName;
  String ItemImage;
  String ItemDescription;
  int ItemPrice;
  String itemId;
  String CategoryId;

  itemAppModel({required this.ItemName,required this.ItemDescription,required this.ItemImage,
    required this.ItemPrice,required this.itemId,required this.CategoryId});

  Map<String,dynamic> toMap() {
    return {
      "ItemName": this.ItemName,
      "ItemImage": this.ItemImage,
      "ItemDescription": this.ItemDescription,
      "ItemPrice": this.ItemPrice,
      "ItemId":this.itemId,
      "CategoryId":this.CategoryId
    };
  }
  factory itemAppModel.fromMap(Map<String,dynamic>map){
    return itemAppModel(
        ItemName: map["ItemName"]??"",
        ItemDescription: map["ItemDescription"]??"",
        ItemImage: map["ItemImage"]??"",
        ItemPrice: map["ItemPrice"]??0,
        itemId: map["ItemId"]??"",
      CategoryId: map["CategoryId"]??""
    );
  }

  itemAppModel copyWith({
    String? ItemName,
    String? ItemImage,
    String? ItemDescription,
    int? ItemPrice,
    String? itemId,
    String?CategoryId
  })
  {
    return itemAppModel(
        ItemName: ItemName??this.ItemName,
        ItemDescription: ItemDescription??this.ItemDescription,
        ItemImage: ItemImage??this.ItemImage,
        ItemPrice: ItemPrice??this.ItemPrice,
        itemId: itemId??this.itemId,
      CategoryId: CategoryId??this.CategoryId
    );

  }
}