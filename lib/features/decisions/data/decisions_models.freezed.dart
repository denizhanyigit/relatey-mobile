// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'decisions_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateDecisionRequest _$CreateDecisionRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateDecisionRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateDecisionRequest {
  String get situationType => throw _privateConstructorUsedError;
  String get contextText => throw _privateConstructorUsedError;
  String? get personLabel => throw _privateConstructorUsedError;

  /// Serializes this CreateDecisionRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateDecisionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateDecisionRequestCopyWith<CreateDecisionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateDecisionRequestCopyWith<$Res> {
  factory $CreateDecisionRequestCopyWith(CreateDecisionRequest value,
          $Res Function(CreateDecisionRequest) then) =
      _$CreateDecisionRequestCopyWithImpl<$Res, CreateDecisionRequest>;
  @useResult
  $Res call({String situationType, String contextText, String? personLabel});
}

/// @nodoc
class _$CreateDecisionRequestCopyWithImpl<$Res,
        $Val extends CreateDecisionRequest>
    implements $CreateDecisionRequestCopyWith<$Res> {
  _$CreateDecisionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateDecisionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? situationType = null,
    Object? contextText = null,
    Object? personLabel = freezed,
  }) {
    return _then(_value.copyWith(
      situationType: null == situationType
          ? _value.situationType
          : situationType // ignore: cast_nullable_to_non_nullable
              as String,
      contextText: null == contextText
          ? _value.contextText
          : contextText // ignore: cast_nullable_to_non_nullable
              as String,
      personLabel: freezed == personLabel
          ? _value.personLabel
          : personLabel // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateDecisionRequestImplCopyWith<$Res>
    implements $CreateDecisionRequestCopyWith<$Res> {
  factory _$$CreateDecisionRequestImplCopyWith(
          _$CreateDecisionRequestImpl value,
          $Res Function(_$CreateDecisionRequestImpl) then) =
      __$$CreateDecisionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String situationType, String contextText, String? personLabel});
}

/// @nodoc
class __$$CreateDecisionRequestImplCopyWithImpl<$Res>
    extends _$CreateDecisionRequestCopyWithImpl<$Res,
        _$CreateDecisionRequestImpl>
    implements _$$CreateDecisionRequestImplCopyWith<$Res> {
  __$$CreateDecisionRequestImplCopyWithImpl(_$CreateDecisionRequestImpl _value,
      $Res Function(_$CreateDecisionRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateDecisionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? situationType = null,
    Object? contextText = null,
    Object? personLabel = freezed,
  }) {
    return _then(_$CreateDecisionRequestImpl(
      situationType: null == situationType
          ? _value.situationType
          : situationType // ignore: cast_nullable_to_non_nullable
              as String,
      contextText: null == contextText
          ? _value.contextText
          : contextText // ignore: cast_nullable_to_non_nullable
              as String,
      personLabel: freezed == personLabel
          ? _value.personLabel
          : personLabel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateDecisionRequestImpl implements _CreateDecisionRequest {
  const _$CreateDecisionRequestImpl(
      {required this.situationType,
      required this.contextText,
      this.personLabel});

  factory _$CreateDecisionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateDecisionRequestImplFromJson(json);

  @override
  final String situationType;
  @override
  final String contextText;
  @override
  final String? personLabel;

  @override
  String toString() {
    return 'CreateDecisionRequest(situationType: $situationType, contextText: $contextText, personLabel: $personLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateDecisionRequestImpl &&
            (identical(other.situationType, situationType) ||
                other.situationType == situationType) &&
            (identical(other.contextText, contextText) ||
                other.contextText == contextText) &&
            (identical(other.personLabel, personLabel) ||
                other.personLabel == personLabel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, situationType, contextText, personLabel);

  /// Create a copy of CreateDecisionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateDecisionRequestImplCopyWith<_$CreateDecisionRequestImpl>
      get copyWith => __$$CreateDecisionRequestImplCopyWithImpl<
          _$CreateDecisionRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateDecisionRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateDecisionRequest implements CreateDecisionRequest {
  const factory _CreateDecisionRequest(
      {required final String situationType,
      required final String contextText,
      final String? personLabel}) = _$CreateDecisionRequestImpl;

  factory _CreateDecisionRequest.fromJson(Map<String, dynamic> json) =
      _$CreateDecisionRequestImpl.fromJson;

  @override
  String get situationType;
  @override
  String get contextText;
  @override
  String? get personLabel;

  /// Create a copy of CreateDecisionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateDecisionRequestImplCopyWith<_$CreateDecisionRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DecisionResponse _$DecisionResponseFromJson(Map<String, dynamic> json) {
  return _DecisionResponse.fromJson(json);
}

/// @nodoc
mixin _$DecisionResponse {
  String get id => throw _privateConstructorUsedError;
  String get situationType => throw _privateConstructorUsedError;
  String get contextText => throw _privateConstructorUsedError;
  String? get personLabel => throw _privateConstructorUsedError;
  String get summaryText => throw _privateConstructorUsedError;
  String? get detailedText => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;

  /// Serializes this DecisionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DecisionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DecisionResponseCopyWith<DecisionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DecisionResponseCopyWith<$Res> {
  factory $DecisionResponseCopyWith(
          DecisionResponse value, $Res Function(DecisionResponse) then) =
      _$DecisionResponseCopyWithImpl<$Res, DecisionResponse>;
  @useResult
  $Res call(
      {String id,
      String situationType,
      String contextText,
      String? personLabel,
      String summaryText,
      String? detailedText,
      int createdAt});
}

/// @nodoc
class _$DecisionResponseCopyWithImpl<$Res, $Val extends DecisionResponse>
    implements $DecisionResponseCopyWith<$Res> {
  _$DecisionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DecisionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? situationType = null,
    Object? contextText = null,
    Object? personLabel = freezed,
    Object? summaryText = null,
    Object? detailedText = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      situationType: null == situationType
          ? _value.situationType
          : situationType // ignore: cast_nullable_to_non_nullable
              as String,
      contextText: null == contextText
          ? _value.contextText
          : contextText // ignore: cast_nullable_to_non_nullable
              as String,
      personLabel: freezed == personLabel
          ? _value.personLabel
          : personLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      summaryText: null == summaryText
          ? _value.summaryText
          : summaryText // ignore: cast_nullable_to_non_nullable
              as String,
      detailedText: freezed == detailedText
          ? _value.detailedText
          : detailedText // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DecisionResponseImplCopyWith<$Res>
    implements $DecisionResponseCopyWith<$Res> {
  factory _$$DecisionResponseImplCopyWith(_$DecisionResponseImpl value,
          $Res Function(_$DecisionResponseImpl) then) =
      __$$DecisionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String situationType,
      String contextText,
      String? personLabel,
      String summaryText,
      String? detailedText,
      int createdAt});
}

/// @nodoc
class __$$DecisionResponseImplCopyWithImpl<$Res>
    extends _$DecisionResponseCopyWithImpl<$Res, _$DecisionResponseImpl>
    implements _$$DecisionResponseImplCopyWith<$Res> {
  __$$DecisionResponseImplCopyWithImpl(_$DecisionResponseImpl _value,
      $Res Function(_$DecisionResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DecisionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? situationType = null,
    Object? contextText = null,
    Object? personLabel = freezed,
    Object? summaryText = null,
    Object? detailedText = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$DecisionResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      situationType: null == situationType
          ? _value.situationType
          : situationType // ignore: cast_nullable_to_non_nullable
              as String,
      contextText: null == contextText
          ? _value.contextText
          : contextText // ignore: cast_nullable_to_non_nullable
              as String,
      personLabel: freezed == personLabel
          ? _value.personLabel
          : personLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      summaryText: null == summaryText
          ? _value.summaryText
          : summaryText // ignore: cast_nullable_to_non_nullable
              as String,
      detailedText: freezed == detailedText
          ? _value.detailedText
          : detailedText // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DecisionResponseImpl implements _DecisionResponse {
  const _$DecisionResponseImpl(
      {required this.id,
      required this.situationType,
      required this.contextText,
      this.personLabel,
      required this.summaryText,
      this.detailedText,
      required this.createdAt});

  factory _$DecisionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DecisionResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String situationType;
  @override
  final String contextText;
  @override
  final String? personLabel;
  @override
  final String summaryText;
  @override
  final String? detailedText;
  @override
  final int createdAt;

  @override
  String toString() {
    return 'DecisionResponse(id: $id, situationType: $situationType, contextText: $contextText, personLabel: $personLabel, summaryText: $summaryText, detailedText: $detailedText, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecisionResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.situationType, situationType) ||
                other.situationType == situationType) &&
            (identical(other.contextText, contextText) ||
                other.contextText == contextText) &&
            (identical(other.personLabel, personLabel) ||
                other.personLabel == personLabel) &&
            (identical(other.summaryText, summaryText) ||
                other.summaryText == summaryText) &&
            (identical(other.detailedText, detailedText) ||
                other.detailedText == detailedText) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, situationType, contextText,
      personLabel, summaryText, detailedText, createdAt);

  /// Create a copy of DecisionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DecisionResponseImplCopyWith<_$DecisionResponseImpl> get copyWith =>
      __$$DecisionResponseImplCopyWithImpl<_$DecisionResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DecisionResponseImplToJson(
      this,
    );
  }
}

abstract class _DecisionResponse implements DecisionResponse {
  const factory _DecisionResponse(
      {required final String id,
      required final String situationType,
      required final String contextText,
      final String? personLabel,
      required final String summaryText,
      final String? detailedText,
      required final int createdAt}) = _$DecisionResponseImpl;

  factory _DecisionResponse.fromJson(Map<String, dynamic> json) =
      _$DecisionResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get situationType;
  @override
  String get contextText;
  @override
  String? get personLabel;
  @override
  String get summaryText;
  @override
  String? get detailedText;
  @override
  int get createdAt;

  /// Create a copy of DecisionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DecisionResponseImplCopyWith<_$DecisionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DecisionModel _$DecisionModelFromJson(Map<String, dynamic> json) {
  return _DecisionModel.fromJson(json);
}

/// @nodoc
mixin _$DecisionModel {
  String get id => throw _privateConstructorUsedError;
  String get situationType => throw _privateConstructorUsedError;
  String get contextText => throw _privateConstructorUsedError;
  String? get personLabel => throw _privateConstructorUsedError;
  String get summaryText => throw _privateConstructorUsedError;
  String? get detailedText => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;

  /// Serializes this DecisionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DecisionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DecisionModelCopyWith<DecisionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DecisionModelCopyWith<$Res> {
  factory $DecisionModelCopyWith(
          DecisionModel value, $Res Function(DecisionModel) then) =
      _$DecisionModelCopyWithImpl<$Res, DecisionModel>;
  @useResult
  $Res call(
      {String id,
      String situationType,
      String contextText,
      String? personLabel,
      String summaryText,
      String? detailedText,
      int createdAt});
}

/// @nodoc
class _$DecisionModelCopyWithImpl<$Res, $Val extends DecisionModel>
    implements $DecisionModelCopyWith<$Res> {
  _$DecisionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DecisionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? situationType = null,
    Object? contextText = null,
    Object? personLabel = freezed,
    Object? summaryText = null,
    Object? detailedText = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      situationType: null == situationType
          ? _value.situationType
          : situationType // ignore: cast_nullable_to_non_nullable
              as String,
      contextText: null == contextText
          ? _value.contextText
          : contextText // ignore: cast_nullable_to_non_nullable
              as String,
      personLabel: freezed == personLabel
          ? _value.personLabel
          : personLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      summaryText: null == summaryText
          ? _value.summaryText
          : summaryText // ignore: cast_nullable_to_non_nullable
              as String,
      detailedText: freezed == detailedText
          ? _value.detailedText
          : detailedText // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DecisionModelImplCopyWith<$Res>
    implements $DecisionModelCopyWith<$Res> {
  factory _$$DecisionModelImplCopyWith(
          _$DecisionModelImpl value, $Res Function(_$DecisionModelImpl) then) =
      __$$DecisionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String situationType,
      String contextText,
      String? personLabel,
      String summaryText,
      String? detailedText,
      int createdAt});
}

/// @nodoc
class __$$DecisionModelImplCopyWithImpl<$Res>
    extends _$DecisionModelCopyWithImpl<$Res, _$DecisionModelImpl>
    implements _$$DecisionModelImplCopyWith<$Res> {
  __$$DecisionModelImplCopyWithImpl(
      _$DecisionModelImpl _value, $Res Function(_$DecisionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DecisionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? situationType = null,
    Object? contextText = null,
    Object? personLabel = freezed,
    Object? summaryText = null,
    Object? detailedText = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$DecisionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      situationType: null == situationType
          ? _value.situationType
          : situationType // ignore: cast_nullable_to_non_nullable
              as String,
      contextText: null == contextText
          ? _value.contextText
          : contextText // ignore: cast_nullable_to_non_nullable
              as String,
      personLabel: freezed == personLabel
          ? _value.personLabel
          : personLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      summaryText: null == summaryText
          ? _value.summaryText
          : summaryText // ignore: cast_nullable_to_non_nullable
              as String,
      detailedText: freezed == detailedText
          ? _value.detailedText
          : detailedText // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DecisionModelImpl extends _DecisionModel {
  const _$DecisionModelImpl(
      {required this.id,
      required this.situationType,
      required this.contextText,
      this.personLabel,
      required this.summaryText,
      this.detailedText,
      required this.createdAt})
      : super._();

  factory _$DecisionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DecisionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String situationType;
  @override
  final String contextText;
  @override
  final String? personLabel;
  @override
  final String summaryText;
  @override
  final String? detailedText;
  @override
  final int createdAt;

  @override
  String toString() {
    return 'DecisionModel(id: $id, situationType: $situationType, contextText: $contextText, personLabel: $personLabel, summaryText: $summaryText, detailedText: $detailedText, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecisionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.situationType, situationType) ||
                other.situationType == situationType) &&
            (identical(other.contextText, contextText) ||
                other.contextText == contextText) &&
            (identical(other.personLabel, personLabel) ||
                other.personLabel == personLabel) &&
            (identical(other.summaryText, summaryText) ||
                other.summaryText == summaryText) &&
            (identical(other.detailedText, detailedText) ||
                other.detailedText == detailedText) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, situationType, contextText,
      personLabel, summaryText, detailedText, createdAt);

  /// Create a copy of DecisionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DecisionModelImplCopyWith<_$DecisionModelImpl> get copyWith =>
      __$$DecisionModelImplCopyWithImpl<_$DecisionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DecisionModelImplToJson(
      this,
    );
  }
}

abstract class _DecisionModel extends DecisionModel {
  const factory _DecisionModel(
      {required final String id,
      required final String situationType,
      required final String contextText,
      final String? personLabel,
      required final String summaryText,
      final String? detailedText,
      required final int createdAt}) = _$DecisionModelImpl;
  const _DecisionModel._() : super._();

  factory _DecisionModel.fromJson(Map<String, dynamic> json) =
      _$DecisionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get situationType;
  @override
  String get contextText;
  @override
  String? get personLabel;
  @override
  String get summaryText;
  @override
  String? get detailedText;
  @override
  int get createdAt;

  /// Create a copy of DecisionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DecisionModelImplCopyWith<_$DecisionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PremiumDetailResponse _$PremiumDetailResponseFromJson(
    Map<String, dynamic> json) {
  return _PremiumDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$PremiumDetailResponse {
  String get detailedText => throw _privateConstructorUsedError;

  /// Serializes this PremiumDetailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PremiumDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PremiumDetailResponseCopyWith<PremiumDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PremiumDetailResponseCopyWith<$Res> {
  factory $PremiumDetailResponseCopyWith(PremiumDetailResponse value,
          $Res Function(PremiumDetailResponse) then) =
      _$PremiumDetailResponseCopyWithImpl<$Res, PremiumDetailResponse>;
  @useResult
  $Res call({String detailedText});
}

/// @nodoc
class _$PremiumDetailResponseCopyWithImpl<$Res,
        $Val extends PremiumDetailResponse>
    implements $PremiumDetailResponseCopyWith<$Res> {
  _$PremiumDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PremiumDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detailedText = null,
  }) {
    return _then(_value.copyWith(
      detailedText: null == detailedText
          ? _value.detailedText
          : detailedText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PremiumDetailResponseImplCopyWith<$Res>
    implements $PremiumDetailResponseCopyWith<$Res> {
  factory _$$PremiumDetailResponseImplCopyWith(
          _$PremiumDetailResponseImpl value,
          $Res Function(_$PremiumDetailResponseImpl) then) =
      __$$PremiumDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String detailedText});
}

/// @nodoc
class __$$PremiumDetailResponseImplCopyWithImpl<$Res>
    extends _$PremiumDetailResponseCopyWithImpl<$Res,
        _$PremiumDetailResponseImpl>
    implements _$$PremiumDetailResponseImplCopyWith<$Res> {
  __$$PremiumDetailResponseImplCopyWithImpl(_$PremiumDetailResponseImpl _value,
      $Res Function(_$PremiumDetailResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PremiumDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detailedText = null,
  }) {
    return _then(_$PremiumDetailResponseImpl(
      detailedText: null == detailedText
          ? _value.detailedText
          : detailedText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PremiumDetailResponseImpl implements _PremiumDetailResponse {
  const _$PremiumDetailResponseImpl({required this.detailedText});

  factory _$PremiumDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PremiumDetailResponseImplFromJson(json);

  @override
  final String detailedText;

  @override
  String toString() {
    return 'PremiumDetailResponse(detailedText: $detailedText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PremiumDetailResponseImpl &&
            (identical(other.detailedText, detailedText) ||
                other.detailedText == detailedText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, detailedText);

  /// Create a copy of PremiumDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PremiumDetailResponseImplCopyWith<_$PremiumDetailResponseImpl>
      get copyWith => __$$PremiumDetailResponseImplCopyWithImpl<
          _$PremiumDetailResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PremiumDetailResponseImplToJson(
      this,
    );
  }
}

abstract class _PremiumDetailResponse implements PremiumDetailResponse {
  const factory _PremiumDetailResponse({required final String detailedText}) =
      _$PremiumDetailResponseImpl;

  factory _PremiumDetailResponse.fromJson(Map<String, dynamic> json) =
      _$PremiumDetailResponseImpl.fromJson;

  @override
  String get detailedText;

  /// Create a copy of PremiumDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PremiumDetailResponseImplCopyWith<_$PremiumDetailResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
