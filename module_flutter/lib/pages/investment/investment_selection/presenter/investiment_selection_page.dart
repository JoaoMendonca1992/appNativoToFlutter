import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:module_flutter/pages/initial_page/presenter/controller/theme_controller.dart';
import 'package:module_flutter/pages/investment/home_investiment/presenter/controller/home_investiment_controller.dart';
import 'package:module_flutter/pages/investment/investment_selection/presenter/component/investiment_selection_body_component.dart';
import 'package:module_flutter/pages/investment/investment_selection/presenter/component/investiment_selection_component.dart';
import 'package:module_flutter/pages/investment/investment_selection/presenter/controller/investiment_selection_controller.dart';
import 'package:module_flutter/utils/components/app_bar_component.dart';
import 'package:module_flutter/utils/constants/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InvestimentSelectionPage extends StatefulWidget {
  @override
  _InvestimentSelectionPageState createState() =>
      _InvestimentSelectionPageState();
}

class _InvestimentSelectionPageState extends State<InvestimentSelectionPage> {
  ThemeController themeController = Modular.get<ThemeController>();
  InvestimentSelectionController investimentSelectionController =
      Modular.get<InvestimentSelectionController>();
  HomeInvestimentController homeInvestimentController =  Modular.get<HomeInvestimentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent().getAppBar(context, homeInvestimentController.modalitiesEntite!.profile!.name!),
      body: ResponsiveSizer(builder: (context, orientation, screenType) {
        return Observer(builder: (context) {
          return investimentSelectionController.investmentAligned ? SelectionBodyComponent().getBodySelectionInvestmentAligned(context)
          : SelectionBodyComponent().getBodySelectionInvestmentNotAligned(context);
        });
      }),
      bottomNavigationBar:
          ResponsiveSizer(builder: (context, orientation, screenType) {
        return Observer(builder: (context) {
          return investimentSelectionController.investmentAligned ? Padding(padding: EdgeInsets.only(bottom: 30),
          child:  Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: Adaptive.w(45),
                child:  SelectionComponent().getButtonGeneric('RESGATAR', HexColor.fromHex('#EAEAEA'),(){
                }, Colors.black),
              ),
              SizedBox(width: 10,),
              SizedBox(
                width: Adaptive.w(45),
                child:  SelectionComponent().getButtonGeneric('INVESTIR MAIS',HexColor.fromHex('#1EBBA4'),(){
                },Colors.white),
              ),
            ],
          ),
          ) :
          Padding(padding: EdgeInsets.only(bottom: 30),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Adaptive.w(90),
                  child:   SelectionComponent().getButtonGeneric('INVESTIR',HexColor.fromHex('#1EBBA4'),(){
                  },Colors.white),
                ),

              ],
            ),
          );
        });
      }),
    );
  }
}
