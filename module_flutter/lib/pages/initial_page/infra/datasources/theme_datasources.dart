
import 'package:module_flutter/pages/initial_page/infra/models/theme_model.dart';

abstract class IThemeDatasource{
  Future<ThemeModel> get_theme();
}