// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StorageFileImpl _$$StorageFileImplFromJson(Map<String, dynamic> json) =>
    _$StorageFileImpl(
      fileID: (json['fileID'] as num).toInt(),
      fileFolder: json['fileFolder'] as String,
      filePath: json['filePath'] as String,
      fileType: json['fileType'] as String,
      fileFormat: json['fileFormat'] as String,
      fileExtension: json['fileExtension'] as String,
      fileIcon: json['fileIcon'] as String,
      fileName: json['fileName'] as String,
      fileLabel: json['fileLabel'] as String,
      fileThumbnailName: json['fileThumbnailName'] as String,
      createDatetime: json['createDatetime'] as String,
    );

Map<String, dynamic> _$$StorageFileImplToJson(_$StorageFileImpl instance) =>
    <String, dynamic>{
      'fileID': instance.fileID,
      'fileFolder': instance.fileFolder,
      'filePath': instance.filePath,
      'fileType': instance.fileType,
      'fileFormat': instance.fileFormat,
      'fileExtension': instance.fileExtension,
      'fileIcon': instance.fileIcon,
      'fileName': instance.fileName,
      'fileLabel': instance.fileLabel,
      'fileThumbnailName': instance.fileThumbnailName,
      'createDatetime': instance.createDatetime,
    };
