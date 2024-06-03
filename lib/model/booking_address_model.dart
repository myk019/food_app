class BookingAddressModel {

  String BName;
  String BState;
  String BAddress;
  String BArea;
  String BLandmark;
  int BPincode;
  String BTown;
  int BPhone;
  String BuyerId;
  String BookingId;
  List AllProducts;
  double TotalPrice;
  String userId;

  BookingAddressModel({required this.BName, required this.BState, required this.BAddress,
    required this.BuyerId,required this.BookingId,required this.AllProducts,required this.TotalPrice,
    required this.BArea,required this.BLandmark, required this.BPincode, required this.BTown,required this.BPhone, required this.userId});

  Map<String, dynamic> toMap() {
    return {
      "userId": this.userId,
      "BName": this.BName,
      "BState": this.BState,
      "BAddress": this.BAddress,
      "BArea":this.BArea,
      "BLandmark":this.BLandmark,
      "BPincode":this.BPincode,
      "BTown":this.BTown,
      "BPhone":this.BPhone,
      "BuyerId":this.BuyerId,
      "BookingId":this.BookingId,
      "AllProducts":this.AllProducts,
      "TotalPrice":this.TotalPrice,

    };
  }

  factory BookingAddressModel.fromMap(Map<String, dynamic> map) {
    return BookingAddressModel(
      userId: map["userId"] ?? "",
      BName: map["Bname"] ?? "",
      BState: map["Bstate"] ?? "",
      BAddress: map["Baddress"] ?? "",
      BArea: map["BArea"] ?? "",
      BLandmark: map["BLandmark"] ?? "",
      BPincode: map["BPincode"] ?? "",
      BTown: map["BTown"] ?? "",
      BPhone: map["BPhone"]??"",
      BuyerId:map["Buyerid"]?? '',
      BookingId: map["Bookingid"]??'',
      AllProducts: map["AllProducts"]??[],
      TotalPrice: map["TotalPrice"]??"",


    );
  }

  BookingAddressModel copyWith({
    String? BName,
    String? BState,
    String? BAddress,
    String? BookingId,
    String? BuyerId,
    String? BArea,
    String? BLandmark,
    int? BPincode,
    String? BTown,
    int? BPhone,
    List? AllProducts,
    double? TotalPrice,
    String? userId

  }) {
    return BookingAddressModel(
      userId: userId?? this.userId,
      BName: BName ?? this.BName,
      BState: BState ?? this.BState,
      BAddress: BAddress ?? this.BAddress,
      BuyerId: BuyerId??this.BuyerId,
      BArea: BArea ??this.BArea,
      BLandmark: BLandmark ?? this.BLandmark,
      BPincode: BPincode??this.BPincode,
      BTown: BTown?? this.BTown,
      BPhone: BPhone?? this.BPhone,
      BookingId: BookingId??this.BookingId,
      AllProducts: AllProducts??this.AllProducts,
      TotalPrice: TotalPrice??this.TotalPrice,

    );
  }
}