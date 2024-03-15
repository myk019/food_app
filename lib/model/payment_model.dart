class PaymentModel {
  String cardname;
  String number;
  String date;
  String cvv;

  PaymentModel({required this.cardname, required this.number, required this.date,required this.cvv});

  Map<String, dynamic> toMap() {
    return {
      "cardname": this.cardname,
      "number": this.number,
      "date": this.date,
      "cvv": this.cvv
    };
  }

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
        cardname: map["cardname"] ?? "",
        number: map["number"] ?? "",
        date: map["date"] ?? "",
        cvv: map["cvv"] ?? "");
  }

  PaymentModel copyWith({
    String? cardname,
    String? number,
    String? date,
    String? cvv,
  }) {
    return PaymentModel(
        cardname: cardname ?? this.cardname,
        number: number ?? this.number,
        date: date ?? this.date,
        cvv: cvv ?? this.cvv);
  }
}