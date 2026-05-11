import 'package:docdocnasr66/features/auth/data/response_model.dart';

class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthSuccessState extends AuthStates {
  ResponseModel responseModel;
  AuthSuccessState({required this.responseModel});
}

class AuthErrorState extends AuthStates {
  String em;
  AuthErrorState({required this.em});
}