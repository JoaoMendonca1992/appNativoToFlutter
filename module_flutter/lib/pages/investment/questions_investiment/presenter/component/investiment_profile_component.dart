import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:module_flutter/pages/initial_page/presenter/controller/theme_controller.dart';
import 'package:module_flutter/pages/investment/questions_investiment/presenter/controller/questions_controller.dart';
import 'package:module_flutter/utils/components/color_component.dart';
import 'package:module_flutter/utils/constants/constants.dart';
ThemeController themeController = Modular.get<ThemeController>();
QuestionsController questionsController = Modular.get<QuestionsController>();

Widget getTypeProfile(BuildContext context, String image, String typeProfile, String body){
  return SingleChildScrollView(
    physics: AlwaysScrollableScrollPhysics(),
    child: Column(
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
        Padding(padding: EdgeInsets.only(top: 40),
          child: Center(
            child: SvgPicture.asset(
              "assets/images/bold.svg",
              height: 250,
              width: 250,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Seu perfil é ',
                    style: TextStyle(
                        color: getColor(themeController.themeEntite!.defaultColorText),
                        fontFamily: 'Roboto-Regular',
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    'arrojado',
                    style: TextStyle(
                        color: getColor(themeController.themeEntite!.defaultColorText),
                        fontFamily: 'Roboto-Regular',
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Container(
            child: Center(
              child: Text(
                'Produtos recomendados: Aluguéis de Ações (BTC), Tesouro Direto, Títulos de Renda Fixa e Fundos de Investimento, COE.',
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
          EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
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
                      'Ir para investimentos'.toUpperCase(),
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
                Modular.to.pushNamed('home_investiment_page');
              },
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 10),
          child: Center(
            child: TextButton(
              child: Text('REFAZER O TESTE',style: TextStyle(color: getColor(themeController.themeEntite!.defaultColorText)) ,),
              onPressed: (){
                questionsController.retakeTest(context);
              },
            ),
          ),
        ),
      ],
    ),
  );
}