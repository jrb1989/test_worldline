// ignore_for_file: constant_identifier_names


// --------------------- codes ---------------------

import 'failures.dart';

const int BASE_GENERAL_FAILURE_CODE = 300000;
const int ENVIRONMENT_FAILURE_CODE = 300001;

// --------------------- classes ---------------------

class BaseGeneralFailure extends Failure {
  BaseGeneralFailure({
    String? message,
    Object? actualException,
  }) : super(
          code: BASE_GENERAL_FAILURE_CODE,
          msg: message ?? 'default error',
          actualException: actualException,
        );
}

class EnvironmentFailure extends Failure {
  EnvironmentFailure(String message)
      : super(code: ENVIRONMENT_FAILURE_CODE, msg: message);
}
