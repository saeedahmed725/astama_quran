part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class ThemeInitial extends ThemeState {
  @override
  List<Object> get props => [];
}

class LoadedThemeState extends ThemeState {
  final ThemeData themeData;
  final bool themeValue;

  const LoadedThemeState({
    required this.themeData,
    required this.themeValue,
  });

  @override
  List<Object> get props => [themeData, themeValue];
}
