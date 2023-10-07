part of 'author_bloc.dart';

@immutable
abstract class AuthorState extends Equatable {}

class AuthorInitial extends AuthorState {
  @override
  List<Object?> get props => [];
}

class InitPlayListReciterSuccess extends AuthorState {
  @override
  List<Object?> get props => [];
}

class LoadingPlayListReciterSuccess extends AuthorState {
  final List<ReciterEntity> allReciters;

  LoadingPlayListReciterSuccess(this.allReciters);

  @override
  List<Object?> get props => [allReciters];
}
class DownloadedPlayListReciterSuccess extends AuthorState {
  final List<ReciterEntity> downloadedReciters;

  DownloadedPlayListReciterSuccess(this.downloadedReciters);

  @override

  List<Object?> get props =>[downloadedReciters];
}

class PlayedLocalAudioSuccess extends AuthorState {
  @override
  List<Object?> get props => [];
}
class PlayedRemoteAudioSuccess extends AuthorState {
  @override
  List<Object?> get props => [];
}

class ProgressDownloading extends AuthorState {
  final int progress;

  ProgressDownloading(this.progress);

  @override
  List<Object?> get props => [progress];
}

class DownloadingAudioFailure extends AuthorState {
  final LocalFailure failure;

  DownloadingAudioFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
