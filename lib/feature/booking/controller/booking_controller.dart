import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/feature/booking/repository/booking_repository.dart';
import 'package:food_app/model/booking_address_model.dart';

final BookingAddressController=Provider((ref) => BookingController(bookingDetails: ref.watch(bookingAddressProvider)));

class BookingController{
  final BookingDetails _bookingDetails;

  BookingController({required BookingDetails bookingDetails}):_bookingDetails=bookingDetails;

addBookingC(BookingAddressModel bookingAddressModelC){
  _bookingDetails.addBookingP(bookingAddressModelC);
}



}