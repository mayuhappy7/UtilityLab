// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImageMatchCount _$ImageMatchCountFromJson(Map<String, dynamic> json) {
  return _ImageMatchCount.fromJson(json);
}

/// @nodoc
mixin _$ImageMatchCount {
  String get img1Name => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  List<ImageMatch> get imageMatchs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageMatchCountCopyWith<ImageMatchCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageMatchCountCopyWith<$Res> {
  factory $ImageMatchCountCopyWith(
          ImageMatchCount value, $Res Function(ImageMatchCount) then) =
      _$ImageMatchCountCopyWithImpl<$Res, ImageMatchCount>;
  @useResult
  $Res call({String img1Name, int count, List<ImageMatch> imageMatchs});
}

/// @nodoc
class _$ImageMatchCountCopyWithImpl<$Res, $Val extends ImageMatchCount>
    implements $ImageMatchCountCopyWith<$Res> {
  _$ImageMatchCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? img1Name = null,
    Object? count = null,
    Object? imageMatchs = null,
  }) {
    return _then(_value.copyWith(
      img1Name: null == img1Name
          ? _value.img1Name
          : img1Name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      imageMatchs: null == imageMatchs
          ? _value.imageMatchs
          : imageMatchs // ignore: cast_nullable_to_non_nullable
              as List<ImageMatch>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageMatchCountImplCopyWith<$Res>
    implements $ImageMatchCountCopyWith<$Res> {
  factory _$$ImageMatchCountImplCopyWith(_$ImageMatchCountImpl value,
          $Res Function(_$ImageMatchCountImpl) then) =
      __$$ImageMatchCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String img1Name, int count, List<ImageMatch> imageMatchs});
}

/// @nodoc
class __$$ImageMatchCountImplCopyWithImpl<$Res>
    extends _$ImageMatchCountCopyWithImpl<$Res, _$ImageMatchCountImpl>
    implements _$$ImageMatchCountImplCopyWith<$Res> {
  __$$ImageMatchCountImplCopyWithImpl(
      _$ImageMatchCountImpl _value, $Res Function(_$ImageMatchCountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? img1Name = null,
    Object? count = null,
    Object? imageMatchs = null,
  }) {
    return _then(_$ImageMatchCountImpl(
      img1Name: null == img1Name
          ? _value.img1Name
          : img1Name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      imageMatchs: null == imageMatchs
          ? _value._imageMatchs
          : imageMatchs // ignore: cast_nullable_to_non_nullable
              as List<ImageMatch>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageMatchCountImpl implements _ImageMatchCount {
  const _$ImageMatchCountImpl(
      {required this.img1Name,
      required this.count,
      required final List<ImageMatch> imageMatchs})
      : _imageMatchs = imageMatchs;

  factory _$ImageMatchCountImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageMatchCountImplFromJson(json);

  @override
  final String img1Name;
  @override
  final int count;
  final List<ImageMatch> _imageMatchs;
  @override
  List<ImageMatch> get imageMatchs {
    if (_imageMatchs is EqualUnmodifiableListView) return _imageMatchs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageMatchs);
  }

  @override
  String toString() {
    return 'ImageMatchCount(img1Name: $img1Name, count: $count, imageMatchs: $imageMatchs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageMatchCountImpl &&
            (identical(other.img1Name, img1Name) ||
                other.img1Name == img1Name) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality()
                .equals(other._imageMatchs, _imageMatchs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, img1Name, count,
      const DeepCollectionEquality().hash(_imageMatchs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageMatchCountImplCopyWith<_$ImageMatchCountImpl> get copyWith =>
      __$$ImageMatchCountImplCopyWithImpl<_$ImageMatchCountImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageMatchCountImplToJson(
      this,
    );
  }
}

abstract class _ImageMatchCount implements ImageMatchCount {
  const factory _ImageMatchCount(
      {required final String img1Name,
      required final int count,
      required final List<ImageMatch> imageMatchs}) = _$ImageMatchCountImpl;

  factory _ImageMatchCount.fromJson(Map<String, dynamic> json) =
      _$ImageMatchCountImpl.fromJson;

  @override
  String get img1Name;
  @override
  int get count;
  @override
  List<ImageMatch> get imageMatchs;
  @override
  @JsonKey(ignore: true)
  _$$ImageMatchCountImplCopyWith<_$ImageMatchCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageMatch _$ImageMatchFromJson(Map<String, dynamic> json) {
  return _ImageMatch.fromJson(json);
}

/// @nodoc
mixin _$ImageMatch {
  String get id => throw _privateConstructorUsedError;
  String get img1Dir => throw _privateConstructorUsedError;
  String get img1Name => throw _privateConstructorUsedError;
  String get img2Dir => throw _privateConstructorUsedError;
  String get img2Name => throw _privateConstructorUsedError;
  int get matchScore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageMatchCopyWith<ImageMatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageMatchCopyWith<$Res> {
  factory $ImageMatchCopyWith(
          ImageMatch value, $Res Function(ImageMatch) then) =
      _$ImageMatchCopyWithImpl<$Res, ImageMatch>;
  @useResult
  $Res call(
      {String id,
      String img1Dir,
      String img1Name,
      String img2Dir,
      String img2Name,
      int matchScore});
}

/// @nodoc
class _$ImageMatchCopyWithImpl<$Res, $Val extends ImageMatch>
    implements $ImageMatchCopyWith<$Res> {
  _$ImageMatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? img1Dir = null,
    Object? img1Name = null,
    Object? img2Dir = null,
    Object? img2Name = null,
    Object? matchScore = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      img1Dir: null == img1Dir
          ? _value.img1Dir
          : img1Dir // ignore: cast_nullable_to_non_nullable
              as String,
      img1Name: null == img1Name
          ? _value.img1Name
          : img1Name // ignore: cast_nullable_to_non_nullable
              as String,
      img2Dir: null == img2Dir
          ? _value.img2Dir
          : img2Dir // ignore: cast_nullable_to_non_nullable
              as String,
      img2Name: null == img2Name
          ? _value.img2Name
          : img2Name // ignore: cast_nullable_to_non_nullable
              as String,
      matchScore: null == matchScore
          ? _value.matchScore
          : matchScore // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageMatchImplCopyWith<$Res>
    implements $ImageMatchCopyWith<$Res> {
  factory _$$ImageMatchImplCopyWith(
          _$ImageMatchImpl value, $Res Function(_$ImageMatchImpl) then) =
      __$$ImageMatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String img1Dir,
      String img1Name,
      String img2Dir,
      String img2Name,
      int matchScore});
}

/// @nodoc
class __$$ImageMatchImplCopyWithImpl<$Res>
    extends _$ImageMatchCopyWithImpl<$Res, _$ImageMatchImpl>
    implements _$$ImageMatchImplCopyWith<$Res> {
  __$$ImageMatchImplCopyWithImpl(
      _$ImageMatchImpl _value, $Res Function(_$ImageMatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? img1Dir = null,
    Object? img1Name = null,
    Object? img2Dir = null,
    Object? img2Name = null,
    Object? matchScore = null,
  }) {
    return _then(_$ImageMatchImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      img1Dir: null == img1Dir
          ? _value.img1Dir
          : img1Dir // ignore: cast_nullable_to_non_nullable
              as String,
      img1Name: null == img1Name
          ? _value.img1Name
          : img1Name // ignore: cast_nullable_to_non_nullable
              as String,
      img2Dir: null == img2Dir
          ? _value.img2Dir
          : img2Dir // ignore: cast_nullable_to_non_nullable
              as String,
      img2Name: null == img2Name
          ? _value.img2Name
          : img2Name // ignore: cast_nullable_to_non_nullable
              as String,
      matchScore: null == matchScore
          ? _value.matchScore
          : matchScore // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageMatchImpl implements _ImageMatch {
  const _$ImageMatchImpl(
      {required this.id,
      required this.img1Dir,
      required this.img1Name,
      required this.img2Dir,
      required this.img2Name,
      required this.matchScore});

  factory _$ImageMatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageMatchImplFromJson(json);

  @override
  final String id;
  @override
  final String img1Dir;
  @override
  final String img1Name;
  @override
  final String img2Dir;
  @override
  final String img2Name;
  @override
  final int matchScore;

  @override
  String toString() {
    return 'ImageMatch(id: $id, img1Dir: $img1Dir, img1Name: $img1Name, img2Dir: $img2Dir, img2Name: $img2Name, matchScore: $matchScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageMatchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.img1Dir, img1Dir) || other.img1Dir == img1Dir) &&
            (identical(other.img1Name, img1Name) ||
                other.img1Name == img1Name) &&
            (identical(other.img2Dir, img2Dir) || other.img2Dir == img2Dir) &&
            (identical(other.img2Name, img2Name) ||
                other.img2Name == img2Name) &&
            (identical(other.matchScore, matchScore) ||
                other.matchScore == matchScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, img1Dir, img1Name, img2Dir, img2Name, matchScore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageMatchImplCopyWith<_$ImageMatchImpl> get copyWith =>
      __$$ImageMatchImplCopyWithImpl<_$ImageMatchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageMatchImplToJson(
      this,
    );
  }
}

abstract class _ImageMatch implements ImageMatch {
  const factory _ImageMatch(
      {required final String id,
      required final String img1Dir,
      required final String img1Name,
      required final String img2Dir,
      required final String img2Name,
      required final int matchScore}) = _$ImageMatchImpl;

  factory _ImageMatch.fromJson(Map<String, dynamic> json) =
      _$ImageMatchImpl.fromJson;

  @override
  String get id;
  @override
  String get img1Dir;
  @override
  String get img1Name;
  @override
  String get img2Dir;
  @override
  String get img2Name;
  @override
  int get matchScore;
  @override
  @JsonKey(ignore: true)
  _$$ImageMatchImplCopyWith<_$ImageMatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
