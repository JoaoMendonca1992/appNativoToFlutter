import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:module_flutter/pages/investment/questions_investiment/domain/entities/answers_entite.dart';
import 'package:module_flutter/pages/investment/questions_investiment/domain/entities/answers_response_entite.dart';
import 'package:module_flutter/pages/investment/questions_investiment/domain/entities/question_data_entite.dart';
import 'package:module_flutter/pages/investment/questions_investiment/domain/entities/question_entite.dart';
import 'package:module_flutter/pages/investment/questions_investiment/domain/usecases/question_user_case.dart';
import 'package:module_flutter/pages/investment/questions_investiment/presenter/component/investiment_profile_component.dart';
import 'package:module_flutter/pages/investment/questions_investiment/presenter/state/question_state.dart';
import 'package:module_flutter/utils/errors/error_model.dart';

part 'questions_controller.g.dart';

class QuestionsController = _QuestionsController with _$QuestionsController;

abstract class _QuestionsController with Store {
  final QuestionUseCase useCase;
  _QuestionsController(this.useCase);

  @observable
  QuestionsState state =   InitialQuestionState();

  @observable
  QuestionDataEntite? questionDataEntite;

  @observable
  AnswerResponseEntite? answerResponseEntite;

  @observable
  List<AnswersEntite>? listAnswerEntites;

  @observable
  int selectedQuestion = 0;

  @action
  setSelectionQuestion(int i) => selectedQuestion = i;

  @action
  setState(QuestionsState value) => state = value;

  @action
  setModel(QuestionDataEntite entite) => questionDataEntite = entite;

  @action
  setModelRepsonseQuestion(AnswerResponseEntite? entite) => answerResponseEntite = entite;

  @action
  setQuestions(List<AnswersEntite>? list){
    listAnswerEntites = list;
  }

  @observable
  int maxPages = 0;

  @observable
  int indexPage = 0;

  @action
  nextPage(int previusPage){
    if(indexPage < maxPages){
      indexPage ++;
    }
  }

  @action
  selectedAnswers(int index, List<AnswersEntite> answersEntite){
    for(int i = 0; i < answersEntite.length; i++){
      if(i == index){
        if(answersEntite[index].selected!){
          answersEntite[index].selected = false;
        }else{
          answersEntite[index].selected = true;
        }
      }else{
        answersEntite[i].selected = false;
      }
    }
    setState(NextQuestionState());
  }

  @action
  get_next_question(BuildContext context) async{
    setState( const LoadingQuestionsState());
    var result;
   if(indexPage < maxPages || maxPages == 0){
     result = await useCase.next_question(indexPage);
     if(result!= null){
       if(result is QuestionDataEntite) {
         maxPages = result.question!.questionsLength!;
         setModel(result);
         setQuestions(result.question!.answers);
         if(result.question!.key == 'intro'){
           return setState(InitialQuestionState());
         }else{
           return setState(NextQuestionState());
         }
       }else if (result is ErrorModel){
         setState(NextQuestionState());
         return alertError(context,result.errorMessage.toString(), 'Error');
       }
     }else{
       setState(NextQuestionState());
       return  alertError(context,"Não foi possivel carregar as informações!", 'Error');
     }
   }else{
      return setState(ProfileBoldInvertimentState());
   }

  }

  @action
  set_question(BuildContext context, QuestionEntite? questionEntite, int index) async{
    var result = await useCase.set_question(questionEntite!.id!, questionEntite.answers![index].sId!);
    if(result!= null){
      if(result is AnswerResponseEntite) {
        setModelRepsonseQuestion(result);
        if(indexPage < maxPages || maxPages == 0) {
          await get_next_question(context);
          return setState(NextQuestionState());
        }else{
          return setState(ProfileBoldInvertimentState());
        }
      }else if (result is ErrorModel){
        setState(NextQuestionState());
        return alertError(context,result.errorMessage.toString(), 'Error');
      }else{
        setState(NextQuestionState());
        return  alertError(context,"Não foi possivel carregar as informações!", 'Error');
      }
    }else{
      setState(NextQuestionState());
      return  alertError(context,"Não foi possivel carregar as informações!", 'Error');
    }
  }


  alertError(BuildContext context, String body, String title)async {
    final result = await showOkAlertDialog(
      context: context,
      title: title,
      message: body,
      onWillPop: () => Future.value(false),
    );
    assert(result == OkCancelResult.ok);
  }
  @action
  bool verifyQuestions(List<AnswersEntite> answersEntite){
    for(int i = 0; i < answersEntite.length; i++){
      if(answersEntite[i].selected == true){
       return true;
      }
    }
    setState(NextQuestionState());
    return false;
  }

  @action
  String get_string_button(){
    var index = indexPage + 1;
    if(index > maxPages){
      return 'Continuar';
    }else if(index == maxPages){
      return 'Finalizar';
    }
     return 'Continuar';
  }

  alertQuestion(BuildContext context) async {
    final result = await showOkAlertDialog(
      context: context,
      title: '',
      message: 'Selecione uma resposta!',
      onWillPop: () => Future.value(false),
    );
    assert(result == OkCancelResult.ok);
  }

 Widget verifyProfile(String typeProfile, BuildContext context){
   switch (typeProfile){
     case 'bold':
       return getTypeProfile(context, 'bold.svg', 'arrojado ', 'Produtos recomendados: Aluguéis de Ações (BTC), Tesouro Direto, Títulos de Renda Fixa e Fundos de Investimento, COE.');
     case 'conservative':
       return getTypeProfile(context, 'conservative.svg', 'conservador', 'Produtos recomendados: Tesouro Direto, Títulos de Renda Fixa e Fundos de Investimento.');
     case 'moderate':
       return getTypeProfile(context, 'moderate.svg', 'moderado','Produtos recomendados: Tesouro Direto, Títulos de Renda Fixa e Fundos de Investimento e Ofertas Públicas.');
   }
   return getTypeProfile(context, 'moderate.svg', 'moderado','Produtos recomendados: Tesouro Direto, Títulos de Renda Fixa e Fundos de Investimento e Ofertas Públicas.');
 }

  retakeTest(BuildContext context) async{
    indexPage =0;
    maxPages = 0;
    selectedQuestion = 0;
    setState(LoadingQuestionsState());
    await get_next_question(context);
    setState(InitialQuestionState());
  }


}
