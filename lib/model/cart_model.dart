class CartModel{
  String ItemName;
  String ItemPrice;
  String ItemQty;
  String ItemId;

  CartModel({required this.ItemName, required this.ItemId, required this.ItemPrice,required this.ItemQty});

  Map<String, dynamic> toMap() {
    return {
      "ItemName": this.ItemName,
      "ItemPrice": this.ItemPrice,
      "ItemQty": this.ItemQty,
      "ItemId": this.ItemId
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
        ItemName: map["ItemName"] ?? "",
        ItemId: map["ItemId"] ?? "",
        ItemQty: map["ItemQty"] ?? "",
        ItemPrice: map["ItemPrice"] ?? "");
  }

  CartModel copyWith({
    String? ItemName,
    String? ItemId,
    String? ItemQty,
    String? ItemPrice,
  }) {
    return CartModel(
        ItemPrice: ItemPrice ?? this.ItemPrice,
        ItemQty: ItemQty ?? this.ItemQty,
        ItemId: ItemId ?? this.ItemId,
        ItemName: ItemName ?? this.ItemName);
  }
}