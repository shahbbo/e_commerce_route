// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_tab_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeTabState {
  HomeTabStatus get status => throw _privateConstructorUsedError;
  CategoryOrBrandResponseEntity? get categoryResponseEntity =>
      throw _privateConstructorUsedError;
  CategoryOrBrandResponseEntity? get brandsResponseEntity =>
      throw _privateConstructorUsedError;
  Failures? get failures => throw _privateConstructorUsedError;

  /// Create a copy of HomeTabState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeTabStateCopyWith<HomeTabState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeTabStateCopyWith<$Res> {
  factory $HomeTabStateCopyWith(
          HomeTabState value, $Res Function(HomeTabState) then) =
      _$HomeTabStateCopyWithImpl<$Res, HomeTabState>;
  @useResult
  $Res call(
      {HomeTabStatus status,
      CategoryOrBrandResponseEntity? categoryResponseEntity,
      CategoryOrBrandResponseEntity? brandsResponseEntity,
      Failures? failures});
}

/// @nodoc
class _$HomeTabStateCopyWithImpl<$Res, $Val extends HomeTabState>
    implements $HomeTabStateCopyWith<$Res> {
  _$HomeTabStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeTabState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? categoryResponseEntity = freezed,
    Object? brandsResponseEntity = freezed,
    Object? failures = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomeTabStatus,
      categoryResponseEntity: freezed == categoryResponseEntity
          ? _value.categoryResponseEntity
          : categoryResponseEntity // ignore: cast_nullable_to_non_nullable
              as CategoryOrBrandResponseEntity?,
      brandsResponseEntity: freezed == brandsResponseEntity
          ? _value.brandsResponseEntity
          : brandsResponseEntity // ignore: cast_nullable_to_non_nullable
              as CategoryOrBrandResponseEntity?,
      failures: freezed == failures
          ? _value.failures
          : failures // ignore: cast_nullable_to_non_nullable
              as Failures?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeTabStateImplCopyWith<$Res>
    implements $HomeTabStateCopyWith<$Res> {
  factory _$$HomeTabStateImplCopyWith(
          _$HomeTabStateImpl value, $Res Function(_$HomeTabStateImpl) then) =
      __$$HomeTabStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HomeTabStatus status,
      CategoryOrBrandResponseEntity? categoryResponseEntity,
      CategoryOrBrandResponseEntity? brandsResponseEntity,
      Failures? failures});
}

/// @nodoc
class __$$HomeTabStateImplCopyWithImpl<$Res>
    extends _$HomeTabStateCopyWithImpl<$Res, _$HomeTabStateImpl>
    implements _$$HomeTabStateImplCopyWith<$Res> {
  __$$HomeTabStateImplCopyWithImpl(
      _$HomeTabStateImpl _value, $Res Function(_$HomeTabStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeTabState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? categoryResponseEntity = freezed,
    Object? brandsResponseEntity = freezed,
    Object? failures = freezed,
  }) {
    return _then(_$HomeTabStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomeTabStatus,
      categoryResponseEntity: freezed == categoryResponseEntity
          ? _value.categoryResponseEntity
          : categoryResponseEntity // ignore: cast_nullable_to_non_nullable
              as CategoryOrBrandResponseEntity?,
      brandsResponseEntity: freezed == brandsResponseEntity
          ? _value.brandsResponseEntity
          : brandsResponseEntity // ignore: cast_nullable_to_non_nullable
              as CategoryOrBrandResponseEntity?,
      failures: freezed == failures
          ? _value.failures
          : failures // ignore: cast_nullable_to_non_nullable
              as Failures?,
    ));
  }
}

/// @nodoc

class _$HomeTabStateImpl implements _HomeTabState {
  const _$HomeTabStateImpl(
      {required this.status,
      this.categoryResponseEntity,
      this.brandsResponseEntity,
      this.failures});

  @override
  final HomeTabStatus status;
  @override
  final CategoryOrBrandResponseEntity? categoryResponseEntity;
  @override
  final CategoryOrBrandResponseEntity? brandsResponseEntity;
  @override
  final Failures? failures;

  @override
  String toString() {
    return 'HomeTabState(status: $status, categoryResponseEntity: $categoryResponseEntity, brandsResponseEntity: $brandsResponseEntity, failures: $failures)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeTabStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.categoryResponseEntity, categoryResponseEntity) ||
                other.categoryResponseEntity == categoryResponseEntity) &&
            (identical(other.brandsResponseEntity, brandsResponseEntity) ||
                other.brandsResponseEntity == brandsResponseEntity) &&
            (identical(other.failures, failures) ||
                other.failures == failures));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, categoryResponseEntity,
      brandsResponseEntity, failures);

  /// Create a copy of HomeTabState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeTabStateImplCopyWith<_$HomeTabStateImpl> get copyWith =>
      __$$HomeTabStateImplCopyWithImpl<_$HomeTabStateImpl>(this, _$identity);
}

abstract class _HomeTabState implements HomeTabState {
  const factory _HomeTabState(
      {required final HomeTabStatus status,
      final CategoryOrBrandResponseEntity? categoryResponseEntity,
      final CategoryOrBrandResponseEntity? brandsResponseEntity,
      final Failures? failures}) = _$HomeTabStateImpl;

  @override
  HomeTabStatus get status;
  @override
  CategoryOrBrandResponseEntity? get categoryResponseEntity;
  @override
  CategoryOrBrandResponseEntity? get brandsResponseEntity;
  @override
  Failures? get failures;

  /// Create a copy of HomeTabState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeTabStateImplCopyWith<_$HomeTabStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
