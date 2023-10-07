import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:quran/quran.dart';

import '../../Features/home/data/model/api/reciters_model.dart';
import '../errors/exception.dart';
import '../errors/failures.dart';
import '../utils/function.dart';

class PlayerController {
  AssetsAudioPlayer assetsAudioPlayer;
  List<Audio> audios = [];
  List<Audio> downloadedAudios = [];

  PlayerController(this.assetsAudioPlayer);

  Future<Either<Failure, Unit>> openRemotePlayList(int index) async {
    try {
      await assetsAudioPlayer.open(Playlist(audios: audios, startIndex: index),
          playInBackground: PlayInBackground.enabled, showNotification: true);
      return right(unit);
    } on LocalException catch (localError) {
      return left(LocalFailure(localError.error));
    }
  }
  Future<Either<Failure, Unit>> openDownLoadedPlayList(int index) async {
    try {
      debugPrint(downloadedAudios.length.toString());
      await assetsAudioPlayer.open(Playlist(audios: downloadedAudios, startIndex: index),
          playInBackground: PlayInBackground.enabled, showNotification: true);
      return right(unit);
    } on LocalException catch (localError) {
      return left(LocalFailure(localError.error));
    }
  }

  initPlayList(ReciterModel audiosData) async {
    audios.clear();
    for (var detail in audiosData.moshaf) {
      List<int> surahList = toListOfInt(detail.surahList);
      for (var surahName = 0; surahName < surahList.length; surahName++) {
        String name = getSurahNameArabic(surahList[surahName]);
        String url = "${detail.server}/${formatNumber(toListOfInt(detail.surahList)[surahName],3)}.mp3";
        ({bool exist, String nameFile, String path}) file = await ifFileExist(url, audiosData.name,detail.name);
        await addAudios(file, name, detail, url, audiosData);
      }
    }
  }

  Future<void> addAudios(
      ({bool exist, String nameFile, String path}) file,
      String name, MoshafModel detail, String url, ReciterModel audiosData) async {
    switch (file.exist) {
      case true:
        debugPrint('${file.path} exist');
        Audio audio = Audio.file(file.path,
            metas: Metas(
                title: name,
                artist: audiosData.name,
                album: detail.name,
                id: file.nameFile,
                image: MetasImage.asset(audiosData.image!)));
        audios.add(audio);
        downloadedAudios.add(audio);
      case false:
        debugPrint('${file.path} not exist');
        audios.add(Audio.network(url,
            metas: Metas(
                title: name,
                artist: audiosData.name,
                album: detail.name,
                id: file.nameFile,
                image: MetasImage.asset(audiosData.image!))));
    }
  }
}
