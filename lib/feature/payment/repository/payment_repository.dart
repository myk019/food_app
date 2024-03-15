import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/core/providers/firebase_provider.dart';
import 'package:food_app/model/payment_model.dart';
import 'package:riverpod/riverpod.dart';



final paymentrepositoryprovider=Provider((ref) => PaymentRepository(firestore: ref.watch(firestoreprovider)));

class PaymentRepository {
  final FirebaseFirestore _firestore;

  PaymentRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _payment => _firestore.collection("Payment details");

  paymentDetails(cardname, number, date, cvv) {
    PaymentModel payment = PaymentModel(cardname: cardname, number: number, date: date, cvv: cvv);

    _payment.doc(cardname).set(payment.toMap());
  }
}
