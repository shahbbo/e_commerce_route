// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wish_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WishListState {
  WishListStatus get status => throw _privateConstructorUsedError;
  WishListEntity? get wishListEntity => throw _privateConstructorUsedError;
  AddRemoveWishListEntity? get addToWishListEntity =>
      throw _privateConstructorUsedError;
  Failures? get failures => throw _privateConstructorUsedError;

  /// Create a copy of WishListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WishListStateCopyWith<WishListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishListStateCopyWith<$Res> {
  factory $WishListStateCopyWith(
          WishListState value, $Res Function(WishListState) then) =
      _$WishListStateCopyWithImpl<$Res, WishListState>;
  @useResult
  $Res call(
      {WishListStatus status,
      WishListEntity? wishListEntity,
      AddRemoveWishListEntity? addToWishListEntity,
      Failures? failures});
}

/// @nodoc
class _$WishListStateCopyWithImpl<$Res, $Val extends WishListState>
    implements $WishListStateCopyWith<$Res> {
  _$WishListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WishListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? wishListEntity = freezed,
    Object? addToWishListEntity = freezed,
    Object? failures = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WishListStatus,
      wishListEntity: freezed == wishListEntity
          ? _value.wishListEntity
          : wishListEntity // ignore: cast_nullable_to_non_nullable
              as WishListEntity?,
      addToWishListEntity: freezed == addToWishListEntity
          ? _value.addToWishListEntity
          : addToWishListEntity // ignore: cast_nullable_to_non_nullable
              as AddRemoveWishListEntity?,
      failures: freezed == failures
          ? _value.failures
          : failures // ignore: cast_nullable_to_non_nullable
              as Failures?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WishListStateImplCopyWith<$Res>
    implements $WishListStateCopyWith<$Res> {
  factory _$$WishListStateImplCopyWith(
          _$WishListStateImpl value, $Res Function(_$WishListStateImpl) then) =
      __$$WishListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WishListStatus status,
      WishListEntity? wishListEntity,
      AddRemoveWishListEntity? addToWishListEntity,
      Failures? failures});
}

/// @nodoc
class __$$WishListStateImplCopyWithImpl<$Res>
    extends _$WishListStateCopyWithImpl<$Res, _$WishListStateImpl>
    implements _$$WishListStateImplCopyWith<$Res> {
  __$$WishListStateImplCopyWithImpl(
      _$WishListStateImpl _value, $Res Function(_$WishListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WishListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? wishListEntity = freezed,
    Object? addToWishListEntity = freezed,
    Object? failures = freezed,
  }) {
    return _then(_$WishListStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WishListStatus,
      wishListEntity: freezed == wishListEntity
          ? _value.wishListEntity
          : wishListEntity // ignore: cast_nullable_to_non_nullable
              as WishListEntity?,
      addToWishListEntity: freezed == addToWishListEntity
          ? _value.addToWishListEntity
          : addToWishListEntity // ignore: cast_nullable_to_non_nullable
              as AddRemoveWishListEntity?,
      failures: freezed == failures
          ? _value.failures
          : failures // ignore: cast_nullable_to_non_nullable
              as Failures?,
    ));
  }
}

/// @nodoc

class _$WishListStateImpl implements _WishListState {
  const _$WishListStateImpl(
      {required this.status,
      this.wishListEntity,
      this.addToWishListEntity,
      this.failures});

  @override
  final WishListStatus status;
  @override
  final WishListEntity? wishListEntity;
  @override
  final AddRemoveWishListEntity? addToWishListEntity;
  @override
  final Failures? failures;

  @override
  String toString() {
    return 'WishListState(status: $status, wishListEntity: $wishListEntity, addToWishListEntity: $addToWishListEntity, failures: $failures)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WishListStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.wishListEntity, wishListEntity) ||
                other.wishListEntity == wishListEntity) &&
            (identical(other.addToWishListEntity, addToWishListEntity) ||
                other.addToWishListEntity == addToWishListEntity) &&
            (identical(other.failures, failures) ||
                other.failures == failures));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, wishListEntity, addToWishListEntity, failures);

  /// Create a copy of WishListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WishListStateImplCopyWith<_$WishListStateImpl> get copyWith =>
      __$$WishListStateImplCopyWithImpl<_$WishListStateImpl>(this, _$identity);
}

abstract class _WishListState implements WishListState {
  const factory _WishListState(
      {required final WishListStatus status,
      final WishListEntity? wishListEntity,
      final AddRemoveWishListEntity? addToWishListEntity,
      final Failures? failures}) = _$WishListStateImpl;

  @override
  WishListStatus get status;
  @override
  WishListEntity? get wishListEntity;
  @override
  AddRemoveWishListEntity? get addToWishListEntity;
  @override
  Failures? get failures;

  /// Create a copy of WishListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WishListStateImplCopyWith<_$WishListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
