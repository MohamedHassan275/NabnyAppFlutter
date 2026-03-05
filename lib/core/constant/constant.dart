
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nabny/core/constant/Themes.dart';

const  String URL = 'https://nabny-sa.com/api/v2/';
const String logout = 'are you logout in the application';
const String fontFamily = "cairo";

void CustomFlutterToast(msg){
  Fluttertoast.showToast(
    msg: msg,
    fontSize: 15,
    backgroundColor: Themes.whiteColor,
    gravity: ToastGravity.BOTTOM,
    textColor: Themes.ColorApp1,
    timeInSecForIosWeb: 1,
    toastLength: Toast.LENGTH_SHORT,
  );
}