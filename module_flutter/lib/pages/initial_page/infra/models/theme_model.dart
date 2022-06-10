import 'package:module_flutter/pages/initial_page/domain/entities/theme_entite.dart';

class ThemeModel extends ThemeEntite{

  ThemeModel({
     String? appUrl,
     String? colorPrimary,
     String? colorPrimaryDark,
     String? defaultButtonColor,
     String? logo,
     String? logoWhite,
     String? defaultColorText,
     String? disabledButtonColor,
     String? negativeButtonColor,
     String? neutralButtonColor,
     String? lightGrey,
     String? lightGrey2,
     String? colorWhatsApp,
     String? colorEmail,
     String? colorOther,
     String? colorBack,
     String? colorTextRegister,
     String? colorLineRegister,
     String? colorTextInvalid,
     String? colorTextHint,
     String? colorGrey,
     String? subtitle,
     String? disabledTitle,
     String? darkGray,
     String? colorGreyCard,
     String? colorBackgroundPayment,
     String? colorLine,
     String? colorRed,
     String? white,
     String? bgHomePix,
     String? viewFinderMask,
     String? calendarBlack,
     String? calendarGrey,
     String? calendarGreen,
     String? calendarGreyPast,
     String? extractValueColor,
     String? vivoColor,
     String? timColor,
     String? oiColor,
     String? claroColor,
     String? headerPix,
     String? devolutionPix,
     String? dateColor,
     String? receivementItemFilter,
     String? receivementItemFilterSelected,
     String? scheduleBlue,
     String? scheduleGreen,
     String? scheduleOrange,
     String? scheduleRed,
}): super(
      appUrl : appUrl,
      colorPrimary:colorPrimary,
      colorPrimaryDark:colorPrimaryDark,
      defaultButtonColor:defaultButtonColor,
      logo  :logo,
      logoWhite :logoWhite,
      defaultColorText :defaultColorText,
      disabledButtonColor :disabledButtonColor,
      negativeButtonColor  :negativeButtonColor,
      neutralButtonColor :neutralButtonColor,
      lightGrey :lightGrey,
      lightGrey2 :lightGrey2,
      colorWhatsApp :colorWhatsApp,
      colorEmail:colorEmail,
      colorOther :colorOther,
      colorBack :colorBack,
      colorTextRegister:colorTextRegister,
      colorLineRegister:colorLineRegister,
      colorTextInvalid:colorTextInvalid,
      colorTextHint :colorTextHint,
      colorGrey  :colorGrey,
      subtitle :subtitle,
      disabledTitle :disabledTitle,
      darkGray :darkGray,
      colorGreyCard:colorGreyCard,
      colorBackgroundPayment :colorBackgroundPayment,
      colorLine :colorLine,
      colorRed:colorRed,
      white :white,
      bgHomePix :bgHomePix,
      viewFinderMask :viewFinderMask,
      calendarBlack:calendarBlack,
      calendarGrey :calendarGrey,
      calendarGreen :calendarGreen,
      calendarGreyPast:calendarGreyPast,
      extractValueColor :extractValueColor,
      vivoColor :vivoColor,
      timColor  :timColor,
      oiColor :oiColor,
      claroColor :claroColor,
      headerPix :headerPix,
      devolutionPix :devolutionPix,
      dateColor :dateColor,
      receivementItemFilter :receivementItemFilter,
      receivementItemFilterSelected :receivementItemFilterSelected,
      scheduleBlue:scheduleBlue,
      scheduleGreen:scheduleGreen,
      scheduleOrange :scheduleOrange,
      scheduleRed :scheduleRed
  );

  
  factory ThemeModel.fromJson(Map<String, dynamic> json) => ThemeModel(
      appUrl : json['app_url'],
      colorPrimary: json['color_primary'],
      colorPrimaryDark: json['color_primary_dark'],
      defaultButtonColor: json['default_button_color'],
      logo  : json['logo'],
      logoWhite : json['logo_white'],
      defaultColorText : json['defaultColorText'],
      disabledButtonColor : json['disabledButtonColor'],
      negativeButtonColor  : json['negativeButtonColor'],
      neutralButtonColor : json['neutralButtonColor'],
      lightGrey : json['lightGrey'],
      lightGrey2 : json['lightGrey2'],
      colorWhatsApp : json['colorWhatsApp'],
      colorEmail: json['colorEmail'],
      colorOther : json['colorOther'],
      colorBack :json['colorBack'],
      colorTextRegister:json['colorTextRegister'],
      colorLineRegister:json['colorLineRegister'],
      colorTextInvalid:json['colorTextInvalid'],
      colorTextHint :json['colorTextHint'],
      colorGrey  :json['colorGrey'],
      subtitle :json['subtitle'],
      disabledTitle :json['disabledTitle'],
      darkGray :json['darkGray'],
      colorGreyCard:json['colorGreyCard'],
      colorBackgroundPayment :json['colorBackgroundPayment'],
      colorLine :json['colorLine'],
      colorRed:json['colorRed'],
      white :json['white'],
      bgHomePix :json['bg_home_pix'],
      viewFinderMask :json['viewFinderMask'],
      calendarBlack:json['calendar_black'],
      calendarGrey :json['calendar_grey'],
      calendarGreen :json['calendar_green'],
      calendarGreyPast:json['calendar_grey_past'],
      extractValueColor :json['extract_value_color'],
      vivoColor :json['vivo_color'],
      timColor  :json['tim_color'],
      oiColor :json['oi_color'],
      claroColor :json['claro_color'],
      headerPix :json['header_pix'],
      devolutionPix :json['devolution_pix'],
      dateColor :json['dateColor'],
      receivementItemFilter :json['receivement_item_filter'],
      receivementItemFilterSelected :json['receivement_item_filter_selected'],
      scheduleBlue:json['scheduleBlue'],
      scheduleGreen:json['scheduleGreen'],
      scheduleOrange :json['scheduleOrange'],
      scheduleRed :json['scheduleRed']
    );
 
  Map<String, dynamic> toJson(){
   final Map<String, dynamic> data = new Map<String, dynamic>();
   data['appUrl'] = this.appUrl;
    data['colorPrimary'] = this.colorPrimary;
    data['colorPrimaryDark'] = this.colorPrimaryDark;
    data['defaultButtonColor'] = this.defaultButtonColor;
    data['logo'] = this.logo;
    data['logoWhite'] = this.logoWhite;
    data['defaultColorText'] = this.defaultColorText;
    data['disabledButtonColor'] = this.disabledButtonColor;
    data['negativeButtonColor'] = this.negativeButtonColor;
    data['neutralButtonColor'] = this.neutralButtonColor;
    data['lightGrey'] = this.lightGrey;
    data['lightGrey2'] = this.lightGrey2;
    data['colorWhatsApp'] = this.colorWhatsApp;
    data['colorEmail'] = this.colorEmail;
    data['colorOther'] = this.colorOther;
    data['colorBack'] = this.colorBack;
    data['colorTextRegister'] = this.colorTextRegister;
    data['colorLineRegister'] = this.colorLineRegister;
    data['colorTextInvalid'] = this.colorTextInvalid;
    data['colorTextHint'] = this.colorTextHint;
    data['colorGrey'] = this.colorGrey;
    data['subtitle'] = this.subtitle;
    data['disabledTitle'] = this.disabledTitle;
    data['darkGray'] = this.darkGray;
    data['colorGreyCard'] = this.colorGreyCard;
    data['colorBackgroundPayment'] = this.colorBackgroundPayment;
    data['colorLine'] = this.colorLine;
    data['colorRed'] = this.colorRed;
    data['white'] = this.white;
    data['bgHomePix'] = this.bgHomePix;
    data['viewFinderMask'] = this.viewFinderMask;
    data['calendarBlack'] = this.calendarBlack;
    data['calendarGrey'] = this.calendarGrey;
    data['calendarGreen'] = this.calendarGreen;
    data['calendarGreyPast'] = this.calendarGreyPast;
    data['extractValueColor'] = this.extractValueColor;
    data['vivoColor'] = this.vivoColor;
    data['timColor'] = this.timColor;
    data['oiColor'] = this.oiColor;
    data['claroColor'] = this.claroColor;
    data['headerPix'] = this.headerPix;
    data['devolutionPix'] = this.devolutionPix;
    data['dateColor'] = this.dateColor;
    data['receivementItemFilter'] = this.receivementItemFilter;
    data['receivementItemFilterSelected'] = this.receivementItemFilterSelected;
    data['scheduleBlue'] = this.scheduleBlue;
    data['scheduleGreen'] = this.scheduleGreen;
    data['scheduleOrange'] = this.scheduleOrange;
    data['scheduleRed'] = this.scheduleRed;
  return data;
  }
}