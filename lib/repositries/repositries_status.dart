

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:nabny/model/my_order_model.dart';

class SUCCESS {
  int? code;
  Object? response;

  SUCCESS({this.code,this.response});
}

class Failure {
  int? code;
  Object? errorResponse;

  Failure({this.code,this.errorResponse});
}