// ignore_for_file: constant_identifier_names


// --------------------- codes ---------------------

import 'failures.dart';

const int BASE_DATABASE_FAILURE_CODE = 200000;

// --------------------- classes ---------------------

class BaseDatabaseFailure extends Failure {
  BaseDatabaseFailure({
    String? message,
    Exception? actualException,
  }) : super(
          code: BASE_DATABASE_FAILURE_CODE,
          msg: message ?? 'Default error database',
          actualException: actualException,
        );
}
