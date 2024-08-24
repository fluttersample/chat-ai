part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

class ApiLogin extends LoginEvent {
  const ApiLogin();
  @override
  List<Object?> get props => [];


}
