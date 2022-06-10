import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:module_flutter/pages/initial_page/presenter/controller/theme_controller.dart';
import 'package:module_flutter/pages/investment/home_investiment/presenter/controller/home_investiment_controller.dart';
import 'package:module_flutter/pages/investment/investment_selection/presenter/component/investiment_selection_component.dart';
import 'package:module_flutter/utils/constants/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectionBodyComponent{
  ThemeController themeController = Modular.get<ThemeController>();
HomeInvestimentController homeInvestimentController = Modular.get<HomeInvestimentController>();
  Widget getBodySelectionInvestmentAligned(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: Adaptive.h(35),
                width: Adaptive.w(100),
                decoration: BoxDecoration(
                    color: HexColor.fromHex(
                        themeController.themeEntite!.colorPrimaryDark!),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Padding(
                  padding:
                  const EdgeInsets.only( left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectionComponent().getTitle('Seleção Baixo Risco', 24, Colors.white, 0),
                      SelectionComponent().getProfileContainer(0),
                      InkWell(
                        child: const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              'Feita para quem quer começar a construir o seu patrimônio com cautela e segurança. A Seleção Baixo Risco é um fundo ...Ver mais',
                              style: TextStyle(
                                  fontFamily: 'Roboto-Regular',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            )),
                        onTap: () {
                          SelectionComponent().getModal(context,60.0,
                             SelectionComponent().getBodyModalViewMore(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Adaptive.h(32),left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: HexColor.fromHex(
                        themeController.themeEntite!.colorGreyCard!),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 10,
                          child: SvgPicture.asset('assets/icons/success.svg'),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          'Investimento alinhado ao seu perfil',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Roboto-Regular',
                              fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SelectionComponent().getTitle( 'Suas aplicações', 20, Colors.black,20),
          SelectionComponent().getContainer(
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectionComponent().getSelectionRowComponent('Data de aplicação','22/03/2022' ),
                  SelectionComponent().getSelectionRowComponent( 'Valor aplicado','R\$ ''1.171,77' ),
                  SelectionComponent().getSelectionRowComponent( 'Rendimento',  'R\$ ''1.181,77'),
                  SelectionComponent().getSelectionRowComponent( 'IR + IOF ','R\$ ' '5,50'),
                  SelectionComponent().getSelectionRowComponent( 'Valor atual líquido','R\$ ' '1.176,27'),
                ],
              ),
            ),
          ),
          SelectionComponent().getTitle( 'Detalhes do investimento', 20, Colors.black,20),
          SelectionComponent().getContainer(
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectionComponent().getSelectionRowIconComponent('Resgate','D+30', context,  60.0, SelectionComponent().getBodyModalRescue()),
                  SelectionComponent().getSelectionRowIconComponent('Taxa', 'R\$ ''1.171,77',context, 50.0, SelectionComponent().getBodyModalRate()),
                  SelectionComponent().getSelectionRowComponent('Rendimento', 'R\$ ''1.181,77'),
                  SelectionComponent().getSelectionRowComponent('IR + IOF ',  'R\$ ' '5,50'),
                  SelectionComponent().getSelectionRowComponent('Valor atual líquido',  'R\$ ' '1.176,27'),
                ],
              ),
            ),
          ),
          SelectionComponent().getTitle('Outras informações', 20, Colors.black,20),
          SelectionComponent().getContainer(
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectionComponent().getOtherInformation('Regulamento',context,SelectionComponent().getBodyModalPdf(() { }, () { })),
                  SelectionComponent().getOtherInformation('Desempenho do Fundo',context,SelectionComponent().getBodyModalPdf(() { }, () { })),
                  SelectionComponent().getSelectionRowComponentRigth('Gestor', 'Modal S.A. ','CNPJ: 65.783.360/0001-52')
                ],
              ),
            ),

          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  Widget getBodySelectionInvestmentNotAligned(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: Adaptive.h(35),
                width: Adaptive.w(100),
                decoration: BoxDecoration(
                    color: HexColor.fromHex(
                        themeController.themeEntite!.colorPrimaryDark!),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Padding(
                  padding:
                  const EdgeInsets.only( left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectionComponent().getTitle(homeInvestimentController.modalitiesEntite!.name!, 24, Colors.white, 0),
                      SelectionComponent().getProfileContainer(0),
                      InkWell(
                        child: const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                             'Esta é a solução ideal para quem busca encontrar o equilíbrio entre segurança e boa rentabilidade. Você terá uma seleção para ...Ver mais',
                              style: TextStyle(
                                  fontFamily: 'Roboto-Regular',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            )),
                        onTap: () {
                          SelectionComponent().getModal(context,65.0,
                            SelectionComponent().getBodyModalViewMore(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Adaptive.h(32),left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: HexColor.fromHex(
                        themeController.themeEntite!.colorGreyCard!),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 10,
                          child: SvgPicture.asset('assets/icons/error.svg'),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          'Investimento não está alinhado ao seu perfil',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Roboto-Regular',
                              fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SelectionComponent().getTitle( 'Detalhes do investimento', 20, Colors.black,20),
          SelectionComponent().getContainer(
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectionComponent().getSelectionRowIconComponent('Resgate','D+30', context,  60.0, SelectionComponent().getBodyModalRescue()),
                  SelectionComponent().getSelectionRowIconComponent('Taxa', 'R\$ ''1.171,77',context, 50.0, SelectionComponent().getBodyModalRate()),
                  SelectionComponent().getSelectionRowComponent('Rendimento', 'R\$ ''1.181,77'),
                  SelectionComponent().getSelectionRowComponent('IR + IOF ',  'R\$ ' '5,50'),
                  SelectionComponent().getSelectionRowComponent('Valor atual líquido',  'R\$ ' '1.176,27'),
                ],
              ),
            ),
          ),
          SelectionComponent().getTitle('Outras informações', 20, Colors.black,20),
          SelectionComponent().getContainer(
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectionComponent().getOtherInformation('Regulamento',context,SelectionComponent().getBodyModalPdf(() { }, () { })),
                  SelectionComponent().getOtherInformation('Desempenho do Fundo',context,SelectionComponent().getBodyModalPdf(() { }, () { })),
                  SelectionComponent().getSelectionRowComponentRigth('Gestor', 'Modal S.A. ','CNPJ: 65.783.360/0001-52')
                ],
              ),
            ),

          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}