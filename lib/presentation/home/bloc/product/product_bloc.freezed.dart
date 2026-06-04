// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent()';
}


}

/// @nodoc
class $ProductEventCopyWith<$Res>  {
$ProductEventCopyWith(ProductEvent _, $Res Function(ProductEvent) __);
}


/// Adds pattern-matching-related methods to [ProductEvent].
extension ProductEventPatterns on ProductEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _GetProducts value)?  getProducts,TResult Function( _SyncProducts value)?  syncProducts,TResult Function( _GetProductsLocal value)?  getLocalProducts,TResult Function( _CreateTicket value)?  createTicket,TResult Function( _UpdateTicket value)?  updateTicket,TResult Function( _DeleteTicket value)?  deleteTicket,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetProducts() when getProducts != null:
return getProducts(_that);case _SyncProducts() when syncProducts != null:
return syncProducts(_that);case _GetProductsLocal() when getLocalProducts != null:
return getLocalProducts(_that);case _CreateTicket() when createTicket != null:
return createTicket(_that);case _UpdateTicket() when updateTicket != null:
return updateTicket(_that);case _DeleteTicket() when deleteTicket != null:
return deleteTicket(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _GetProducts value)  getProducts,required TResult Function( _SyncProducts value)  syncProducts,required TResult Function( _GetProductsLocal value)  getLocalProducts,required TResult Function( _CreateTicket value)  createTicket,required TResult Function( _UpdateTicket value)  updateTicket,required TResult Function( _DeleteTicket value)  deleteTicket,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _GetProducts():
return getProducts(_that);case _SyncProducts():
return syncProducts(_that);case _GetProductsLocal():
return getLocalProducts(_that);case _CreateTicket():
return createTicket(_that);case _UpdateTicket():
return updateTicket(_that);case _DeleteTicket():
return deleteTicket(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _GetProducts value)?  getProducts,TResult? Function( _SyncProducts value)?  syncProducts,TResult? Function( _GetProductsLocal value)?  getLocalProducts,TResult? Function( _CreateTicket value)?  createTicket,TResult? Function( _UpdateTicket value)?  updateTicket,TResult? Function( _DeleteTicket value)?  deleteTicket,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetProducts() when getProducts != null:
return getProducts(_that);case _SyncProducts() when syncProducts != null:
return syncProducts(_that);case _GetProductsLocal() when getLocalProducts != null:
return getLocalProducts(_that);case _CreateTicket() when createTicket != null:
return createTicket(_that);case _UpdateTicket() when updateTicket != null:
return updateTicket(_that);case _DeleteTicket() when deleteTicket != null:
return deleteTicket(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  getProducts,TResult Function()?  syncProducts,TResult Function()?  getLocalProducts,TResult Function( Product model)?  createTicket,TResult Function( Product model)?  updateTicket,TResult Function( int id)?  deleteTicket,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetProducts() when getProducts != null:
return getProducts();case _SyncProducts() when syncProducts != null:
return syncProducts();case _GetProductsLocal() when getLocalProducts != null:
return getLocalProducts();case _CreateTicket() when createTicket != null:
return createTicket(_that.model);case _UpdateTicket() when updateTicket != null:
return updateTicket(_that.model);case _DeleteTicket() when deleteTicket != null:
return deleteTicket(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  getProducts,required TResult Function()  syncProducts,required TResult Function()  getLocalProducts,required TResult Function( Product model)  createTicket,required TResult Function( Product model)  updateTicket,required TResult Function( int id)  deleteTicket,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _GetProducts():
return getProducts();case _SyncProducts():
return syncProducts();case _GetProductsLocal():
return getLocalProducts();case _CreateTicket():
return createTicket(_that.model);case _UpdateTicket():
return updateTicket(_that.model);case _DeleteTicket():
return deleteTicket(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  getProducts,TResult? Function()?  syncProducts,TResult? Function()?  getLocalProducts,TResult? Function( Product model)?  createTicket,TResult? Function( Product model)?  updateTicket,TResult? Function( int id)?  deleteTicket,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetProducts() when getProducts != null:
return getProducts();case _SyncProducts() when syncProducts != null:
return syncProducts();case _GetProductsLocal() when getLocalProducts != null:
return getLocalProducts();case _CreateTicket() when createTicket != null:
return createTicket(_that.model);case _UpdateTicket() when updateTicket != null:
return updateTicket(_that.model);case _DeleteTicket() when deleteTicket != null:
return deleteTicket(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ProductEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent.started()';
}


}




/// @nodoc


class _GetProducts implements ProductEvent {
  const _GetProducts();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetProducts);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent.getProducts()';
}


}




/// @nodoc


class _SyncProducts implements ProductEvent {
  const _SyncProducts();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncProducts);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent.syncProducts()';
}


}




/// @nodoc


class _GetProductsLocal implements ProductEvent {
  const _GetProductsLocal();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetProductsLocal);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent.getLocalProducts()';
}


}




/// @nodoc


class _CreateTicket implements ProductEvent {
  const _CreateTicket(this.model);
  

 final  Product model;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTicketCopyWith<_CreateTicket> get copyWith => __$CreateTicketCopyWithImpl<_CreateTicket>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTicket&&(identical(other.model, model) || other.model == model));
}


@override
int get hashCode => Object.hash(runtimeType,model);

@override
String toString() {
  return 'ProductEvent.createTicket(model: $model)';
}


}

/// @nodoc
abstract mixin class _$CreateTicketCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory _$CreateTicketCopyWith(_CreateTicket value, $Res Function(_CreateTicket) _then) = __$CreateTicketCopyWithImpl;
@useResult
$Res call({
 Product model
});




}
/// @nodoc
class __$CreateTicketCopyWithImpl<$Res>
    implements _$CreateTicketCopyWith<$Res> {
  __$CreateTicketCopyWithImpl(this._self, this._then);

  final _CreateTicket _self;
  final $Res Function(_CreateTicket) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? model = null,}) {
  return _then(_CreateTicket(
null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as Product,
  ));
}


}

/// @nodoc


class _UpdateTicket implements ProductEvent {
  const _UpdateTicket(this.model);
  

 final  Product model;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTicketCopyWith<_UpdateTicket> get copyWith => __$UpdateTicketCopyWithImpl<_UpdateTicket>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTicket&&(identical(other.model, model) || other.model == model));
}


@override
int get hashCode => Object.hash(runtimeType,model);

@override
String toString() {
  return 'ProductEvent.updateTicket(model: $model)';
}


}

/// @nodoc
abstract mixin class _$UpdateTicketCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory _$UpdateTicketCopyWith(_UpdateTicket value, $Res Function(_UpdateTicket) _then) = __$UpdateTicketCopyWithImpl;
@useResult
$Res call({
 Product model
});




}
/// @nodoc
class __$UpdateTicketCopyWithImpl<$Res>
    implements _$UpdateTicketCopyWith<$Res> {
  __$UpdateTicketCopyWithImpl(this._self, this._then);

  final _UpdateTicket _self;
  final $Res Function(_UpdateTicket) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? model = null,}) {
  return _then(_UpdateTicket(
null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as Product,
  ));
}


}

/// @nodoc


class _DeleteTicket implements ProductEvent {
  const _DeleteTicket(this.id);
  

 final  int id;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteTicketCopyWith<_DeleteTicket> get copyWith => __$DeleteTicketCopyWithImpl<_DeleteTicket>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteTicket&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ProductEvent.deleteTicket(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteTicketCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory _$DeleteTicketCopyWith(_DeleteTicket value, $Res Function(_DeleteTicket) _then) = __$DeleteTicketCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$DeleteTicketCopyWithImpl<$Res>
    implements _$DeleteTicketCopyWith<$Res> {
  __$DeleteTicketCopyWithImpl(this._self, this._then);

  final _DeleteTicket _self;
  final $Res Function(_DeleteTicket) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DeleteTicket(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ProductState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState()';
}


}

/// @nodoc
class $ProductStateCopyWith<$Res>  {
$ProductStateCopyWith(ProductState _, $Res Function(ProductState) __);
}


/// Adds pattern-matching-related methods to [ProductState].
extension ProductStatePatterns on ProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Product> products)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.products);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Product> products)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.products);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Product> products)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.products);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ProductState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState.initial()';
}


}




/// @nodoc


class _Loading implements ProductState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState.loading()';
}


}




/// @nodoc


class _Success implements ProductState {
  const _Success(final  List<Product> products): _products = products;
  

 final  List<Product> _products;
 List<Product> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other._products, _products));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'ProductState.success(products: $products)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 List<Product> products
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? products = null,}) {
  return _then(_Success(
null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,
  ));
}


}

/// @nodoc


class _Error implements ProductState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProductState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
