part of 'login_bloc.dart';





final class LoginState extends Equatable {

  final ApiStatus status;
  final bool isLoading;
  const LoginState({this.status = ApiStatus.initial, this.isLoading = false});

  LoginState copyWith({
    ApiStatus? status,
    bool? isLoading,
  }){
    return LoginState(
        status: status ?? this.status,
      isLoading: isLoading ?? this.isLoading,
    );
  }
  @override
  List<Object> get props => [status,isLoading];
}


