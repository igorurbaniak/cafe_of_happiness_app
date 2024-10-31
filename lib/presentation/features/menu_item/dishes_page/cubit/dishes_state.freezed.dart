// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dishes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DishesState {
  List<DishModel> get dishes => throw _privateConstructorUsedError;
  List<DishModel> get newDishes => throw _privateConstructorUsedError;
  List<DishModel> get favoriteDishes => throw _privateConstructorUsedError;
  Map<int, int> get favoriteCounts => throw _privateConstructorUsedError;
  List<int> get favoriteDishIds => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DishesStateCopyWith<DishesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DishesStateCopyWith<$Res> {
  factory $DishesStateCopyWith(
          DishesState value, $Res Function(DishesState) then) =
      _$DishesStateCopyWithImpl<$Res, DishesState>;
  @useResult
  $Res call(
      {List<DishModel> dishes,
      List<DishModel> newDishes,
      List<DishModel> favoriteDishes,
      Map<int, int> favoriteCounts,
      List<int> favoriteDishIds,
      Status status,
      String? errorMessage});
}

/// @nodoc
class _$DishesStateCopyWithImpl<$Res, $Val extends DishesState>
    implements $DishesStateCopyWith<$Res> {
  _$DishesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dishes = null,
    Object? newDishes = null,
    Object? favoriteDishes = null,
    Object? favoriteCounts = null,
    Object? favoriteDishIds = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      dishes: null == dishes
          ? _value.dishes
          : dishes // ignore: cast_nullable_to_non_nullable
              as List<DishModel>,
      newDishes: null == newDishes
          ? _value.newDishes
          : newDishes // ignore: cast_nullable_to_non_nullable
              as List<DishModel>,
      favoriteDishes: null == favoriteDishes
          ? _value.favoriteDishes
          : favoriteDishes // ignore: cast_nullable_to_non_nullable
              as List<DishModel>,
      favoriteCounts: null == favoriteCounts
          ? _value.favoriteCounts
          : favoriteCounts // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      favoriteDishIds: null == favoriteDishIds
          ? _value.favoriteDishIds
          : favoriteDishIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DishesStateImplCopyWith<$Res>
    implements $DishesStateCopyWith<$Res> {
  factory _$$DishesStateImplCopyWith(
          _$DishesStateImpl value, $Res Function(_$DishesStateImpl) then) =
      __$$DishesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DishModel> dishes,
      List<DishModel> newDishes,
      List<DishModel> favoriteDishes,
      Map<int, int> favoriteCounts,
      List<int> favoriteDishIds,
      Status status,
      String? errorMessage});
}

/// @nodoc
class __$$DishesStateImplCopyWithImpl<$Res>
    extends _$DishesStateCopyWithImpl<$Res, _$DishesStateImpl>
    implements _$$DishesStateImplCopyWith<$Res> {
  __$$DishesStateImplCopyWithImpl(
      _$DishesStateImpl _value, $Res Function(_$DishesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dishes = null,
    Object? newDishes = null,
    Object? favoriteDishes = null,
    Object? favoriteCounts = null,
    Object? favoriteDishIds = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$DishesStateImpl(
      dishes: null == dishes
          ? _value._dishes
          : dishes // ignore: cast_nullable_to_non_nullable
              as List<DishModel>,
      newDishes: null == newDishes
          ? _value._newDishes
          : newDishes // ignore: cast_nullable_to_non_nullable
              as List<DishModel>,
      favoriteDishes: null == favoriteDishes
          ? _value._favoriteDishes
          : favoriteDishes // ignore: cast_nullable_to_non_nullable
              as List<DishModel>,
      favoriteCounts: null == favoriteCounts
          ? _value._favoriteCounts
          : favoriteCounts // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      favoriteDishIds: null == favoriteDishIds
          ? _value._favoriteDishIds
          : favoriteDishIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DishesStateImpl implements _DishesState {
  const _$DishesStateImpl(
      {final List<DishModel> dishes = const [],
      final List<DishModel> newDishes = const [],
      final List<DishModel> favoriteDishes = const [],
      final Map<int, int> favoriteCounts = const {},
      final List<int> favoriteDishIds = const [],
      this.status = Status.initial,
      this.errorMessage})
      : _dishes = dishes,
        _newDishes = newDishes,
        _favoriteDishes = favoriteDishes,
        _favoriteCounts = favoriteCounts,
        _favoriteDishIds = favoriteDishIds;

  final List<DishModel> _dishes;
  @override
  @JsonKey()
  List<DishModel> get dishes {
    if (_dishes is EqualUnmodifiableListView) return _dishes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dishes);
  }

  final List<DishModel> _newDishes;
  @override
  @JsonKey()
  List<DishModel> get newDishes {
    if (_newDishes is EqualUnmodifiableListView) return _newDishes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newDishes);
  }

  final List<DishModel> _favoriteDishes;
  @override
  @JsonKey()
  List<DishModel> get favoriteDishes {
    if (_favoriteDishes is EqualUnmodifiableListView) return _favoriteDishes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteDishes);
  }

  final Map<int, int> _favoriteCounts;
  @override
  @JsonKey()
  Map<int, int> get favoriteCounts {
    if (_favoriteCounts is EqualUnmodifiableMapView) return _favoriteCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_favoriteCounts);
  }

  final List<int> _favoriteDishIds;
  @override
  @JsonKey()
  List<int> get favoriteDishIds {
    if (_favoriteDishIds is EqualUnmodifiableListView) return _favoriteDishIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteDishIds);
  }

  @override
  @JsonKey()
  final Status status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'DishesState(dishes: $dishes, newDishes: $newDishes, favoriteDishes: $favoriteDishes, favoriteCounts: $favoriteCounts, favoriteDishIds: $favoriteDishIds, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DishesStateImpl &&
            const DeepCollectionEquality().equals(other._dishes, _dishes) &&
            const DeepCollectionEquality()
                .equals(other._newDishes, _newDishes) &&
            const DeepCollectionEquality()
                .equals(other._favoriteDishes, _favoriteDishes) &&
            const DeepCollectionEquality()
                .equals(other._favoriteCounts, _favoriteCounts) &&
            const DeepCollectionEquality()
                .equals(other._favoriteDishIds, _favoriteDishIds) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_dishes),
      const DeepCollectionEquality().hash(_newDishes),
      const DeepCollectionEquality().hash(_favoriteDishes),
      const DeepCollectionEquality().hash(_favoriteCounts),
      const DeepCollectionEquality().hash(_favoriteDishIds),
      status,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DishesStateImplCopyWith<_$DishesStateImpl> get copyWith =>
      __$$DishesStateImplCopyWithImpl<_$DishesStateImpl>(this, _$identity);
}

abstract class _DishesState implements DishesState {
  const factory _DishesState(
      {final List<DishModel> dishes,
      final List<DishModel> newDishes,
      final List<DishModel> favoriteDishes,
      final Map<int, int> favoriteCounts,
      final List<int> favoriteDishIds,
      final Status status,
      final String? errorMessage}) = _$DishesStateImpl;

  @override
  List<DishModel> get dishes;
  @override
  List<DishModel> get newDishes;
  @override
  List<DishModel> get favoriteDishes;
  @override
  Map<int, int> get favoriteCounts;
  @override
  List<int> get favoriteDishIds;
  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$DishesStateImplCopyWith<_$DishesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
