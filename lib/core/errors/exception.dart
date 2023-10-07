import 'package:dio/dio.dart';

class LocalException implements Exception {
  final String error;

  LocalException(this.error);
}

class RemoteException implements Exception {
  DioException dioError;

  RemoteException({required this.dioError});
}
