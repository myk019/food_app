class BookingAddressModel {
  String BName;
  String BState;
  String BAddress;
  String BPlace;
  String BArea;
  String BLandmark;
  String BPincode;
  String BTown;


  BookingAddressModel({required this.BName, required this.BState, required this.BAddress,
    required this.BPlace, required this.BArea,required this.BLandmark, required this.BPincode, required this.BTown});

  Map<String, dynamic> toMap() {
    return {
      "BName": this.BName,
      "BState": this.BState,
      "BAddress": this.BAddress,
      "BPlace": this.BPlace,
      "BArea":this.BArea,
      "BLandmark":this.BLandmark,
    "BPincode":this.BPincode,
    "BTown":this.BTown

    };
  }

  factory BookingAddressModel.fromMap(Map<String, dynamic> map) {
    return BookingAddressModel(
      BName: map["Bname"] ?? "",
      BState: map["Bstate"] ?? "",
      BAddress: map["Baddress"] ?? "",
      BPlace: map["Bplace"] ?? "",
      BArea: map["BArea"] ?? "",
      BLandmark: map["BLandmark"] ?? "",
      BPincode: map["BPincode"] ?? "",
      BTown: map["BTown"] ?? "",

    );
  }

  BookingAddressModel copyWith({
    String? BName,
    String? BState,
    String? BAddress,
    String? BPlace,
    String? BArea,
    String? BLandmark,
    String? BPincode,
    String? BTown

  }) {
    return BookingAddressModel(
      BName: BName ?? this.BName,
      BState: BState ?? this.BState,
      BAddress: BAddress ?? this.BAddress,
      BPlace: BPlace ?? this.BPlace,
      BArea: BArea ??this.BArea,
      BLandmark: BLandmark ?? this.BLandmark,
      BPincode: BPincode??this.BPincode,
      BTown: BTown?? this.BTown
    );
  }
}