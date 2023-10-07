import 'package:astama/core/constants/app_assets_image.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../../../../core/services/reciter_services/reciter_services.dart';
import '../../../../generated/assets.dart';
import '../model/api/reciters_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ReciterModel>> fetchMoshafReciterList();

  downloadFiles(
      {required String url,
      required String fileName,
      void Function(int count, int total)? onReceiveProgress});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl(this.apiServices);

  @override
  Future<List<ReciterModel>> fetchMoshafReciterList() async {
    List<ReciterModel> reciter = getReciterList(await apiServices.get());
    saveRecitersData(reciter);
    return reciter;
  }

  List<ReciterModel> getReciterList(Response response) {
    List<ReciterModel> reciterModelList = [];
    int img = 0;
    for (var data in response.data['reciters']) {
      data['image'] = reciter[img];
      reciterModelList.add(ReciterModel.fromJson(data));
      img++;
    }
    return reciterModelList;
  }

  void saveRecitersData(List<ReciterModel> reciters) {
    var box = Hive.box<ReciterModel>(AppAssetsImage.kReciterBox);
    box.addAll(reciters);
  }

  @override
  downloadFiles(
      {required String url,
      required String fileName,
      void Function(int count, int total)? onReceiveProgress}) {
    apiServices.downloadFiles(
        url: url,
        fileName: fileName,
        onReceiveProgress: onReceiveProgress,
        onValue: (value) {

        });
  }
}


List<String> reciter = [
  Assets.reciter1,
  Assets.reciter2,
  Assets.reciter3,
  Assets.reciter4,
  Assets.reciter5,
  Assets.reciter6,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
 AppAssetsImage.alafasyImage,
];