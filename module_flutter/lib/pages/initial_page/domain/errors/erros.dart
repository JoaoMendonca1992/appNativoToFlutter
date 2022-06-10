
import 'package:module_flutter/utils/errors/errors_util.dart';

class EmptyBody extends Failure {}

class InvalidTheme extends Failure{}

class ErrorRequest  extends Failure{
   String msg = "";
  ErrorRequest(msg);
}