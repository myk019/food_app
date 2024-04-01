class itemAppModel{
  String ItemName;
  String ItemImage;
  String ItemDescription;
  String ItemPrice;

  itemAppModel({required this.ItemName,required this.ItemDescription,required this.ItemImage,required this.ItemPrice});

  Map<String,dynamic> toMap() {
    return {
      "ItemName": this.ItemName,
      "ItemImage": this.ItemImage,
      "ItemDescription": this.ItemDescription,
      "ItemPrice": this.ItemPrice
    };
  }
  factory itemAppModel.fromMap(Map<String,dynamic>map){
    return itemAppModel(
        ItemName: map["ItemName"]??"",
        ItemDescription: map["ItemDescription"]??"",
        ItemImage: map["ItemImage"]??"",
        ItemPrice: map["ItemPrice"]??""
    );
  }

  itemAppModel copyWith({
    String? ItemName,
    String? ItemImage,
    String? ItemDescription,
    String? ItemPrice
  })
  {
    return itemAppModel(
        ItemName: ItemName??this.ItemName,
        ItemDescription: ItemDescription??this.ItemDescription,
        ItemImage: ItemImage??this.ItemImage,
        ItemPrice: ItemPrice??this.ItemPrice
    );

  }
}