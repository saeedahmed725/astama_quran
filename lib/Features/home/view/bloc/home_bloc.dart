import 'package:astama/core/utils/extension.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/failures.dart';
import '../../../author/view/screens/author.dart';
import '../../data/model/api/reciters_model.dart';
import '../../data/repos/home_repo_impl.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepoImpl homeRepoImpl;
  int playedIndex = 0;
  late List<ReciterModel> recitersList;

  HomeBloc({required this.homeRepoImpl}) : super(LoadingReciterList()) {
    on<HomeEvent>((event, emit) async {
      emit(LoadingReciterList());
      Either<Failure, List<ReciterModel>> result =
          await homeRepoImpl.fetchMoshafReciterList();
      result.fold(
          (failure) =>
              emit(LoadingReciterListSFailure(message: failure.errMessage)),
          (reciters) {
        List<ReciterModel> result = [];
        if (event is SearchEvent) {
          if (event.searchText.isNotEmpty) {
            for (var reciter in reciters) {
              print(event.searchText);
              if (reciter.name
                  .toString()
                  .toLowerCase()
                  .contains(event.searchText.toString().toLowerCase())) {
                result.add(reciter);
              }
            }
            recitersList = result;

            emit(SearchReciterListSuccess(reciterList: result));
          }  else {
            recitersList = reciters;
            emit(LoadingReciterListSuccess(reciterList: reciters));
          }
        } else {
          recitersList = reciters;
          emit(LoadingReciterListSuccess(reciterList: reciters));
        }
      });
    });


    on<GotToAuthorPage>((event, emit) {
      playedIndex = event.index;
      event.context
          .nextPage(const AuthorScreen(), arguments: recitersList[event.index]);
      emit(BackToHomeSuccess());
    });
  }
}
