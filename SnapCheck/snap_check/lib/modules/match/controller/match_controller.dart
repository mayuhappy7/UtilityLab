import 'dart:typed_data';

import 'package:snap_check/core/model/file/storage_file.dart';
import 'package:snap_check/core/service/image_service.dart';
import 'package:snap_check/modules/match/model/image_match.dart';
import 'package:snap_check/modules/match/service/match_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'match_controller.g.dart';

@riverpod
class MatchController extends _$MatchController {
  List<ImageMatchCount> _imageMatchCounts = [];

  @override
  List<ImageMatchCount> build() {
    return [];
  }

  Future<void> matchImages() async {
    _imageMatchCounts = await MatchService().matchImages();
    state = _imageMatchCounts;
  }

  // 下载图片
  Future<Uint8List> downloadImage(StorageFile photo,
      {required bool isThumbnail}) async {
    try {
      final imageBytes =
          await ImageService().downloadImage(photo, isThumbnail: isThumbnail);
      return imageBytes;
    } catch (e) {
      throw Exception('下载图片失败：$e');
    }
  }

  Future<Uint8List> getImage(String filename) async {
    return await MatchService().getImage(filename);
  }
}
