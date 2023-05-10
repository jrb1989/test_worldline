class Failure implements Type {
  final int? code;
  final String? msg;
  final Object? actualException;
  final String? msgCode;

  const Failure({this.code, this.msg, this.actualException, this.msgCode});

  String get message => msg ?? 'default error';

  @override
  String toString() => "Failure($message)";
}
