import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import '../../utils/function.dart';

class ApiServices {
  Dio dio;

  ApiServices(this.dio);

  Future<Response> get() async {
    Response response = await dio.get('https://mp3quran.net/api/v3/reciters');
    return response;
  }

  downloadFiles(
      {required String url,
      required String fileName,
      void Function(int count, int total)? onReceiveProgress,
      required Function(dynamic) onValue}) async {
    Directory dir = await getDownloadPath();
    dio.download(
          url,
          '${dir.path}$fileName',
          deleteOnError: true,
          onReceiveProgress: onReceiveProgress,
        )
        .then(onValue);
  }
}
