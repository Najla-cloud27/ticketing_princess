// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderEvent()';
}


}

/// @nodoc
class $OrderEventCopyWith<$Res>  {
$OrderEventCopyWith(OrderEvent _, $Res Function(OrderEvent) __);
}


/// Adds pattern-matching-related methods to [OrderEvent].
extension OrderEventPatterns on OrderEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _AddPaymentMethod value)?  addPaymentMethod,TResult Function( _AddNominalPayment value)?  addNominalPayment,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _AddPaymentMethod() when addPaymentMethod != null:
return addPaymentMethod(_that);case _AddNominalPayment() when addNominalPayment != null:
return addNominalPayment(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _AddPaymentMethod value)  addPaymentMethod,required TResult Function( _AddNominalPayment value)  addNominalPayment,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _AddPaymentMethod():
return addPaymentMethod(_that);case _AddNominalPayment():
return addNominalPayment(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _AddPaymentMethod value)?  addPaymentMethod,TResult? Function( _AddNominalPayment value)?  addNominalPayment,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _AddPaymentMethod() when addPaymentMethod != null:
return addPaymentMethod(_that);case _AddNominalPayment() when addNominalPayment != null:
return addNominalPayment(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String paymentMethod,  List<OrderItem> orders)?  addPaymentMethod,TResult Function( int nominalPayment)?  addNominalPayment,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _AddPaymentMethod() when addPaymentMethod != null:
return addPaymentMethod(_that.paymentMethod,_that.orders);case _AddNominalPayment() when addNominalPayment != null:
return addNominalPayment(_that.nominalPayment);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String paymentMethod,  List<OrderItem> orders)  addPaymentMethod,required TResult Function( int nominalPayment)  addNominalPayment,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _AddPaymentMethod():
return addPaymentMethod(_that.paymentMethod,_that.orders);case _AddNominalPayment():
return addNominalPayment(_that.nominalPayment);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String paymentMethod,  List<OrderItem> orders)?  addPaymentMethod,TResult? Function( int nominalPayment)?  addNominalPayment,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _AddPaymentMethod() when addPaymentMethod != null:
return addPaymentMethod(_that.paymentMethod,_that.orders);case _AddNominalPayment() when addNominalPayment != null:
return addNominalPayment(_that.nominalPayment);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements OrderEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderEvent.started()';
}


}




/// @nodoc


class _AddPaymentMethod implements OrderEvent {
  const _AddPaymentMethod(this.paymentMethod, final  List<OrderItem> orders): _orders = orders;
  

 final  String paymentMethod;
 final  List<OrderItem> _orders;
 List<OrderItem> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}


/// Create a copy of OrderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddPaymentMethodCopyWith<_AddPaymentMethod> get copyWith => __$AddPaymentMethodCopyWithImpl<_AddPaymentMethod>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddPaymentMethod&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&const DeepCollectionEquality().equals(other._orders, _orders));
}


@override
int get hashCode => Object.hash(runtimeType,paymentMethod,const DeepCollectionEquality().hash(_orders));

@override
String toString() {
  return 'OrderEvent.addPaymentMethod(paymentMethod: $paymentMethod, orders: $orders)';
}


}

/// @nodoc
abstract mixin class _$AddPaymentMethodCopyWith<$Res> implements $OrderEventCopyWith<$Res> {
  factory _$AddPaymentMethodCopyWith(_AddPaymentMethod value, $Res Function(_AddPaymentMethod) _then) = __$AddPaymentMethodCopyWithImpl;
@useResult
$Res call({
 String paymentMethod, List<OrderItem> orders
});




}
/// @nodoc
class __$AddPaymentMethodCopyWithImpl<$Res>
    implements _$AddPaymentMethodCopyWith<$Res> {
  __$AddPaymentMethodCopyWithImpl(this._self, this._then);

  final _AddPaymentMethod _self;
  final $Res Function(_AddPaymentMethod) _then;

/// Create a copy of OrderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? paymentMethod = null,Object? orders = null,}) {
  return _then(_AddPaymentMethod(
null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,
  ));
}


}

/// @nodoc


class _AddNominalPayment implements OrderEvent {
  const _AddNominalPayment(this.nominalPayment);
  

 final  int nominalPayment;

/// Create a copy of OrderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddNominalPaymentCopyWith<_AddNominalPayment> get copyWith => __$AddNominalPaymentCopyWithImpl<_AddNominalPayment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddNominalPayment&&(identical(other.nominalPayment, nominalPayment) || other.nominalPayment == nominalPayment));
}


@override
int get hashCode => Object.hash(runtimeType,nominalPayment);

@override
String toString() {
  return 'OrderEvent.addNominalPayment(nominalPayment: $nominalPayment)';
}


}

/// @nodoc
abstract mixin class _$AddNominalPaymentCopyWith<$Res> implements $OrderEventCopyWith<$Res> {
  factory _$AddNominalPaymentCopyWith(_AddNominalPayment value, $Res Function(_AddNominalPayment) _then) = __$AddNominalPaymentCopyWithImpl;
@useResult
$Res call({
 int nominalPayment
});




}
/// @nodoc
class __$AddNominalPaymentCopyWithImpl<$Res>
    implements _$AddNominalPaymentCopyWith<$Res> {
  __$AddNominalPaymentCopyWithImpl(this._self, this._then);

  final _AddNominalPayment _self;
  final $Res Function(_AddNominalPayment) _then;

/// Create a copy of OrderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nominalPayment = null,}) {
  return _then(_AddNominalPayment(
null == nominalPayment ? _self.nominalPayment : nominalPayment // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$OrderState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderState()';
}


}

/// @nodoc
class $OrderStateCopyWith<$Res>  {
$OrderStateCopyWith(OrderState _, $Res Function(OrderState) __);
}


/// Adds pattern-matching-related methods to [OrderState].
extension OrderStatePatterns on OrderState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<OrderItem> orders,  int totalQuantity,  int totalPrice,  int paymentNominal,  String paymentMethod,  int cashierId,  String cashierName)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.orders,_that.totalQuantity,_that.totalPrice,_that.paymentNominal,_that.paymentMethod,_that.cashierId,_that.cashierName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<OrderItem> orders,  int totalQuantity,  int totalPrice,  int paymentNominal,  String paymentMethod,  int cashierId,  String cashierName)  success,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.orders,_that.totalQuantity,_that.totalPrice,_that.paymentNominal,_that.paymentMethod,_that.cashierId,_that.cashierName);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<OrderItem> orders,  int totalQuantity,  int totalPrice,  int paymentNominal,  String paymentMethod,  int cashierId,  String cashierName)?  success,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.orders,_that.totalQuantity,_that.totalPrice,_that.paymentNominal,_that.paymentMethod,_that.cashierId,_that.cashierName);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements OrderState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderState.initial()';
}


}




/// @nodoc


class _Loading implements OrderState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderState.loading()';
}


}




/// @nodoc


class _Success implements OrderState {
  const _Success(final  List<OrderItem> orders, this.totalQuantity, this.totalPrice, this.paymentNominal, this.paymentMethod, this.cashierId, this.cashierName): _orders = orders;
  

 final  List<OrderItem> _orders;
 List<OrderItem> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}

 final  int totalQuantity;
 final  int totalPrice;
 final  int paymentNominal;
 final  String paymentMethod;
 final  int cashierId;
 final  String cashierName;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other._orders, _orders)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.paymentNominal, paymentNominal) || other.paymentNominal == paymentNominal)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.cashierId, cashierId) || other.cashierId == cashierId)&&(identical(other.cashierName, cashierName) || other.cashierName == cashierName));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_orders),totalQuantity,totalPrice,paymentNominal,paymentMethod,cashierId,cashierName);

@override
String toString() {
  return 'OrderState.success(orders: $orders, totalQuantity: $totalQuantity, totalPrice: $totalPrice, paymentNominal: $paymentNominal, paymentMethod: $paymentMethod, cashierId: $cashierId, cashierName: $cashierName)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $OrderStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 List<OrderItem> orders, int totalQuantity, int totalPrice, int paymentNominal, String paymentMethod, int cashierId, String cashierName
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orders = null,Object? totalQuantity = null,Object? totalPrice = null,Object? paymentNominal = null,Object? paymentMethod = null,Object? cashierId = null,Object? cashierName = null,}) {
  return _then(_Success(
null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,null == totalQuantity ? _self.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as int,null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as int,null == paymentNominal ? _self.paymentNominal : paymentNominal // ignore: cast_nullable_to_non_nullable
as int,null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,null == cashierId ? _self.cashierId : cashierId // ignore: cast_nullable_to_non_nullable
as int,null == cashierName ? _self.cashierName : cashierName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
