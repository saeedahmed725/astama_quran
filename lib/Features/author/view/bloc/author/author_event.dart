part of 'author_bloc.dart';

@immutable
abstract class AuthorEvent extends Equatable {}

class InitPlayListReciter extends AuthorEvent {
  @override
  List<Object?> get props => [];
}

class LoadingPlayListReciter extends AuthorEvent {
  @override
  List<Object?> get props => [];
}

class DownloadedPlayListReciter extends AuthorEvent {
  @override
  List<Object?> get props => [];
}

class DownloadingPlayList extends AuthorEvent {
  final int index;
  final BuildContext context;

  DownloadingPlayList(this.index, this.context);

  @override
  List<Object?> get props => [index, context];
}

class PlayRemoteAudio extends AuthorEvent {
  final int index;

  PlayRemoteAudio(this.index);

  @override
  List<Object?> get props => [index];
}

class PlayLocalAudio extends AuthorEvent {
  final int index;

  PlayLocalAudio(this.index);

  @override
  List<Object?> get props => [index];
}
