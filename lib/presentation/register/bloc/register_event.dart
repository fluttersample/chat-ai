part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class RegisterIsAgreeEvent extends RegisterEvent{
  final bool isAgree ;
  RegisterIsAgreeEvent({required this.isAgree});
}

class RegisterIsLoadingCreateAccountEvent extends RegisterEvent{
  RegisterIsLoadingCreateAccountEvent();

}
