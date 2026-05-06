import 'package:dio/dio.dart';
import 'package:docdocnasr66/core/const/api_const.dart';
import 'package:docdocnasr66/features/auth/data/request_body.dart';
import 'package:docdocnasr66/features/auth/logic/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/response_model.dart';

class AuthCubit extends Cubit <AuthStates> {
  AuthCubit () : super (AuthInitialState());
  
  Dio dio = Dio() ;
  
  Future <ResponseModel?> login (RequestBody body) async {
    emit(AuthLoadingState());
    try {
     final response = await dio.post(ApiConst.login,data: body.toJson());

      if (response.statusCode == 200) {
        final result = ResponseModel.fromJson(response.data);
        emit(AuthLoadedState());
        return result;
      }

    }catch (e){
      emit(AuthErrorState());
    }

  } 


}