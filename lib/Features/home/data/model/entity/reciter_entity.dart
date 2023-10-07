import 'package:equatable/equatable.dart';

class ReciterEntity extends Equatable{
  final String shihkName;
  final String rowya;
  final String surahName;
  final String serverUrl;

  const ReciterEntity(
      {required this.shihkName,
      required this.rowya,
      required this.surahName,
      required this.serverUrl});

  @override
  List<Object?> get props =>[shihkName,rowya,surahName,serverUrl];
}
