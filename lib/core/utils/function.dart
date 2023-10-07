import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

setLeastListeningSurah(int value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('LeastListeningSurah', value);
}

setLeastListeningReciter(int value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('LeastListeningReciter', value);
}
Future<int?> getLeastListeningSurah() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
 return prefs.getInt('LeastListeningSurah');
}

Future<int?> getLeastListeningReciter() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
 return prefs.getInt('LeastListeningReciter');
}

List<int> toListOfInt(String list) {
  List<int> surahList =
      list.split(',').map((String num) => int.parse(num)).toList();
  return surahList;
}

String formatNumber(int number, int totalDigits) {
  String numberStr = number.toString();
  int zerosToAdd = totalDigits - numberStr.length;
  String formattedNumber = '0' * zerosToAdd + numberStr;
  return formattedNumber;
}

Future<bool> checkInternet() async {
  ConnectivityResult connectivityResult =
      await (Connectivity().checkConnectivity());
  switch (connectivityResult) {
    case ConnectivityResult.mobile:
      return true;

    case ConnectivityResult.wifi:
      return true;

    default:
      BotToast.showText(
          text: "No internet", duration: const Duration(seconds: 4));
      return false;
  }
}

Future<void> requestPermission() async {
  Permission permission = Permission.storage;
  if (await permission.isDenied) {
    final result = await permission.request();
    if (result.isGranted) {
      BotToast.showText(
          text: "Storage permission is granted",
          duration: const Duration(seconds: 4));
    } else if (result.isDenied) {
      BotToast.showText(
          text: "Storage permission is denied",
          duration: const Duration(seconds: 4));
    } else if (result.isPermanentlyDenied) {
      BotToast.showText(
          text: "Storage permission is permanently denied",
          duration: const Duration(seconds: 4));
    }
  }
}

Future<Directory> getDownloadPath() async {
  Directory? directory;
  try {
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = Directory('/storage/emulated/0/Download');
      if (!await directory.exists()) {
        directory = await getExternalStorageDirectory();
      }
    }
  } catch (err, stack) {
    debugPrint("Cannot get download folder path $stack");
  }
  if (directory != null) {
    return directory;
  } else {
    throw 'Cannot get download folder path';
  }
}

Future<bool> ifAudioFileExist(String fileName) async {
  Directory dir = await getDownloadPath();
  String filePath = '${dir.path}$fileName';
  debugPrint('author repo file $filePath');
  return File(filePath).existsSync();
}

Future<({bool exist, String path, String nameFile})> ifFileExist(
    String surah, String shihkName, String rowya) async {
  Directory dir = await getDownloadPath();
  String surahName = path.basename(surah);
  String filePath = '${dir.path}/$shihkName/$rowya/$surahName';
  return (
    exist: File(filePath).existsSync(),
    path: filePath,
    nameFile: '/$shihkName/$rowya/$surahName'
  );
}

Future<String> getFilePath(String surah, String shihk) async {
  Directory dir = await getApplicationDocumentsDirectory();
  String surahName = path.basename(surah);
  String shihkName = path.basename(shihk);
  return '${dir.path}/$shihkName/$surahName';
}

String durationToString(Duration duration) {
  debugPrint(duration.toString());
  String twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }

  final twoDigitMinutes =
      twoDigits(duration.inMinutes.remainder(Duration.minutesPerHour));
  final twoDigitSeconds =
      twoDigits(duration.inSeconds.remainder(Duration.secondsPerMinute));
  return '$twoDigitMinutes:$twoDigitSeconds';
}

Widget loopIcon(LoopMode loopMode) {
  const iconSize = 30.0;
  switch (loopMode) {
    case LoopMode.none:
      return Icon(
        Icons.loop,
        size: iconSize,
        color: Colors.white.withOpacity(0.5),
      );
    case LoopMode.single:
      return const Icon(
        Icons.loop,
        size: iconSize,
        color: Colors.white,
      );
    case LoopMode.playlist:
      return const Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.loop,
            size: iconSize,
            color: Colors.white,
          ),
          Center(
            child: Text(
              '1',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
  }
}

// int getPlayedIndexPlayList(int i, int playIndex, int index, ReciterModel data) {
//   if (i == 0) {
//     playIndex = index;
//   } else if (i == 1) {
//     playIndex = toListOfInt(data.moshaf[i - 1].surahList).length + (index);
//   } else if (i == 2) {
//     playIndex = toListOfInt(data.moshaf[i - 1].surahList).length +
//         toListOfInt(data.moshaf[i - 2].surahList).length +
//         (index);
//   } else if (i == 3) {
//     playIndex = toListOfInt(data.moshaf[i - 1].surahList).length +
//         toListOfInt(data.moshaf[i - 2].surahList).length +
//         toListOfInt(data.moshaf[i - 3].surahList).length +
//         (index);
//   } else if (i == 4) {
//     playIndex = toListOfInt(data.moshaf[i - 1].surahList).length +
//         toListOfInt(data.moshaf[i - 2].surahList).length +
//         toListOfInt(data.moshaf[i - 3].surahList).length +
//         toListOfInt(data.moshaf[i - 4].surahList).length +
//         (index);
//   } else if (i == 5) {
//     playIndex = toListOfInt(data.moshaf[i - 1].surahList).length +
//         toListOfInt(data.moshaf[i - 2].surahList).length +
//         toListOfInt(data.moshaf[i - 3].surahList).length +
//         toListOfInt(data.moshaf[i - 4].surahList).length +
//         toListOfInt(data.moshaf[i - 5].surahList).length +
//         (index);
//   } else if (i == 6) {
//     playIndex = toListOfInt(data.moshaf[i - 1].surahList).length +
//         toListOfInt(data.moshaf[i - 2].surahList).length +
//         toListOfInt(data.moshaf[i - 3].surahList).length +
//         toListOfInt(data.moshaf[i - 4].surahList).length +
//         toListOfInt(data.moshaf[i - 5].surahList).length +
//         toListOfInt(data.moshaf[i - 6].surahList).length +
//         (index);
//   } else if (i == 7) {
//     playIndex = toListOfInt(data.moshaf[i - 1].surahList).length +
//         toListOfInt(data.moshaf[i - 2].surahList).length +
//         toListOfInt(data.moshaf[i - 3].surahList).length +
//         toListOfInt(data.moshaf[i - 4].surahList).length +
//         toListOfInt(data.moshaf[i - 5].surahList).length +
//         toListOfInt(data.moshaf[i - 6].surahList).length +
//         toListOfInt(data.moshaf[i - 7].surahList).length +
//         (index);
//   } else if (i == 8) {
//     playIndex = toListOfInt(data.moshaf[i - 1].surahList).length +
//         toListOfInt(data.moshaf[i - 2].surahList).length +
//         toListOfInt(data.moshaf[i - 3].surahList).length +
//         toListOfInt(data.moshaf[i - 4].surahList).length +
//         toListOfInt(data.moshaf[i - 5].surahList).length +
//         toListOfInt(data.moshaf[i - 6].surahList).length +
//         toListOfInt(data.moshaf[i - 7].surahList).length +
//         toListOfInt(data.moshaf[i - 8].surahList).length +
//         (index);
//   }
//   return playIndex;
// }
