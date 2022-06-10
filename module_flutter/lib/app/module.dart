import 'package:flutter_modular/flutter_modular.dart';
import 'package:module_flutter/pages/initial_page/domain/usecases/theme_user_case.dart';
import 'package:module_flutter/pages/initial_page/external/dio_theme_datasource_impl.dart';
import 'package:module_flutter/pages/initial_page/infra/repositories/theme_respository_impl.dart';
import 'package:module_flutter/pages/initial_page/presenter/controller/theme_controller.dart';
import 'package:module_flutter/pages/initial_page/presenter/initial_page.dart';
import 'package:module_flutter/pages/initial_page/presenter/state/theme_state.dart';
import 'package:module_flutter/pages/investment/home_investiment/domain/usecases/home_investiment_user_case.dart';
import 'package:module_flutter/pages/investment/home_investiment/external/dio_home_datasource_impl.dart';
import 'package:module_flutter/pages/investment/home_investiment/infra/repositories/home_investiment_respository_impl.dart';
import 'package:module_flutter/pages/investment/home_investiment/presenter/controller/home_investiment_controller.dart';
import 'package:module_flutter/pages/investment/home_investiment/presenter/pages/home_investiment_page.dart';
import 'package:module_flutter/pages/investment/investment_selection/presenter/controller/investiment_selection_controller.dart';
import 'package:module_flutter/pages/investment/investment_selection/presenter/investiment_selection_page.dart';
import 'package:module_flutter/pages/investment/investment_selection/presenter/selection_summary_page.dart';
import 'package:module_flutter/pages/investment/questions_investiment/domain/usecases/question_user_case.dart';
import 'package:module_flutter/pages/investment/questions_investiment/external/dio_question_datasource_impl.dart';
import 'package:module_flutter/pages/investment/questions_investiment/infra/repositories/question_respository_impl.dart';
import 'package:module_flutter/pages/investment/questions_investiment/presenter/controller/questions_controller.dart';
import 'package:module_flutter/pages/investment/questions_investiment/presenter/pages/quesrtions_investiment_page_one.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => const LoadingThemeState()),
    Bind((i) => ThemeController(i.get())),
    Bind((i) => DioThemeDatasourceImpl()),
    Bind((i) => ThemeRepositoryImpl(i.get())),
    Bind((i) => ThemeUseCaseimpl(i.get())),
    Bind((i) => QuestionsController(i.get())),
    Bind((i) => DioQuestionDatasourceImpl()),
    Bind((i) => QuestionRepositoryImpl(i.get())),
    Bind((i) => QuestionUseCaseimpl(i.get())),
    Bind((i) => HomeInvestimentController(i.get())),
    Bind((i) => DioHomeInvestimentDatasourceImpl()),
    Bind((i) => HomeInvestimentRepositoryImpl(i.get())),
    Bind((i) => HomeInvestimentUseCaseimpl(i.get())),
    Bind((i) => InvestimentSelectionController())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) =>  const InitialPageLoading()),
    ChildRoute(Modular.initialRoute + "questions_investiment_page_one", child: (_, args) => const QuestionsInvestimentPageOne()),
    ChildRoute(Modular.initialRoute+ "home_investiment_page", child:  (_, args) =>  const HomeInvestimentPage()),
    ChildRoute(Modular.initialRoute+ "investiment_selection_page", child:  (_, args) =>  InvestimentSelectionPage()),
    ChildRoute(Modular.initialRoute+ "selection_summary_page", child:  (_, args) =>  SelectionSummaryPage()),


  ];
}
