// ignore_for_file: constant_identifier_names
import 'failures.dart';

// --------------------- codes ---------------------


const int BASE_NETWORK_FAILURE_CODE = 400000;
const int NO_INTERNET_CONNECTION_FAILURE_CODE = 400001;
const int CONNECTION_REQUEST_TIMEOUT_FAILURE_CODE = 400002;
const int SERVER_FAILURE_CODE = 400003;

// --------------------- classes ---------------------

class BaseNetworkFailure extends Failure {
  BaseNetworkFailure({
    String? message,
    Exception? actualException,
  }) : super(
          code: BASE_NETWORK_FAILURE_CODE,
          msg: message ?? 'Connection error',
          actualException: actualException,
        );
}

class ServerFailure extends Failure {
  ServerFailure([actualException])
      : super(
          code: SERVER_FAILURE_CODE,
          msg: 'Server error',
          actualException: actualException,
        );
}

class NoInternetConnectionFailure extends Failure {
  NoInternetConnectionFailure([actualException])
      : super(
          code: NO_INTERNET_CONNECTION_FAILURE_CODE,
          msg: 'No internet connection error',
          actualException: actualException,
        );
}

class RequestTimeoutFailure extends Failure {
  RequestTimeoutFailure([actualException])
      : super(
          code: CONNECTION_REQUEST_TIMEOUT_FAILURE_CODE,
          msg: 'Timeout failure',
          actualException: actualException,
        );
}
