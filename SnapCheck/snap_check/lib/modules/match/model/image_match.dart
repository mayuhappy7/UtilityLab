import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_match.freezed.dart';
part 'image_match.g.dart';

@freezed
class ImageMatchCount with _$ImageMatchCount {
  const factory ImageMatchCount({
    required String img1Name,
    required int count,
    required List<ImageMatch> imageMatchs,
  }) = _ImageMatchCount;

  factory ImageMatchCount.fromJson(Map<String, dynamic> json) =>
      _$ImageMatchCountFromJson(json);
}

@freezed
class ImageMatch with _$ImageMatch {
  const factory ImageMatch({
    required String id,
    required String img1Dir,
    required String img1Name,
    required String img2Dir,
    required String img2Name,
    required int matchScore,
  }) = _ImageMatch;

  factory ImageMatch.fromJson(Map<String, dynamic> json) =>
      _$ImageMatchFromJson(json);
}
