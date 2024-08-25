import 'package:ai_test/ai_injection_container.dart';
import 'package:ai_test/core/Dto/Enums/ApiStatus.dart';
import 'package:ai_test/core/Helper/BaseBrain.dart';
import 'package:ai_test/core/Dto/Models/Login/LoginRequestModel.dart';
import 'package:ai_test/core/Dto/Models/Login/LoginResponseModel.dart';
import 'package:ai_test/core/LocalDataBase/AppDatabase.dart';
import 'package:ai_test/core/UseCases/LoginUseCase.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc({required LoginUseCase loginUseCase})
      : _loginUseCase = loginUseCase,
        super(const LoginState()) {
    on<ApiLogin>(_callApiLogin);
  }


  final emailTextField = TextEditingController(text: 'test@test.com');
  final passwordTextField = TextEditingController(text: 'test12345');

  /// Api
  Future<void> _callApiLogin(ApiLogin event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: ApiStatus.loading));


    await _loginUseCase.handler(params: LoginRequestModel(
      email: emailTextField.text,
      password: passwordTextField.text
    )).then((result) async{

    await result.fold((l) {
        return null;
      }, (res) async {
        await _saveUserData(res).then((value) {
          emit(state.copyWith(status: ApiStatus.success));
        });

      });

    });



  }

  Future<void> _saveUserData(LoginResponseModel data)async{
    final dataBase = injector<AppDatabase>();
    await dataBase.deleteUserDb();
    await dataBase.into(dataBase.userDb).insert(UserDbCompanion.insert(
        id: const Value(1),
        refreshToken: data.refreshToken??'',
        user: Value(data.workspace?.user)));
      BaseBrain.setUserData(data);
      // BaseBrain.reloadDio();

    // final result = await database.select(database.userDb).get();
    // print("XX ${result.first}");
  }
}
