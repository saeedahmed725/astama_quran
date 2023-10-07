import 'package:quran/quran.dart';

import '../../Features/author/domain/entity/reciter_entity.dart';
import '../../Features/home/data/model/api/reciters_model.dart';
import '../utils/function.dart';

class AuthorController {
  AuthorController();

  Future<void> getPlayListReciter(
      ReciterModel reciterData, List<ReciterEntity> reciters,
      {required bool isDownloaded}) async {
    reciters.clear();
    await getRecitersList(
      reciterData,
          (index, shihkName, image, rowya, surahName, serverUrl, exist) {
        if (isDownloaded && exist) {
          reciters.add(ReciterEntity(
              shihkName: shihkName,
              rowya: {index: rowya},
              surahName: surahName,
              serverUrl: serverUrl,
              isDownloaded: exist,
              image: image));
        }
        if (!isDownloaded) {
          reciters.add(ReciterEntity(
              shihkName: shihkName,
              rowya: {index: rowya},
              surahName: surahName,
              serverUrl: serverUrl,
              isDownloaded: exist,
              image: image));
        }
      },
    );
  }

  Future<void> getRecitersList(
      ReciterModel reciterData,
      Function(int index, String shihkName, String? image, String rowya,
          String surahName, String serverUrl, bool ifExist)
      onLoop) async {
    for (var detail in reciterData.moshaf) {
      List<int> surahList = toListOfInt(detail.surahList);
      for (var surahNum = 0; surahNum < surahList.length; surahNum++) {
        String surahName = getSurahNameArabic(surahList[surahNum]);
        String url =
            "${detail.server}/${formatNumber(toListOfInt(detail.surahList)[surahNum], 3)}.mp3";
        ({bool exist, String nameFile, String path}) file =
        await ifFileExist(url, reciterData.name, detail.name);
        onLoop(surahNum, reciterData.name, reciterData.image, detail.name,
            surahName, url, file.exist);
      }
    }
  }
}