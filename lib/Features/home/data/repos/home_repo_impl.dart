import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failures.dart';
import '../data_sources/local_data_source.dart';
import '../data_sources/remote_data_source.dart';
import '../model/api/reciters_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ReciterModel>>> fetchMoshafReciterList();

}

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<ReciterModel>>> fetchMoshafReciterList() async {
    List<ReciterModel> reciters;
    try {
      reciters = homeLocalDataSource.fetchMoshafReciterList();
      if (reciters.isNotEmpty) {
        debugPrint('homeLocalDataSource');
        return right(reciters);
      }
      reciters = await homeRemoteDataSource.fetchMoshafReciterList();
      return right(reciters);
    } on RemoteException catch (remoteException) {
      return left(ServerFailure.fromDioError(remoteException));
    } on Exception catch (ex) {
      return left(
        ServerFailure(ex.toString()),
      );
    }
  }
}
