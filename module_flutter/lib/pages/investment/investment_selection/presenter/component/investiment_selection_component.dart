import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:module_flutter/pages/initial_page/presenter/controller/theme_controller.dart';
import 'package:module_flutter/pages/investment/home_investiment/presenter/component/get_selection_component.dart';
import 'package:module_flutter/pages/investment/investment_selection/presenter/controller/investiment_selection_controller.dart';
import 'package:module_flutter/utils/constants/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectionComponent{
  ThemeController themeController = Modular.get<ThemeController>();
  InvestimentSelectionController investimentSelectionController = Modular.get<InvestimentSelectionController>();
  Widget getSelectionRowComponent(String title, String info){
    return  Padding(padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child:  Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            SizedBox(
              width: Adaptive.w(40),
              child:  Text(
                title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontFamily: 'Roboto-Regular',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
         Container(
           alignment: Alignment.centerRight,
           width: Adaptive.w(30),
           child:  Text(
             info,
             textAlign: TextAlign.left,
             style: const TextStyle(
                 fontFamily: 'Roboto-Regular',
                 fontWeight: FontWeight.bold),
           ),
         )
        ],
      ),
    );
  }

  Widget getSelectionRowIconComponent(String title, String info,BuildContext context,double height ,Widget onTap){
    return   InkWell(
      child: Padding(padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child:  Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child:  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontFamily: 'Roboto-Regular',
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(padding:EdgeInsets.zero,
                  child: SizedBox(
                    height: 10,
                    child: SvgPicture.asset('assets/icons/interrogation.svg'),
                  ),
                ),
              ],
            ),
            Container(
              child:  Text(
                info,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontFamily: 'Roboto-Regular',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        getModal(context, height, onTap);
      },
    );
  }

  Widget getTitle(String title, double size, Color color, double paddingLeft){
    return  Padding(padding: EdgeInsets.only(top: 30,left: paddingLeft, right: 20),
      child: Text(
       title,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: 'Roboto-Regular',
          fontSize: size,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
  }

  Widget getBody(String title, ){
    return  Padding(padding: EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: 'Roboto-Regular',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
  Widget getBodyCenter(String title ){
    return  Padding(padding: EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Roboto-Regular',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget getContainer(Widget body){
    return   Padding(padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          color: HexColor.fromHex(
              themeController.themeEntite!.colorGreyCard!),
          borderRadius: BorderRadius.circular(10),
        ),
        child: body,
      ),
    );
  }

  Widget getOtherInformation(title, BuildContext context,Widget body){
    return InkWell(
      child: Padding(padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: Adaptive.w(40),
                  child:  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontFamily: 'Roboto-Regular',
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(padding:EdgeInsets.zero,
                  child: SizedBox(
                    height: 10,
                    child: SvgPicture.asset('assets/icons/arrow_next.svg'),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 5),
            child: Divider(
              height: 3,
            ),
            )
          ],
        ),
      ),
      onTap:() {
       getModal(context, 35.0, body);
      },
    );
  }

  Widget getSelectionRowComponentRigth(String title, String info, String info2){
    return  Padding(padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child:  Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child:  Text(
              title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontFamily: 'Roboto-Regular',
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: Adaptive.w(40),
                child: Text(
                  info,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontFamily: 'Roboto-Regular',
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: Adaptive.w(40),
                child: Text(
                  info2,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontFamily: 'Roboto-Regular',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

   getModal(BuildContext context, double height, Widget body){
    return showBarModalBottomSheet(
      expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: Adaptive.h(height),
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              body
            ],
          ),
        )
      ),
    );
  }

  Widget getProfileContainer(double paddingLeft){
    return    Padding(
      padding:  EdgeInsets.only(top: 10, left: paddingLeft),
      child: Container(
          decoration: BoxDecoration(
            color: investimentSelectionController
                .getColor(homeInvestimentController.homeInvestimentEntite!.profile!.name!),
            borderRadius: BorderRadius.circular(20),
          ),
          child:  Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              homeInvestimentController.homeInvestimentEntite!.profile!.name!.toUpperCase(),
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'Roboto-Regular',
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )),
    );
  }

  Widget getButtonPop(){
    return InkWell(
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
            child: Container(
                width: Adaptive.w(90),
                decoration: BoxDecoration(
                  color: HexColor.fromHex('#1EBBA4'),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'ENTENDI',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Roboto-Regular',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )),
          ),
        ],
      ),
      onTap: ()=> Modular.to.pop(),
    );
  }

  Widget getButtonRoute(String route, String title){
    return InkWell(
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
            child: Container(
                width: Adaptive.w(90),
                decoration: BoxDecoration(
                  color: HexColor.fromHex('#1EBBA4'),
                  borderRadius: BorderRadius.circular(30),
                ),
                child:  Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Roboto-Regular',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )),
          ),
        ],
      ),
      onTap: () {
        Modular.to.pushNamed(route);
      }
    );
  }
  Widget getButtonGeneric(String title, Color color, VoidCallback callback, Color colorTitle){
    return InkWell(
      child:  Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
            width: Adaptive.w(90),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(30),
            ),
            child:  Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Roboto-Regular',
                    fontWeight: FontWeight.bold,
                    color: colorTitle),
              ),
            )),
      ),
      onTap: ()=>callback,
    );
  }

  Widget getBodyModalViewMore(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SelectionComponent().getTitle('Seleção Baixo Risco', 20, Colors.black,20),
        SelectionComponent().getProfileContainer(20),
        SelectionComponent().getBody('Feita para quem quer começar a construir o seu patrimônio com cautela e segurança.'),
        SelectionComponent().getBody(' A Seleção Baixo Risco é um fundo de investimentos pensado para proteger o seu patrimônio das diversas situações do mercado e investir sem grandes riscos. Inicie no mercado de investimentos com liquidez e sem preocupações!'),
        SelectionComponent().getButtonRoute('selection_summary_page','ENTENDI'),
      ],
    );
  }
  Widget getBodyModalRescue(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SelectionComponent().getTitle('Resgate do investimento', 20, Colors.black,20),
        SelectionComponent().getBody('O período de cotização é o tempo entre asolicitação de resgate e a conversão dascotas de investimento em capital recuperável.'),
        SelectionComponent().getBody('O período de liquidadação é a efetivatransferência do que foi monetizado paraa conta do investidor.'),
        SelectionComponent().getSelectionRowComponent('Período de cotização', 'D+3'),
        SelectionComponent().getSelectionRowComponent('Período de liquidação', 'D+15'),
        SelectionComponent().getButtonPop(),
      ],
    );
  }
  Widget getBodyModalRate(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SelectionComponent().getTitle('Taxas do investimento', 20, Colors.black,20),
        SelectionComponent().getBody('As taxas são cobradas pela administração de seu investimento, podendo variar conformeo rendimento do fundo.'),
        SelectionComponent().getSelectionRowComponent('Taxa de administração', '0,15%'),
        SelectionComponent().getSelectionRowComponent('Taxa máxima de adm.', '2,5%'),
        SelectionComponent().getSelectionRowComponent('Taxa de performance', '20% excedente de 100% do CDI'),
        SelectionComponent().getButtonPop(),
      ],
    );
  }

  Widget getBodyModalPdf(VoidCallback callback1, VoidCallback callback2){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SelectionComponent().getTitle('Regulamento do fundo', 20, Colors.black,20),
        SelectionComponent().getBody('Acesse as informações regulamentais do fundo. '),
       Row(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [

          SizedBox(
            width: Adaptive.w(45),
            child:  SelectionComponent().getButtonGeneric('CANCELAR', HexColor.fromHex('#EAEAEA'),(){
            }, Colors.black),
          ),
           SizedBox(width: 10,),
           SizedBox(
             width: Adaptive.w(45),
             child: SelectionComponent().getButtonGeneric('ABRIR PDF',HexColor.fromHex('#1EBBA4'),(){
             },Colors.white),
           )
         ],
       )
      ],
    );
  }
}


