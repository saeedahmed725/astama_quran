import 'package:astama/Features/author/view/bloc/author/author_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/function.dart';
import '../../domain/repo/author_repo.dart';
import '../../view/bloc/percent/percent_bloc.dart';
import '../data_source/remote_data_source.dart';

class AuthorRepoImp extends AuthorRepo {
  final AuthorRemoteDataSource authorRemoteDataSource;

  AuthorRepoImp(this.authorRemoteDataSource);

  @override
  Future<Either<Failure, Unit>> getAudioFiles(
      {required String url,
      required String fileName,
      required BuildContext context,
      required int index}) async {
    try {
      PermissionStatus permission = await Permission.storage.status;
      if (await checkInternet()) {
        if (permission == PermissionStatus.granted) {
          if (!await ifAudioFileExist(fileName)) {
            authorRemoteDataSource.downloadFiles(
                url: url,
                fileName: fileName,
                onReceiveProgress: (count, total) {
                  if (count != -1) {
                    context
                        .read<PercentBloc>()
                        .add(UpdatePercent((count / total), index));
                  }
                },
                onValue: (value) => context
                    .read<AuthorBloc>()
                    .add(LoadingPlayListReciter())); // Update audio list
          }
        } else {
          await requestPermission();
        }
      }
      return right(unit);
    } on RemoteException catch (remoteException) {
      return left(ServerFailure.fromDioError(remoteException));
    } on Exception catch (ex) {
      return left(ServerFailure(ex.toString()));
    }
  }
}
