import 'package:deal_mart/models/login_model.dart';
import 'package:deal_mart/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/network/end_points.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
   LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context)=> BlocProvider.of(context);

 late LoginModel loginModel;
void userLogin({required String email,required String password}){
  emit(LoginLoadingState());
  DioHelper.postData(
    url: LOGIN,
    data: {
      'email':email,
      'password':password,
    },
  ).then((value) { print(value.data);
    loginModel = LoginModel.fromJson(value.data);
    print(loginModel.status);
    print(loginModel.message);
    print(loginModel.data!.token);
    emit(LoginSuccessState(loginModel));
  }

  ).catchError((error){
    print(error.toString());
    emit(LoginErrorState(error.toString()));
  });

} 

IconData suffix=Icons.visibility_outlined;
bool isPassword=true;
void changePasswordVisibility(){
  isPassword = !isPassword;
  suffix=isPassword ? Icons.visibility_outlined:Icons.visibility_off_outlined;
  emit(ChangePasswordVisibilityState());
}

}
