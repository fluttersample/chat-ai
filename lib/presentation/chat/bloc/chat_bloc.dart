import 'dart:async';
import 'dart:convert';

import 'package:ai_test/core/Dto/Enums/ApiStatus.dart';
import 'package:ai_test/core/Dto/Models/Chat/ChatRequestModel.dart';
import 'package:ai_test/core/Dto/Models/Chat/ChatResponseModel.dart';
import 'package:ai_test/core/Helper/BaseBrain.dart';
import 'package:ai_test/core/UseCases/ChatUseCase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_event.dart';

part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatUseCase _chatUseCase;

  ChatBloc({required ChatUseCase chatUseCase})
      : _chatUseCase = chatUseCase,
        super(const ChatState(listChat: [])) {

    on<CheckHistory>(_chatHistory);

    on<ChatWithAi>(_chatWithAi);
    on<SendMessage>(_sendMessage);
    on<CancelResponse>(_cancelResponse);

  }



  final messageController =TextEditingController();
  final scrollController = ScrollController();

  Future<void> _chatWithAi(ChatEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(status: ApiStatus.loading));


    await _chatUseCase.handler(params: ChatRequestModel()).then((result) async{

      await result.fold((l) {
        return null;
      }, (res) async {

        });

      });




  }

  Future<void> _chatHistory(ChatEvent event, Emitter<ChatState> emit) async {



  }

  Future<void> _sendMessage(SendMessage event, Emitter<ChatState> emit)async {
    if( messageController.text.isEmpty)return;
    final MessagesModel message = MessagesModel(role: 'user',content: messageController.text);
    final List<MessagesModel> messageList = [message , ...state.listChat];
    emit(state.copyWith(listChat: messageList,isEmptyList: false));
    messageController.clear();

   await _callApiWriter(emit);

  }

  Future<void> _callApiWriter(Emitter<ChatState> emit )async{
    emit(state.copyWith(status: ApiStatus.loading));
    final listUserMessage = state.listChat.where((element) => element.role == 'user').toList().reversed.toList();
    await _chatUseCase.handler(
        params: ChatRequestModel(messages: listUserMessage)).then((result) async{

      await result.fold((l) {
        return null;
      }, (res) async {
        final responseAi = BaseBrain.convertContentData(res);
        final MessagesModel message = MessagesModel(role: 'system', content: responseAi);
        final List<MessagesModel> messageList = [message , ...state.listChat];

        emit(state.copyWith(listChat: messageList,isEmptyList: false));
      });

    });
    emit(state.copyWith(status: ApiStatus.success));


  }

  Future<void> _cancelResponse(CancelResponse event, Emitter<ChatState> emit) async{
    BaseBrain.cancelTokenResponse();
  }
}
