import '../../../../core/services/reciter_services/reciter_services.dart';

abstract class AuthorRemoteDataSource {
  downloadFiles(
      {required String url,
      required String fileName,
      void Function(int count, int total)? onReceiveProgress,
      required Function(dynamic) onValue});
}

class AuthorRemoteDataSourceImp extends AuthorRemoteDataSource {
  final ApiServices apiServices;

  AuthorRemoteDataSourceImp(this.apiServices);

  @override
  downloadFiles(
      {required String url,
      required String fileName,
      void Function(int count, int total)? onReceiveProgress,
      required Function(dynamic) onValue}) {
    apiServices.downloadFiles(
        url: url,
        fileName: fileName,
        onReceiveProgress: onReceiveProgress,
        onValue: onValue);
  }
}
