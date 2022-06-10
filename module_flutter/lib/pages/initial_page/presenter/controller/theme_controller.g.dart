// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeController on _ThemeController, Store {
  late final _$stateAtom =
      Atom(name: '_ThemeController.state', context: context);

  @override
  ThemeState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ThemeState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$themeEntiteAtom =
      Atom(name: '_ThemeController.themeEntite', context: context);

  @override
  ThemeEntite? get themeEntite {
    _$themeEntiteAtom.reportRead();
    return super.themeEntite;
  }

  @override
  set themeEntite(ThemeEntite? value) {
    _$themeEntiteAtom.reportWrite(value, super.themeEntite, () {
      super.themeEntite = value;
    });
  }

  late final _$getThemeAsyncAction =
      AsyncAction('_ThemeController.getTheme', context: context);

  @override
  Future getTheme(BuildContext context) {
    return _$getThemeAsyncAction.run(() => super.getTheme(context));
  }

  late final _$_ThemeControllerActionController =
      ActionController(name: '_ThemeController', context: context);

  @override
  dynamic setState(ThemeState value) {
    final _$actionInfo = _$_ThemeControllerActionController.startAction(
        name: '_ThemeController.setState');
    try {
      return super.setState(value);
    } finally {
      _$_ThemeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setModel(ThemeEntite entite) {
    final _$actionInfo = _$_ThemeControllerActionController.startAction(
        name: '_ThemeController.setModel');
    try {
      return super.setModel(entite);
    } finally {
      _$_ThemeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
themeEntite: ${themeEntite}
    ''';
  }
}
