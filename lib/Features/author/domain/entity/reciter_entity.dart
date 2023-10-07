class ReciterEntity {
  final String shihkName;
  final Map<int, String> rowya;
  final String surahName;
  final String? image;
  final String serverUrl;
  final bool isDownloaded;

  ReciterEntity(
      {this.image,
      this.isDownloaded = false,
      required this.shihkName,
      required this.rowya,
      required this.surahName,
      required this.serverUrl});
}
