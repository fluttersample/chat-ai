part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}


class CheckHistory extends ChatEvent {

}
class ChatWithAi extends ChatEvent {

}
class SendMessage extends ChatEvent {

}

class CancelResponse extends ChatEvent{

}
class SelectedItem extends ChatEvent{
      final MessagesModel selectCurrentMessage;
      final bool unSelectItem;
      SelectedItem({ required this.selectCurrentMessage  ,
        this.unSelectItem = false});

}