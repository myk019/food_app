
import 'package:riverpod/riverpod.dart';

import '../repository/payment_repository.dart';

final paymentcontrolleprovider = Provider((ref) => PaymentController(paymentRepository: ref.watch(paymentrepositoryprovider)));

class PaymentController {
  final PaymentRepository _paymentRepository;

  PaymentController({required PaymentRepository paymentRepository})
      : _paymentRepository = paymentRepository;

  paymentFunction({required cardname, required number, required date, required cvv}) {
    _paymentRepository.paymentDetails(cardname, number, date, cvv);
  }
}
