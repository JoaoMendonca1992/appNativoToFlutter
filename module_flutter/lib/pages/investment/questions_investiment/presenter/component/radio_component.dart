import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:module_flutter/pages/initial_page/presenter/controller/theme_controller.dart';
import 'package:module_flutter/pages/investment/questions_investiment/domain/entities/answers_entite.dart';
import 'package:module_flutter/pages/investment/questions_investiment/presenter/controller/questions_controller.dart';
import 'package:module_flutter/utils/constants/constants.dart';

ThemeController themeController = Modular.get<ThemeController>();
QuestionsController questionsController = Modular.get<QuestionsController>();

Widget getRadioComponent(int index,List<AnswersEntite> answersEntite, BuildContext context) {
  return Padding(padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(answersEntite[index].content.toString(),style:  TextStyle(fontFamily: 'Roboto-Regular',fontSize: 16, fontWeight: FontWeight.w400),),
              Radio<bool>(
                  activeColor:  HexColor.fromHex(themeController.themeEntite!.defaultButtonColor!),
                  value: !answersEntite[index].selected!,
                  groupValue: answersEntite[index].selected,
                  onChanged: (bool? isChange) {
                    questionsController.selectedAnswers(index, answersEntite);
                  }),
            ],
          ),
          Container(height: 2,color: HexColor.fromHex('#EAEAEA'),width: MediaQuery.of(context).size.width, ),
        ],
      )
  );
}
