import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:snap_check/api_service.dart';
import 'package:snap_check/modules/match/model/image_match.dart';

class MatchService {
  Future<List<ImageMatchCount>> matchImages() async {
    final dio = Dio()
      ..httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient();
          client.badCertificateCallback = (cert, host, port) => true; // 允许自签名证书
          return client;
        },
      );

    final response = await dio.get(
      HttpClientSingleton().buildUrl('/imageMatch'),
      options: _getOptions(),
    );

    if (response.statusCode == HttpStatus.ok) {
      final dynamic responseData = response.data;
      final List<dynamic>? body =
          responseData['match_counts'] as List<dynamic>?;
      if (body == null) {
        return [];
      }

      return body.map((dynamic item) {
        if (item is! Map<String, dynamic>) {
          throw FormatException('Expected Map but got ${item.runtimeType}');
        }

        final imageMatches =
            (item['image_match'] as List<dynamic>?)?.map((dynamic matchItem) {
                  if (matchItem is! Map<String, dynamic>) {
                    throw FormatException(
                        'Expected Map but got ${matchItem.runtimeType}');
                  }
                  return ImageMatch(
                    id: matchItem['id']?.toString() ?? '',
                    img1Dir: matchItem['img1_dir'] as String? ?? '',
                    img1Name: matchItem['img1_name'] as String? ?? '',
                    img2Dir: matchItem['img2_dir'] as String? ?? '',
                    img2Name: matchItem['img2_name'] as String? ?? '',
                    matchScore: matchItem['match_score'] as int? ?? 0,
                  );
                }).toList() ??
                [];

        return ImageMatchCount(
          img1Name: item['img1Name'] as String? ?? '',
          count: item['count'] as int? ?? 0,
          imageMatchs: imageMatches,
        );
      }).toList();
    }
    return [];
  }

  Future<Uint8List> getImage(String filename) async {
    final dio = Dio()
      ..httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient();
          client.badCertificateCallback = (cert, host, port) => true;
          return client;
        },
      );

    final response = await dio.get(
      HttpClientSingleton().buildUrl('/image_file'),
      queryParameters: {'filePath': filename},
      options: Options(
        responseType: ResponseType.bytes,
        headers: {HttpHeaders.contentTypeHeader: "application/octet-stream"},
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      return response.data;
    }
    throw Exception('获取图片失败');
  }

  Options _getOptions() {
    return Options(headers: {
      // HttpHeaders.authorizationHeader: 'Bearer',
      HttpHeaders.contentTypeHeader: "application/json"
    });
  }
}
