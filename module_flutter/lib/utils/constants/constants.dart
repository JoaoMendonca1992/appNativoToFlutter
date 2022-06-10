import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

// Cores padrão do app
String kStringColorDarkBlue = '#212640';
String kStringColorDarkGrey = '#424242';
String kStringColorAqua = '#1EBBA4';


const kSizeTitle = 17.0;
const kSizeTitle1 = 12.0;
const kSizeTitle2 = 25.0;
const kSizeTitle3 = 14.0;
const kSizeTitle4 = 20.0;

const double kDefaultPadding = 20.0;
@observable
Color kColorDarkBlue = HexColor.fromHex(kStringColorDarkBlue);
@observable
Color kColorDarkGrey = HexColor.fromHex(kStringColorDarkGrey);
@observable
Color kColorAqua = HexColor.fromHex(kStringColorAqua);


extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
