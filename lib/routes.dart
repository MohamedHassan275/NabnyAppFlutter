import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nabny/core/constant/routes.dart';
import 'package:nabny/screens/login_screen/login_screen.dart';

Map<String, Widget Function(BuildContext)> myRoutes = {
  RouteApp.Login : (context) => const LoginScreen(),
  RouteApp.Login : (context) => const LoginScreen()
};
