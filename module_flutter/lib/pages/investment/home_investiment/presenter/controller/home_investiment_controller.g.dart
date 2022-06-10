// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_investiment_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeInvestimentController on _HomeInvestimentController, Store {
  late final _$isShowBalanceAtom =
      Atom(name: '_HomeInvestimentController.isShowBalance', context: context);

  @override
  bool get isShowBalance {
    _$isShowBalanceAtom.reportRead();
    return super.isShowBalance;
  }

  @override
  set isShowBalance(bool value) {
    _$isShowBalanceAtom.reportWrite(value, super.isShowBalance, () {
      super.isShowBalance = value;
    });
  }

  late final _$homeInvestimentEntiteAtom = Atom(
      name: '_HomeInvestimentController.homeInvestimentEntite',
      context: context);

  @override
  HomeInvestimentEntite? get homeInvestimentEntite {
    _$homeInvestimentEntiteAtom.reportRead();
    return super.homeInvestimentEntite;
  }

  @override
  set homeInvestimentEntite(HomeInvestimentEntite? value) {
    _$homeInvestimentEntiteAtom.reportWrite(value, super.homeInvestimentEntite,
        () {
      super.homeInvestimentEntite = value;
    });
  }

  late final _$stateAtom =
      Atom(name: '_HomeInvestimentController.state', context: context);

  @override
  HomeInvestimentState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(HomeInvestimentState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$get_homeAsyncAction =
      AsyncAction('_HomeInvestimentController.get_home', context: context);

  @override
  Future get_home(BuildContext context) {
    return _$get_homeAsyncAction.run(() => super.get_home(context));
  }

  late final _$_HomeInvestimentControllerActionController =
      ActionController(name: '_HomeInvestimentController', context: context);

  @override
  dynamic setBalance(bool balance) {
    final _$actionInfo = _$_HomeInvestimentControllerActionController
        .startAction(name: '_HomeInvestimentController.setBalance');
    try {
      return super.setBalance(balance);
    } finally {
      _$_HomeInvestimentControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setModel(HomeInvestimentEntite entite) {
    final _$actionInfo = _$_HomeInvestimentControllerActionController
        .startAction(name: '_HomeInvestimentController.setModel');
    try {
      return super.setModel(entite);
    } finally {
      _$_HomeInvestimentControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setState(HomeInvestimentState value) {
    final _$actionInfo = _$_HomeInvestimentControllerActionController
        .startAction(name: '_HomeInvestimentController.setState');
    try {
      return super.setState(value);
    } finally {
      _$_HomeInvestimentControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isShowBalance: ${isShowBalance},
homeInvestimentEntite: ${homeInvestimentEntite},
state: ${state}
    ''';
  }
}
