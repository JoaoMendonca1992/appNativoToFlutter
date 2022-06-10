import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:module_flutter/pages/initial_page/presenter/controller/theme_controller.dart';
import 'package:module_flutter/pages/investment/home_investiment/presenter/controller/home_investiment_controller.dart';
import 'package:module_flutter/pages/investment/investment_selection/presenter/component/investiment_selection_component.dart';
import 'package:module_flutter/utils/components/app_bar_component.dart';
import 'package:module_flutter/utils/constants/constants.dart';
class SelectionSummaryPage extends StatefulWidget {
const SelectionSummaryPage({Key? key}) : super(key: key);

  @override
  _SelectionSummaryPageState createState() => _SelectionSummaryPageState();
}

class _SelectionSummaryPageState extends State<SelectionSummaryPage> {
  HomeInvestimentController homeInvestimentController =  Modular.get<HomeInvestimentController>();
  ThemeController themeController = Modular.get<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent().getAppBar(context, homeInvestimentController.modalitiesEntite!.name!),
      body: Observer(builder: (context) {
        return SingleChildScrollView(
          child:
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 60),
                child:  SizedBox(
                  height: 250,
                  child: SvgPicture.asset('assets/images/selection_moderate.svg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20,left: 40,right: 40),
                child: Text(
                  'Investimento incompatível com o seu perfil',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Roboto-Regular',
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SelectionComponent().getBodyCenter('Este investimento faz parte da Seleção Equilibrada, apresentando maiores riscos que os investimentos indicados a seu perfil.'),
              SelectionComponent().getBodyCenter('Para continuar, leia e aceite os termos dedesenquadramento.'),
              SelectionComponent().getButtonRoute('','CONTINUAR INVESTINDO'),
              TextButton(onPressed: (){
                Modular.to.pushNamed('questions_investiment_page_one');
              }, child: Center(child: Text('REFAZER PERFIL',style: TextStyle(color: HexColor.fromHex(themeController.themeEntite!.defaultColorText!)),),))
          ],
          ),
        );
      }
      ),
    );
  }
}
