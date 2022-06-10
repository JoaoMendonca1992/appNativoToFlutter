import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:module_flutter/pages/initial_page/presenter/controller/theme_controller.dart';
import 'package:module_flutter/pages/investment/questions_investiment/domain/entities/question_data_entite.dart';
import 'package:module_flutter/pages/investment/questions_investiment/presenter/controller/questions_controller.dart';
import 'package:module_flutter/utils/constants/constants.dart';

class QuestionsComponent {
  ThemeController themeController = Modular.get<ThemeController>();
  QuestionsController questionsController = Modular.get<QuestionsController>();

  Widget get_questions_component(BuildContext context){
    QuestionDataEntite dataEntite = questionsController.questionDataEntite!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 14,
              width: MediaQuery.of(context).size.width,
              child:  FAProgressBar(
                progressColor: HexColor.fromHex(themeController.themeEntite!.defaultButtonColor!),
                currentValue: questionsController.indexPage + 1 * 20,
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
                dataEntite.question!.title!.toString(),
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
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return  Observer(
                  builder: (context){
                    return InkWell(
                      child: Padding(padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(questionsController.listAnswerEntites![index].content.toString(),style:  const TextStyle(fontFamily: 'Roboto-Regular',fontSize: 16, fontWeight: FontWeight.w400),),
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 2,
                                      ),
                                      color: questionsController.listAnswerEntites![index].selected! ? HexColor.fromHex(themeController.themeEntite!.defaultButtonColor!) :HexColor.fromHex('#EAEAEA'),
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(60)),
                                    ),
                                  )
                                ],
                              ),
                              Padding(padding: const EdgeInsets.only(top: 5),
                                child: Container(height: 2,color: HexColor.fromHex('#EAEAEA'),width: MediaQuery.of(context).size.width, ),
                              )
                            ],
                          )
                      ),
                      onTap: (){
                        questionsController.selectedAnswers(index, questionsController.listAnswerEntites!);
                      },
                    );
                  },
                );
              }),
        ),
        Padding(
          padding:
          EdgeInsets.only(top: MediaQuery.of(context).size.height/10,left: 20, right: 20),
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
                children: const [
                  Padding(
                    padding: EdgeInsets.zero,
                    child:  Text(
                      'COMEÇAR',
                      style: TextStyle(
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
                questionsController.get_next_question(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}