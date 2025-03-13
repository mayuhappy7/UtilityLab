import 'dart:io';
import 'dart:typed_data';

import 'package:snap_check/api_service.dart';
import 'package:snap_check/core/model/file/storage_file.dart';
import 'package:dio/dio.dart';

class ImageService {
  // Future<List<StorageFile>?> uploadImage(String token, File imageFile) async {
  //   try {
  //     FormData formData = FormData.fromMap({
  //       'ID': "",
  //       'FileType': "",
  //       'FileFormat': "",
  //       'file': await MultipartFile.fromFile(imageFile.path),
  //     });
  //     final response = await Dio().post(
  //       HttpClientSingleton().buildUrl('/api/cloud_storage/upload_file'),
  //       options: Options(headers: {'Authorization': 'Bearer $token'}),
  //       data: formData, // 上传图片
  //     );
  //     if (response.statusCode == HttpStatus.ok) {
  //       final body = response.data as Map<String, dynamic>;
  //       if (body['ok'] == true) {
  //         return (body['result'] as List<dynamic>)
  //             .map((dynamic item) => StorageFile.fromJson(item))
  //             .toList();
  //       } else {
  //         throw Exception('文件上传失败');
  //       }
  //     }
  //   } catch (e) {
  //     throw Exception('文件上传失败: $e');
  //   }
  //   return null;
  // }

  Future<Uint8List> downloadImage(StorageFile photo,
      {required bool isThumbnail}) async {
    try {
      final response = await Dio().get(
        HttpClientSingleton().buildUrl(
            '/api/cloud_storage/download_file/${photo.fileName}/${isThumbnail ? 1 : 0}'),
        options: Options(
          // headers: {'Authorization': 'Bearer $token'},
          responseType: ResponseType.bytes, // 指定响应类型为字节
        ),
      );

      if (response.statusCode == HttpStatus.ok) {
        return response.data;
      } else {
        throw Exception('文件下载失败: HTTP ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('文件下载失败: $e');
    }
  }

  // // 添加辅助方法来获取通用的请求选项
  // Options _getCommonOptions(String token) {
  //   return Options(
  //     headers: {
  //       HttpHeaders.authorizationHeader: 'Bearer $token',
  //       HttpHeaders.contentTypeHeader: 'application/json',
  //     },
  //   );
  // }
}
