import 'dart:async';
import 'dart:convert';
import 'package:ai_test/ai_injection_container.dart';
import 'package:ai_test/core/Dto/Enums/ApiStatus.dart';
import 'package:ai_test/core/Dto/Models/Chat/ChatRequestModel.dart';
import 'package:ai_test/core/Helper/BaseBrain.dart';
import 'package:ai_test/core/LocalDataBase/AppDatabase.dart';
import 'package:ai_test/core/UseCases/ChatUseCase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'chat_event.dart';

part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatUseCase _chatUseCase;

  ChatBloc({required ChatUseCase chatUseCase})
      : _chatUseCase = chatUseCase,
        super( ChatState(listChat: const [], selectCurrentMessage: MessagesModel())) {

    on<CheckHistory>(_chatHistory);

    on<ChatWithAi>(_chatWithAi);
    on<SendMessage>(_sendMessage);
    on<CancelResponse>(_cancelResponse);
    on<SelectedItem>(_selectItem);

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
    final dataBase = injector<AppDatabase>();
    final localHistory = await dataBase.getAllMessages;
    if(localHistory.isNotEmpty){
      emit(state.copyWith(
          listChat: localHistory.map((e) => e.messages!).toList().reversed.toList(),
          isEmptyList: false
      ));
    }


  }

  Future<void> _sendMessage(SendMessage event, Emitter<ChatState> emit)async {
    if( messageController.text.isEmpty)return;
    var uuid = const Uuid();
    final MessagesModel message = MessagesModel(role: 'user',content: messageController.text,
        id: uuid.v4());
    final List<MessagesModel> messageList = [message , ...state.listChat];
    emit(state.copyWith(listChat: messageList,isEmptyList: false));
    messageController.clear();
   await _callApiWriter(emit, message);
   await _saveToHistory(message);

  }
  Future<void> _saveToHistory(MessagesModel message)async{
    final dataBase = injector<AppDatabase>();
    await dataBase.setDataToListMessage(message);
  }

  Future<void> _callApiWriter(Emitter<ChatState> emit, MessagesModel messageUser )async{
    emit(state.copyWith(status: ApiStatus.loading));
    final listUserMessage = state.listChat.where((element) => element.role == 'user').toList().reversed.toList();

    /// with this variable we change Ai
    int maxToken = 50;
    if( messageUser.content!.contains('ترجمه') || messageUser.content!.contains('translate') ||
        messageUser.content!.contains('format') ){
      maxToken = 100;
    }


    await _chatUseCase.handler(
        params: ChatRequestModel(messages: listUserMessage,
            maxTokens: maxToken)).then((result) async{

      await result.fold((l) {
        return null;
      }, (res) async {
        final responseAi = BaseBrain.convertContentData(res);
        final MessagesModel message = MessagesModel(role: 'system', content: responseAi);
        final List<MessagesModel> messageList = [message , ...state.listChat];
        await _saveToHistory(message);
        emit(state.copyWith(listChat: messageList,isEmptyList: false));
      });

    });
    emit(state.copyWith(status: ApiStatus.success));


  }

  FutureOr<void> _cancelResponse(CancelResponse event, Emitter<ChatState> emit) {
    BaseBrain.cancelTokenResponse();
  }

  FutureOr<void> _selectItem(SelectedItem event, Emitter<ChatState> emit) {
    if(event.unSelectItem){
      emit(state.copyWith(selectCurrentItem: MessagesModel()));

    }else {
      emit(state.copyWith(selectCurrentItem: event.selectCurrentMessage));

    }
  }
}
