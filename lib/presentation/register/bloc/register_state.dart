part of 'register_bloc.dart';

@immutable
abstract class RegisterState {

}

final class RegisterInitial extends RegisterState {
}

final class RegisterIsAgreeState extends RegisterState {
  final bool isAgree ;
  RegisterIsAgreeState({required this.isAgree});
}

final class RegisterLoadingBtnCreateAccountState extends RegisterState {
  final bool isLoadingButton ;
  RegisterLoadingBtnCreateAccountState({required this.isLoadingButton});
}