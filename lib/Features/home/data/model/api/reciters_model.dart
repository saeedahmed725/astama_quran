import 'package:hive/hive.dart';

part 'reciters_model.g.dart';

@HiveType(typeId: 0)
class ReciterModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String letter;
  @HiveField(3)
  final List<MoshafModel> moshaf;
  @HiveField(4)
  final String? image;

  ReciterModel(
      {required this.id,
      required this.name,
      required this.letter,
      required this.moshaf, this.image});

  factory ReciterModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> moshafJson = json['moshaf'];
    final List<MoshafModel> moshafList =
        moshafJson.map((moshaf) => MoshafModel.fromJson(moshaf)).toList();
    return ReciterModel(
      id: json['id'],
      name: json['name'],
      letter: json['letter'],
      image: json['image'],
      moshaf: moshafList,
    );
  }
}

@HiveType(typeId: 1)
class MoshafModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String server;
  @HiveField(3)
  final int surahTotal;
  @HiveField(4)
  final int moshafType;
  @HiveField(5)
  final String surahList;

  MoshafModel(
      {required this.id,
      required this.name,
      required this.server,
      required this.surahTotal,
      required this.moshafType,
      required this.surahList});

  factory MoshafModel.fromJson(Map<String, dynamic> json) {
    return MoshafModel(
      id: json['id'],
      name: json['name'],
      server: json['server'],
      surahTotal: json['surah_total'],
      moshafType: json['moshaf_type'],
      surahList: json['surah_list'],
    );
  }
}
