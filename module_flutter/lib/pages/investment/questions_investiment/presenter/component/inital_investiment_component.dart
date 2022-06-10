import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:module_flutter/pages/initial_page/presenter/controller/theme_controller.dart';
import 'package:module_flutter/pages/investment/questions_investiment/domain/entities/question_data_entite.dart';
import 'package:module_flutter/pages/investment/questions_investiment/presenter/controller/questions_controller.dart';
import 'package:module_flutter/utils/components/color_component.dart';
import 'package:module_flutter/utils/constants/constants.dart';

class InitialInvestimentComponent{
ThemeController themeController = Modular.get<ThemeController>();
QuestionsController questionsController = Modular.get<QuestionsController>();

  Widget getInitialInvestimentComponente(QuestionDataEntite entite, BuildContext context){
    return  Observer(builder: (context){
      return Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 40),
            child: Center(
              child: SvgPicture.asset(
                "assets/images/investment-illustration.svg",
                height: 250,
                width: 250,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Center(
              child: Text(
                entite.question!.title.toString(),
                style: TextStyle(
                    color: getColor(themeController.themeEntite!.defaultColorText),
                    fontFamily: 'Roboto-Regular',
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Container(
              child: Center(
                child: Text(
                  entite.question!.answers![0].content.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: getColor(themeController.themeEntite!.defaultColorText),
                      fontFamily: 'Roboto-Regular',
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Container(
              child: Center(
                child: Text(
                  entite.question!.answers![1].content.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: getColor(themeController.themeEntite!.defaultColorText),
                      fontFamily: 'Roboto-Regular',
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ),
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
    });
  }
}