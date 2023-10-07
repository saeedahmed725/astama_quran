import 'package:astama/Features/author/domain/entity/reciter_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/quran.dart';

import '../../../../../core/controller/author_controller.dart';
import '../../../../../core/controller/player_controller.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/utils/function.dart';
import '../../../../home/data/model/api/reciters_model.dart';
import '../../../domain/use_cases/get_audio_use_case.dart';

part 'author_event.dart';

part 'author_state.dart';

class AuthorBloc extends Bloc<AuthorEvent, AuthorState> {
  late ReciterModel reciterData;
  AuthorGetAudioFilesUseCase authorGetAudioFilesUseCase;
  PlayerController playerController;
  AuthorController authorController;
  List<ReciterEntity> allReciters = [];
  List<ReciterEntity> downloadedReciters = [];

  AuthorBloc(this.playerController, this.authorGetAudioFilesUseCase,
      this.authorController)
      : super(AuthorInitial()) {
    on<PlayRemoteAudio>((event, emit) async {
      Either<Failure, Unit> result =
      await playerController.openRemotePlayList(event.index);
      result.fold((failure) => debugPrint(failure.errMessage.toString()),
          (_) => emit(PlayedRemoteAudioSuccess()));
    });

    on<PlayLocalAudio>((event, emit) async {
      Either<Failure, Unit> result = await playerController.openDownLoadedPlayList(event.index);
      result.fold((failure) => debugPrint(failure.errMessage.toString()),
          (_) => emit(PlayedLocalAudioSuccess()));
    });

    on<DownloadingPlayList>((event, emit) async {
      Either<Failure, Unit> result = await authorGetAudioFilesUseCase.call(
          url: playerController.audios[event.index].path,
          fileName: playerController.audios[event.index].metas.id!,
          context: event.context,
          index: event.index);
      result.fold(
          (failure) =>
              emit(DownloadingAudioFailure(LocalFailure(failure.errMessage))),
          (_) => null);
    });

    on<InitPlayListReciter>((event, emit) {
      playerController.initPlayList(reciterData);
      emit(InitPlayListReciterSuccess());
    });

    on<LoadingPlayListReciter>((event, emit) async {
      await authorController.getPlayListReciter(reciterData, allReciters,
          isDownloaded: false);
      emit(LoadingPlayListReciterSuccess(allReciters));
    });

    on<DownloadedPlayListReciter>((event, emit) async {
      await authorController.getPlayListReciter(reciterData, downloadedReciters,
          isDownloaded: true);
      emit(DownloadedPlayListReciterSuccess(downloadedReciters));
    });
  }
}


