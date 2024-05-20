import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/providers/firebase_provider.dart';

import '../../../model/booking_address_model.dart';

final bookingAddressProvider=Provider((ref) => BookingDetails(firestore: ref.watch(firestoreprovider)));

class BookingDetails{
  final FirebaseFirestore _firestore;

  BookingDetails({required FirebaseFirestore firestore }):_firestore=firestore;

  CollectionReference get _booking=> _firestore.collection("BookingDetails");

  addBookingP(BookingAddressModel bookingAddressModel){
    _booking.add(bookingAddressModel.toMap()).then((value) {
      value.update(bookingAddressModel.copyWith(BookingId: value.id).toMap(),);
    });
  }


  


}