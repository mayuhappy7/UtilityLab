import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_file.freezed.dart';
part 'storage_file.g.dart';

@freezed
class StorageFile with _$StorageFile {
  const factory StorageFile({
    required int fileID, // 文件ID
    required String fileFolder, // 文件夹
    required String filePath, // 文件路径
    required String fileType, // 文件类型
    required String fileFormat, // 文件格式
    required String fileExtension, // 文件扩展名
    required String fileIcon, // 文件图标
    required String fileName, // 文件名
    required String fileLabel, // 文件标签
    required String fileThumbnailName, // 文件缩略图名
    required String createDatetime, // 创建时间
  }) = _StorageFile;

  factory StorageFile.fromJson(Map<String, dynamic> json) =>
      _$StorageFileFromJson(json);
}
