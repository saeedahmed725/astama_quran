import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:astama/Features/author/view/bloc/LeastListening/least_listening_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/single_child_widget.dart';

import '../../Features/author/data/data_source/remote_data_source.dart';
import '../../Features/author/data/repos/author_repo_imp.dart';
import '../../Features/author/domain/use_cases/get_audio_use_case.dart';
import '../../Features/author/view/bloc/author/author_bloc.dart';
import '../../Features/home/data/data_sources/local_data_source.dart';
import '../../Features/home/data/data_sources/remote_data_source.dart';
import '../../Features/home/data/repos/home_repo_impl.dart';
import '../../Features/home/view/bloc/home_bloc.dart';
import '../bloc/theme/theme_bloc.dart';
import '../controller/author_controller.dart';
import '../controller/player_controller.dart';
import '../services/reciter_services/reciter_services.dart';

final getIt = GetIt.instance;
List<SingleChildWidget> providers = [
  BlocProvider(
    create: (context) => ThemeBloc()..add(GetCurrentThemeEvent()),
  ),
  BlocProvider(
      create: (context) =>
          LeastListeningBloc()..add(GetLeastListeningReciterEvent())),
  BlocProvider(
      create: (context) => HomeBloc(homeRepoImpl: getIt.get<HomeRepoImpl>())
        ..add(FetchReciterList())),
  BlocProvider(
      create: (context) => AuthorBloc(getIt.get<PlayerController>(),
          getIt.get<AuthorGetAudioFilesUseCase>(), AuthorController()))
];

setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      Dio(),
    ),
  );
  getIt.registerSingleton<PlayerController>(
      PlayerController(AssetsAudioPlayer.newPlayer()));

  getIt.registerSingleton<AuthorGetAudioFilesUseCase>(
      AuthorGetAudioFilesUseCase(
          AuthorRepoImp(AuthorRemoteDataSourceImp(getIt.get<ApiServices>()))));

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    homeRemoteDataSource: HomeRemoteDataSourceImpl(
      getIt.get<ApiServices>(),
    ),
    homeLocalDataSource: HomeLocalDataSourceImpl(),
  ));
}
