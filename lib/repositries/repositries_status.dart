
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