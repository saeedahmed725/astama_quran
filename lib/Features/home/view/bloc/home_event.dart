part of 'home_bloc.dart';

abstract class HomeEvent {}

class FetchReciterList extends HomeEvent {}

class SearchEvent extends HomeEvent {
  final String searchText;
  SearchEvent(this.searchText);
}

class GotToAuthorPage extends HomeEvent {
  final BuildContext context;
  final int index;
  GotToAuthorPage(this.context, this.index);
}
