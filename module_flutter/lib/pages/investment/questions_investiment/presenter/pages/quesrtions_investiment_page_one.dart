import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:module_flutter/pages/initial_page/presenter/controller/theme_controller.dart';
import 'package:module_flutter/pages/investment/questions_investiment/presenter/controller/questions_controller.dart';
import 'package:module_flutter/pages/investment/questions_investiment/presenter/component/inital_investiment_component.dart';
import 'package:module_flutter/pages/investment/questions_investiment/presenter/state/question_state.dart';
import 'package:module_flutter/utils/components/app_bar_component.dart';
import 'package:module_flutter/utils/components/loading_component.dart';
import 'package:module_flutter/utils/constants/constants.dart';
class QuestionsInvestimentPageOne extends StatefulWidget {
  const QuestionsInvestimentPageOne({Key? key}) : super(key: key);

  @override
  _QuestionsInvestimentPageOneState createState() => _QuestionsInvestimentPageOneState();
}

class _QuestionsInvestimentPageOneState extends State<QuestionsInvestimentPageOne> {

  ThemeController themeController = Modular.get<ThemeController>();
  QuestionsController questionsController = Modular.get<QuestionsController>();

  @override
  void initState() {
    super.initState();
    questionsController.get_next_question(context);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBarComponent().getAppBar(context, 'Investimentos'),
      body: Observer(
        builder: (context){
          var state = questionsController.state;
          if(state is InitialQuestionState){
            questionsController.nextPage(questionsController.indexPage);
            return InitialInvestimentComponent().getInitialInvestimentComponente(questionsController.questionDataEntite!,context);
          }else if(state is NextQuestionState){
            return Observer(
              builder: (context){
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: 6,
                            width: MediaQuery.of(context).size.width,
                            child:  FAProgressBar(
                              progressColor: HexColor.fromHex(themeController.themeEntite!.defaultButtonColor!),
                              currentValue: double.parse(questionsController.questionDataEntite!.question!.questionPercentual.toString()) * 100,
                              backgroundColor: HexColor.fromHex(themeController.themeEntite!.calendarGreyPast!),
                              borderRadius: BorderRadius.circular(0),
                              border: Border.all(
                                color: Colors.transparent,
                                width: 0,
                              ),
                              displayTextStyle: const TextStyle(
                                  color: Colors.transparent
                              ),
                              displayText: '',
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                        child: Center(
                            child: Text(
                              questionsController.questionDataEntite!.question!.title!.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Roboto-Regular',
                                  fontWeight: FontWeight.w500
                              ),
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20),
                        child: ListView.builder(
                            itemCount: questionsController.listAnswerEntites!.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return  Observer(
                                builder: (context){
                                  return InkWell(
                                    child: Padding(padding: const EdgeInsets.only(top: 20),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                                              child:   Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(questionsController.listAnswerEntites![index].content.toString(),
                                                              softWrap: true,
                                                              style:   TextStyle(fontFamily: 'Roboto-Regular',
                                                                  color: HexColor.fromHex(themeController.themeEntite!.defaultColorText!),
                                                                  fontSize: 16, fontWeight: FontWeight.w300),),
                                                          ],
                                                        ),
                                                        flex: 1,
                                                      ),
                                                  Column(),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Stack(
                                                        alignment: Alignment.center,
                                                        children: [
                                                          Container(
                                                            height: 20,
                                                            width: 20,
                                                            decoration: BoxDecoration(
                                                              border: Border.all(
                                                                color: questionsController.listAnswerEntites![index].selected! ? HexColor.fromHex(themeController.themeEntite!.defaultButtonColor!): Colors.grey,
                                                                width: 3,
                                                              ),
                                                              color: Colors.white,
                                                              borderRadius:
                                                              const BorderRadius.all(Radius.circular(60)),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 18,
                                                            width: 18,
                                                            decoration: BoxDecoration(
                                                              border: Border.all(
                                                                color: questionsController.listAnswerEntites![index].selected! ? Colors.white : Colors.transparent,
                                                                width: 2,
                                                              ),
                                                              color: questionsController.listAnswerEntites![index].selected! ? HexColor.fromHex(themeController.themeEntite!.defaultButtonColor!) :HexColor.fromHex(themeController.themeEntite!.lightGrey!),
                                                              borderRadius:
                                                              const BorderRadius.all(Radius.circular(60)),
                                                            ),
                                                          ),

                                                        ],
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(padding: const EdgeInsets.only(top: 30,left: 20, right: 20,),
                                              child: Container(height: 2,color: HexColor.fromHex('#EAEAEA'),width: MediaQuery.of(context).size.width, ),
                                            )
                                          ],
                                        )
                                    ),
                                    onTap: (){
                                      questionsController.setSelectionQuestion(index);
                                      questionsController.selectedAnswers(index, questionsController.listAnswerEntites!);
                                    },
                                  );
                                },
                              );
                            }),
                      ),


                    ],
                  ),
                );
              }
            );
          }else if ( state is LoadingQuestionsState){
            return getLoading();
          }
          else if ( state is ProfileBoldInvertimentState){
           return questionsController.verifyProfile('bold',context);
          }
          else if ( state is ProfileConservativeInvertimentState){
            return questionsController.verifyProfile('conservative',context);
          }
          else if ( state is ProfileModerateInvertimentState){
            return questionsController.verifyProfile('moderate',context);
          }
          else{
            return getLoading();
          }
        },
      ),
      bottomNavigationBar:  Observer(
        builder: (context){
          return  Visibility(
            visible: questionsController.state is NextQuestionState ? true : false,
            child:  Padding(
              padding:
              EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: kColorAqua,
                  borderRadius:
                  const BorderRadius.all(Radius.circular(60)),
                ),
                height: 60,
                child: InkWell(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Padding(
                        padding: EdgeInsets.zero,
                        child:  Text(
                          questionsController.get_string_button().toString().toUpperCase(),
                          style: const TextStyle(
                            //  fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: (){
                    if(questionsController.verifyQuestions(questionsController.listAnswerEntites!)){
                      questionsController.nextPage(questionsController.indexPage);
                      questionsController.set_question(context,questionsController.questionDataEntite!.question, questionsController.selectedQuestion);
                    }else{
                      questionsController.alertQuestion(context);
                    }
                  },
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
