part of 'order_bloc.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.started() = _Started;
  // memasukkan payment method
  const factory OrderEvent.addPaymentMethod(
    String paymentMethod,
    List<OrderItem> orders,
  ) = _AddPaymentMethod;
  // tambah nominal payment
  const factory OrderEvent.addNominalPayment(int nominalPayment) =
      _AddNominalPayment;
}
