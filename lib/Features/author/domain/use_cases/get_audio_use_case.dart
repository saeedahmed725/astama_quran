import 'package:astama/Features/author/data/repos/author_repo_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/failures.dart';

class AuthorGetAudioFilesUseCase {
  final AuthorRepoImp authorRepoImp;

  AuthorGetAudioFilesUseCase(this.authorRepoImp);

  Future<Either<Failure, Unit>> call(
      {required String url,
      required String fileName,
      required BuildContext context,
      required int index}) async {
    return authorRepoImp.getAudioFiles(
        url: url, fileName: fileName, context: context, index: index);
  }
}
