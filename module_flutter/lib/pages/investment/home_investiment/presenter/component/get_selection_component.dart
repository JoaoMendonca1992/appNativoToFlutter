import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:module_flutter/pages/initial_page/presenter/controller/theme_controller.dart';
import 'package:module_flutter/pages/investment/home_investiment/domain/entities/modalities_entite.dart';
import 'package:module_flutter/pages/investment/home_investiment/presenter/controller/home_investiment_controller.dart';
import 'package:module_flutter/utils/constants/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

HomeInvestimentController homeInvestimentController = Modular.get<HomeInvestimentController>();

Widget getSelectionComponent(BuildContext context, int index){
  double containerSize = 200;
  ThemeController themeController = Modular.get<ThemeController>();
 ModalitiesEntite modalitiesEntite = homeInvestimentController.homeInvestimentEntite!.modalities![index];
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: containerSize,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20),
              child: Row(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 5,
                    height: containerSize,
                    child: FAProgressBar(
                      progressColor: homeInvestimentController.getColor(modalitiesEntite.profile!.name!),
                      currentValue: 100,
                      borderRadius:
                      BorderRadius.circular(10),
                      border: Border.all(
                        color: HexColor.fromHex(themeController.themeEntite!.defaultButtonColor!),
                        width: 0,
                      ),
                      direction: Axis.vertical,
                      verticalDirection: VerticalDirection.down,
                      displayTextStyle: const TextStyle(color: Colors.transparent),
                      displayText: '',
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20),
                          child: Text(
                            modalitiesEntite.name!,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontFamily: 'Roboto-Regular',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20),
                          child: Text(
                            modalitiesEntite.description!,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontFamily: 'Roboto-Regular',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 2,
                            color: HexColor.fromHex(themeController.themeEntite!.calendarGreyPast!),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(padding: const EdgeInsets.only(left: 20, top: 20),
                              child:
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    Column(
                                      children:  [
                                        const Text(
                                          'Rentab. ano',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          modalitiesEntite.profitabilityPerYear!.toString() + ' a.a.',
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(padding: const EdgeInsets.only(left: 5,right: 5),
                                      child: Container(
                                        height: 30,
                                        width: 3,
                                        color: HexColor.fromHex(themeController.themeEntite!.calendarGreyPast!),
                                      ),
                                    ),
                                    Column(
                                      children:  [
                                        const Text(
                                          'Resgate',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          modalitiesEntite.redeem!,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(padding: const EdgeInsets.only(left: 5,right: 5),
                                      child: Container(
                                        height: 30,
                                        width: 3,
                                        color: HexColor.fromHex(themeController.themeEntite!.calendarGreyPast!),
                                      ),
                                    ),
                                    Column( children: [
                                      const Text(
                                        'Taxa',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontFamily: 'Roboto-Regular', fontWeight: FontWeight.w400,),
                                      ),
                                      Text(
                                        modalitiesEntite.fee.toString() + '%',
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          fontFamily: 'Roboto-Regular',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                    ),
                                    Padding(padding: const EdgeInsets.only(left: 5,right: 5),
                                      child: Container(
                                        height: 30,
                                        width: 3,
                                        color: HexColor.fromHex(themeController.themeEntite!.calendarGreyPast!),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          'Valor mínimo',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          'R\$' + modalitiesEntite.minimumInvestment.toString(),
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                flex: 0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    onTap: (){
      homeInvestimentController.setModalities(homeInvestimentController.homeInvestimentEntite!.modalities![index]);
      Modular.to.pushNamed('investiment_selection_page');
    },
  );
}


Widget getSelectionWithCreditsComponent(BuildContext context, int index){
  double containerSize = 250;
  ThemeController themeController = Modular.get<ThemeController>();
  ModalitiesEntite modalitiesEntite = homeInvestimentController.homeInvestimentEntite!.modalities![index];

  return InkWell(
    child: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: containerSize,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20),
              child: Row(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 5,
                    height: containerSize,
                    child: FAProgressBar(
                      progressColor: homeInvestimentController.getColor(modalitiesEntite.profile!.name != null ? modalitiesEntite.profile!.name! : ""),
                      currentValue: 100,
                      borderRadius:
                      BorderRadius.circular(10),

                      direction: Axis.vertical,
                      verticalDirection: VerticalDirection.down,
                      displayTextStyle: const TextStyle(color: Colors.transparent),
                      displayText: '',
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20),
                          child: Text(
                            modalitiesEntite.name!,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontFamily: 'Roboto-Regular',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20),
                          child: Text(
                            modalitiesEntite.description!,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontFamily: 'Roboto-Regular',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(padding: const EdgeInsets.only(left: 20, top: 20),
                              child:
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    SizedBox(
                                      width: Adaptive.w(18),
                                      child:   Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:  [
                                          const Text(
                                            'Rentab. ano',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Roboto-Regular',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            modalitiesEntite.profitabilityPerYear!.toString() + ' a.a.',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              fontFamily: 'Roboto-Regular',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(padding: const EdgeInsets.only(left: 5,right: 5),
                                      child: Container(
                                        height: 30,
                                        width: 3,
                                        color: HexColor.fromHex(themeController.themeEntite!.calendarGreyPast!),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Adaptive.w(15),
                                      child:    Column(
                                        children:  [
                                          const Text(
                                            'Resgate',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Roboto-Regular',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            modalitiesEntite.redeem!,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              fontFamily: 'Roboto-Regular',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(padding: const EdgeInsets.only(left: 5,right: 5),
                                      child: Container(
                                        height: 30,
                                        width: 3,
                                        color: HexColor.fromHex(themeController.themeEntite!.calendarGreyPast!),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Adaptive.w(15),
                                      child: Column( children: [
                                        const Text(
                                          'Taxa',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(fontFamily: 'Roboto-Regular', fontWeight: FontWeight.w400,),
                                        ),
                                        Text(
                                          modalitiesEntite.fee.toString() + '%',
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                      ),
                                    ),
                                    Padding(padding: const EdgeInsets.only(left: 5,right: 5),
                                      child: Container(
                                        height: 30,
                                        width: 3,
                                        color: HexColor.fromHex(themeController.themeEntite!.calendarGreyPast!),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Adaptive.w(18),
                                      child:   Column(
                                        children: [
                                          const Text(
                                            'Valor mínimo',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Roboto-Regular',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            'R\$' + modalitiesEntite.minimumInvestment.toString(),
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              fontFamily: 'Roboto-Regular',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                flex: 0,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 2,
                            color: HexColor.fromHex(themeController.themeEntite!.calendarGreyPast!),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20),
                          child: Text(
                            'Total aplicado: R\$ ' + modalitiesEntite.amount.toString(),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontFamily: 'Roboto-Regular',
                              fontSize: 16,
                            ),
                          ),
                        ),

                      ],
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    onTap: (){
      homeInvestimentController.setModalities(homeInvestimentController.homeInvestimentEntite!.modalities![index]);
      Modular.to.pushNamed('investiment_selection_page');
    },
  );
}