

import 'dart:async';

import 'package:ai_test/core/services/NetWorkServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterIsAgreeEvent>(registerIsAgreeEvent);
    on<RegisterIsLoadingCreateAccountEvent>(registerIsLoadingCreateAccountEvent);

  }

  final cntName  =TextEditingController();
  final cntEmail  =TextEditingController();
  final cntPassword  =TextEditingController();

  FutureOr<void> registerIsAgreeEvent(RegisterIsAgreeEvent event, Emitter<RegisterState> emit) {
    final isAgreeTerms = event.isAgree ;
    emit(RegisterIsAgreeState(isAgree: isAgreeTerms));
  }

  FutureOr<void> registerIsLoadingCreateAccountEvent(RegisterIsLoadingCreateAccountEvent event, Emitter<RegisterState> emit)async {


    emit(RegisterLoadingBtnCreateAccountState(isLoadingButton: true));
    await Future.delayed(Duration(seconds: 2),() {
      emit(RegisterLoadingBtnCreateAccountState(isLoadingButton: false));
    },);
  }
}
