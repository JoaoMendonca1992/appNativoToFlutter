// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuestionsController on _QuestionsController, Store {
  late final _$stateAtom =
      Atom(name: '_QuestionsController.state', context: context);

  @override
  QuestionsState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(QuestionsState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$questionDataEntiteAtom =
      Atom(name: '_QuestionsController.questionDataEntite', context: context);

  @override
  QuestionDataEntite? get questionDataEntite {
    _$questionDataEntiteAtom.reportRead();
    return super.questionDataEntite;
  }

  @override
  set questionDataEntite(QuestionDataEntite? value) {
    _$questionDataEntiteAtom.reportWrite(value, super.questionDataEntite, () {
      super.questionDataEntite = value;
    });
  }

  late final _$answerResponseEntiteAtom =
      Atom(name: '_QuestionsController.answerResponseEntite', context: context);

  @override
  AnswerResponseEntite? get answerResponseEntite {
    _$answerResponseEntiteAtom.reportRead();
    return super.answerResponseEntite;
  }

  @override
  set answerResponseEntite(AnswerResponseEntite? value) {
    _$answerResponseEntiteAtom.reportWrite(value, super.answerResponseEntite,
        () {
      super.answerResponseEntite = value;
    });
  }

  late final _$listAnswerEntitesAtom =
      Atom(name: '_QuestionsController.listAnswerEntites', context: context);

  @override
  List<AnswersEntite>? get listAnswerEntites {
    _$listAnswerEntitesAtom.reportRead();
    return super.listAnswerEntites;
  }

  @override
  set listAnswerEntites(List<AnswersEntite>? value) {
    _$listAnswerEntitesAtom.reportWrite(value, super.listAnswerEntites, () {
      super.listAnswerEntites = value;
    });
  }

  late final _$selectedQuestionAtom =
      Atom(name: '_QuestionsController.selectedQuestion', context: context);

  @override
  int get selectedQuestion {
    _$selectedQuestionAtom.reportRead();
    return super.selectedQuestion;
  }

  @override
  set selectedQuestion(int value) {
    _$selectedQuestionAtom.reportWrite(value, super.selectedQuestion, () {
      super.selectedQuestion = value;
    });
  }

  late final _$maxPagesAtom =
      Atom(name: '_QuestionsController.maxPages', context: context);

  @override
  int get maxPages {
    _$maxPagesAtom.reportRead();
    return super.maxPages;
  }

  @override
  set maxPages(int value) {
    _$maxPagesAtom.reportWrite(value, super.maxPages, () {
      super.maxPages = value;
    });
  }

  late final _$indexPageAtom =
      Atom(name: '_QuestionsController.indexPage', context: context);

  @override
  int get indexPage {
    _$indexPageAtom.reportRead();
    return super.indexPage;
  }

  @override
  set indexPage(int value) {
    _$indexPageAtom.reportWrite(value, super.indexPage, () {
      super.indexPage = value;
    });
  }

  late final _$get_next_questionAsyncAction =
      AsyncAction('_QuestionsController.get_next_question', context: context);

  @override
  Future get_next_question(BuildContext context) {
    return _$get_next_questionAsyncAction
        .run(() => super.get_next_question(context));
  }

  late final _$set_questionAsyncAction =
      AsyncAction('_QuestionsController.set_question', context: context);

  @override
  Future set_question(
      BuildContext context, QuestionEntite? questionEntite, int index) {
    return _$set_questionAsyncAction
        .run(() => super.set_question(context, questionEntite, index));
  }

  late final _$_QuestionsControllerActionController =
      ActionController(name: '_QuestionsController', context: context);

  @override
  dynamic setSelectionQuestion(int i) {
    final _$actionInfo = _$_QuestionsControllerActionController.startAction(
        name: '_QuestionsController.setSelectionQuestion');
    try {
      return super.setSelectionQuestion(i);
    } finally {
      _$_QuestionsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setState(QuestionsState value) {
    final _$actionInfo = _$_QuestionsControllerActionController.startAction(
        name: '_QuestionsController.setState');
    try {
      return super.setState(value);
    } finally {
      _$_QuestionsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setModel(QuestionDataEntite entite) {
    final _$actionInfo = _$_QuestionsControllerActionController.startAction(
        name: '_QuestionsController.setModel');
    try {
      return super.setModel(entite);
    } finally {
      _$_QuestionsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setModelRepsonseQuestion(AnswerResponseEntite? entite) {
    final _$actionInfo = _$_QuestionsControllerActionController.startAction(
        name: '_QuestionsController.setModelRepsonseQuestion');
    try {
      return super.setModelRepsonseQuestion(entite);
    } finally {
      _$_QuestionsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQuestions(List<AnswersEntite>? list) {
    final _$actionInfo = _$_QuestionsControllerActionController.startAction(
        name: '_QuestionsController.setQuestions');
    try {
      return super.setQuestions(list);
    } finally {
      _$_QuestionsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic nextPage(int previusPage) {
    final _$actionInfo = _$_QuestionsControllerActionController.startAction(
        name: '_QuestionsController.nextPage');
    try {
      return super.nextPage(previusPage);
    } finally {
      _$_QuestionsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectedAnswers(int index, List<AnswersEntite> answersEntite) {
    final _$actionInfo = _$_QuestionsControllerActionController.startAction(
        name: '_QuestionsController.selectedAnswers');
    try {
      return super.selectedAnswers(index, answersEntite);
    } finally {
      _$_QuestionsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool verifyQuestions(List<AnswersEntite> answersEntite) {
    final _$actionInfo = _$_QuestionsControllerActionController.startAction(
        name: '_QuestionsController.verifyQuestions');
    try {
      return super.verifyQuestions(answersEntite);
    } finally {
      _$_QuestionsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String get_string_button() {
    final _$actionInfo = _$_QuestionsControllerActionController.startAction(
        name: '_QuestionsController.get_string_button');
    try {
      return super.get_string_button();
    } finally {
      _$_QuestionsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
questionDataEntite: ${questionDataEntite},
answerResponseEntite: ${answerResponseEntite},
listAnswerEntites: ${listAnswerEntites},
selectedQuestion: ${selectedQuestion},
maxPages: ${maxPages},
indexPage: ${indexPage}
    ''';
  }
}
