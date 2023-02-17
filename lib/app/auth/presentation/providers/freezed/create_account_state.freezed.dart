// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateAccountState {
  bool get isBtnLoading => throw _privateConstructorUsedError;
  String get errorStr => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateAccountStateCopyWith<CreateAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAccountStateCopyWith<$Res> {
  factory $CreateAccountStateCopyWith(
          CreateAccountState value, $Res Function(CreateAccountState) then) =
      _$CreateAccountStateCopyWithImpl<$Res, CreateAccountState>;
  @useResult
  $Res call({bool isBtnLoading, String errorStr, String email, String code});
}

/// @nodoc
class _$CreateAccountStateCopyWithImpl<$Res, $Val extends CreateAccountState>
    implements $CreateAccountStateCopyWith<$Res> {
  _$CreateAccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBtnLoading = null,
    Object? errorStr = null,
    Object? email = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      isBtnLoading: null == isBtnLoading
          ? _value.isBtnLoading
          : isBtnLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorStr: null == errorStr
          ? _value.errorStr
          : errorStr // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateAccountStateCopyWith<$Res>
    implements $CreateAccountStateCopyWith<$Res> {
  factory _$$_CreateAccountStateCopyWith(_$_CreateAccountState value,
          $Res Function(_$_CreateAccountState) then) =
      __$$_CreateAccountStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isBtnLoading, String errorStr, String email, String code});
}

/// @nodoc
class __$$_CreateAccountStateCopyWithImpl<$Res>
    extends _$CreateAccountStateCopyWithImpl<$Res, _$_CreateAccountState>
    implements _$$_CreateAccountStateCopyWith<$Res> {
  __$$_CreateAccountStateCopyWithImpl(
      _$_CreateAccountState _value, $Res Function(_$_CreateAccountState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBtnLoading = null,
    Object? errorStr = null,
    Object? email = null,
    Object? code = null,
  }) {
    return _then(_$_CreateAccountState(
      isBtnLoading: null == isBtnLoading
          ? _value.isBtnLoading
          : isBtnLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorStr: null == errorStr
          ? _value.errorStr
          : errorStr // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CreateAccountState implements _CreateAccountState {
  const _$_CreateAccountState(
      {this.isBtnLoading = false,
      this.errorStr = '',
      this.email = '',
      this.code = ''});

  @override
  @JsonKey()
  final bool isBtnLoading;
  @override
  @JsonKey()
  final String errorStr;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String code;

  @override
  String toString() {
    return 'CreateAccountState(isBtnLoading: $isBtnLoading, errorStr: $errorStr, email: $email, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateAccountState &&
            (identical(other.isBtnLoading, isBtnLoading) ||
                other.isBtnLoading == isBtnLoading) &&
            (identical(other.errorStr, errorStr) ||
                other.errorStr == errorStr) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isBtnLoading, errorStr, email, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateAccountStateCopyWith<_$_CreateAccountState> get copyWith =>
      __$$_CreateAccountStateCopyWithImpl<_$_CreateAccountState>(
          this, _$identity);
}

abstract class _CreateAccountState implements CreateAccountState {
  const factory _CreateAccountState(
      {final bool isBtnLoading,
      final String errorStr,
      final String email,
      final String code}) = _$_CreateAccountState;

  @override
  bool get isBtnLoading;
  @override
  String get errorStr;
  @override
  String get email;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$_CreateAccountStateCopyWith<_$_CreateAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}
