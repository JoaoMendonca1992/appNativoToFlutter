import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:module_flutter/pages/initial_page/presenter/controller/theme_controller.dart';
import 'package:module_flutter/pages/investment/home_investiment/domain/entities/profile_entite.dart';
import 'package:module_flutter/pages/investment/home_investiment/presenter/component/get_selection_component.dart';
import 'package:module_flutter/pages/investment/home_investiment/presenter/controller/home_investiment_controller.dart';
import 'package:module_flutter/utils/constants/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget getHeaderComponent(BuildContext context){
  ThemeController themeController = Modular.get<ThemeController>();
  HomeInvestimentController homeInvestimentController = Modular.get<HomeInvestimentController>();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Stack(
        children: [
          Container(
            height: Adaptive.h(25),
            width: Adaptive.w(100),
            decoration: BoxDecoration(
                color: HexColor.fromHex(
                    themeController.themeEntite!.colorPrimaryDark!),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total investido:',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto-Regular',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        'R\$',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily:
                                          'Roboto-Regular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: !homeInvestimentController.isShowBalance,
                                      child: Container(
                                        color: Colors.white,
                                        width: MediaQuery.of(context)
                                            .size
                                            .height /
                                            4,
                                        height: 40,
                                      ),
                                    ),
                                    Visibility(
                                        visible: homeInvestimentController.isShowBalance,
                                        child: Container(
                                          height: 40,
                                          child:  Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5),
                                            child: Text(
                                              homeInvestimentController.homeInvestimentEntite!.investor!.amount!.toString(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily:
                                                'Roboto-Regular',
                                                fontWeight:
                                                FontWeight.w400,
                                                fontSize: 34,
                                              ),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Visibility(
                                      visible: homeInvestimentController.isShowBalance,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints:
                                        const BoxConstraints(),
                                        icon: SizedBox(
                                          height: 20,
                                          child: SvgPicture.asset(
                                            "assets/icons/closed_eye.svg",
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          homeInvestimentController.setBalance(false);
                                        },
                                      ),
                                    ),
                                    Visibility(
                                      visible:
                                      !homeInvestimentController.isShowBalance,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints:
                                        const BoxConstraints(),
                                        icon: SizedBox(
                                          height: 20,
                                          child: SvgPicture.asset(
                                            "assets/icons/open_eye.svg",
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          homeInvestimentController.setBalance(true);
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          getHeaderProfileComponent(),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 20,left: 30),
            child: Text(
              'Fundos de Investimento:',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Roboto-Regular',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget getHeaderProfileComponent(){
  ProfileEntite profileEntite = homeInvestimentController.homeInvestimentEntite!.profile!;
  return  Padding(
    padding: EdgeInsets.only(
        top: Adaptive.h(18), left: 20, right: 20),
    child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 30),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children:  [
                        const Text(
                          'Seu perfil é:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Roboto-Regular',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          profileEntite.name!.toUpperCase(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: homeInvestimentController.getColor( profileEntite.name!),
                            fontFamily: 'Roboto-Regular',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          profileEntite.description!,
                          softWrap: true,
                          style: const TextStyle(
                            fontFamily: 'Roboto-Regular',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    flex: 1,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        homeInvestimentController.getImageProfile(profileEntite.name!),
                        height: 100,
                        width: 100,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        )),
  );
}