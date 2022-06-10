
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_svg/svg.dart';

class CustomAlertComponent {
  BuildContext context;
  String textBody;
  String positiveButton;
  String route;
  String title;


  CustomAlertComponent({required this.context,required this.title, required this.textBody, required this.positiveButton, required this.route});

  show() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) =>  CustomAlert(textBody: textBody,positiveButton: positiveButton, route: route,title: title)
    );
  }
  hide() {
    Navigator.of(context).pop();
  }
}

class CustomAlert extends StatelessWidget {
  String textBody;
  String positiveButton;
  String route;
  String title;

  CustomAlert({required this.textBody, required this.positiveButton, required this.route, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 5, right: 5, top: MediaQuery.of(context).size.height / 3.0, bottom: MediaQuery.of(context).size.height / 3.0,),
      child: Card(
        color: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 30),
              child: Text(title ,textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                child: Text(textBody, textAlign: TextAlign.center, style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5, top: 15),
                  child: TextButton(
                    style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent),),
                    child: Ink(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(left: 35, right: 35, top: 20, bottom: 20),
                          child: Text(positiveButton.toUpperCase(), textAlign: TextAlign.center, style: TextStyle(color: Colors.black),),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if(route.isEmpty){
                        CustomAlertComponent(context: context, title: title, textBody: textBody, positiveButton: positiveButton, route: route).hide();
                      }
                     Modular.dispose();
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

}