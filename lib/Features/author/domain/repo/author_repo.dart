import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/failures.dart';

abstract class AuthorRepo {
  Future<Either<Failure, Unit>> getAudioFiles(
      {required String url,
      required String fileName,
      required BuildContext context, required int index});
}
