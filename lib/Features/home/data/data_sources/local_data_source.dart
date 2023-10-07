import 'package:hive/hive.dart';
import '../../../../core/constants/app_assets_image.dart';
import '../model/api/reciters_model.dart';

abstract class HomeLocalDataSource {
  List<ReciterModel> fetchMoshafReciterList();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<ReciterModel> fetchMoshafReciterList() {
    var box = Hive.box<ReciterModel>(AppAssetsImage.kReciterBox);
    print(box.values.toList());
    return box.values.toList();
  }
}
