abstract class ThemeState {}

class LoadingThemeState implements ThemeState {
  const LoadingThemeState();
}

class ErrorThemeState implements ThemeState {

}

class SuccessThemeState implements ThemeState {
  const SuccessThemeState();
}

class LoggedThemeState implements ThemeState {
  const LoggedThemeState();
}

class LoggedOutThemeState implements ThemeState {
  const LoggedOutThemeState();
}