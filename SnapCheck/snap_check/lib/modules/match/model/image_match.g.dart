// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageMatchCountImpl _$$ImageMatchCountImplFromJson(
        Map<String, dynamic> json) =>
    _$ImageMatchCountImpl(
      img1Name: json['img1Name'] as String,
      count: (json['count'] as num).toInt(),
      imageMatchs: (json['imageMatchs'] as List<dynamic>)
          .map((e) => ImageMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ImageMatchCountImplToJson(
        _$ImageMatchCountImpl instance) =>
    <String, dynamic>{
      'img1Name': instance.img1Name,
      'count': instance.count,
      'imageMatchs': instance.imageMatchs,
    };

_$ImageMatchImpl _$$ImageMatchImplFromJson(Map<String, dynamic> json) =>
    _$ImageMatchImpl(
      id: json['id'] as String,
      img1Dir: json['img1Dir'] as String,
      img1Name: json['img1Name'] as String,
      img2Dir: json['img2Dir'] as String,
      img2Name: json['img2Name'] as String,
      matchScore: (json['matchScore'] as num).toInt(),
    );

Map<String, dynamic> _$$ImageMatchImplToJson(_$ImageMatchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'img1Dir': instance.img1Dir,
      'img1Name': instance.img1Name,
      'img2Dir': instance.img2Dir,
      'img2Name': instance.img2Name,
      'matchScore': instance.matchScore,
    };
