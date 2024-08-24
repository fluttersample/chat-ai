part of 'chat_bloc.dart';



final class ChatState extends Equatable{

  final ApiStatus status;
  final bool isEmptyList ;
  final List<MessagesModel> listChat ;
  const ChatState({this.status = ApiStatus.initial, this.isEmptyList = true ,
    required this.listChat });

  ChatState copyWith({
    ApiStatus? status,
    bool? isEmptyList,
    List<MessagesModel>? listChat,
  }){
    return ChatState(
      status: status ?? this.status,
      isEmptyList: isEmptyList ?? this.isEmptyList,
      listChat: listChat ?? this.listChat,
    );
  }
  @override
  List<Object> get props => [status,isEmptyList,listChat];
}




