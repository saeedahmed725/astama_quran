part of 'home_bloc.dart';

abstract class HomeState extends Equatable {}

class LoadingReciterList extends HomeState {
  @override
  List<Object?> get props => [];
}
class BackToHomeSuccess extends HomeState {
  @override
  List<Object?> get props => [];
}
class SearchState extends HomeState {
  @override
  List<Object?> get props => [];
}

class LoadingReciterListSuccess extends HomeState {
 final List<ReciterModel> reciterList;
  LoadingReciterListSuccess({required this.reciterList});

  @override
  List<Object?> get props => [reciterList];
}
class SearchReciterListSuccess extends HomeState {
 final List<ReciterModel> reciterList;
 SearchReciterListSuccess({required this.reciterList});

  @override
  List<Object?> get props => [reciterList];
}

class LoadingReciterListSFailure extends HomeState {
  final String message;

  LoadingReciterListSFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
