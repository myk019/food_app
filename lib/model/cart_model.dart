import 'dart:ffi';

class CartModel{
  String ItemName;
  int ItemPrice;
  int ItemQty;
  String ItemId;
  String ItemImage;
  String ItemDescriptionofslect;

  CartModel({required this.ItemName, required this.ItemId, required this.ItemPrice,
    required this.ItemQty,required this.ItemImage,required this.ItemDescriptionofslect,});

  Map<String, dynamic> toMap() {
    return {
      "ItemName": this.ItemName,
      "ItemPrice": this.ItemPrice,
      "ItemQty": this.ItemQty,
      "ItemId": this.ItemId,
      "ItemImage":this.ItemImage,
      "ItemDescriptionofslect":this.ItemDescriptionofslect,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
        ItemName: map["ItemName"] ?? "",
        ItemId: map["ItemId"] ?? "",
        ItemQty: map["ItemQty"] ?? "",
        ItemPrice: map["ItemPrice"] ?? 0,
      ItemImage:map["itemImage"]??"",
        ItemDescriptionofslect:map["ItemDescriptionofslect"]??"",
    );
  }

  CartModel copyWith({
    String? ItemName,
    String? ItemId,
    int? ItemQty,
    int? ItemPrice,
    String? ItemImage,
    String? ItemDescriptionofslect,
  }) {
    return CartModel(
        ItemPrice: ItemPrice ?? this.ItemPrice,
        ItemQty: ItemQty ?? this.ItemQty,
        ItemId: ItemId ?? this.ItemId,
        ItemName: ItemName ?? this.ItemName,
      ItemImage: ItemImage??this.ItemImage,
        ItemDescriptionofslect:ItemDescriptionofslect??this.ItemDescriptionofslect,

    );
  }
}