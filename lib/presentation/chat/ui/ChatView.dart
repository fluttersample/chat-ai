import 'package:ai_test/core/Dto/Enums/ApiStatus.dart';
import 'package:ai_test/core/Dto/Models/Chat/ChatRequestModel.dart';
import 'package:ai_test/core/services/NetWorkServices.dart';
import 'package:ai_test/presentation/chat/bloc/chat_bloc.dart';
import 'package:ai_test/presentation/developer/DeveloperView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  // List<Map<String, dynamic>> _chatHistory = [];
  late final ChatBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<ChatBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const _AppBarCustom(),
      body: Stack(
        children: [
          _buildListView(),
          _buildBottomSection(),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return BlocConsumer<ChatBloc, ChatState>(
      builder: (context, state) {
        if (state.isEmptyList) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                'assets/images/ic_empty.png',
                height: 200,
                width: 200,
              )),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Start Chat with AI',
                style: GoogleFonts.dmSans().copyWith(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Fill in the App to see the result! Introduction',
                style: GoogleFonts.dmSans()
                    .copyWith(color: const Color(0xff747474)),
              ),
            ],
          );
        }
        return Container(
          height: MediaQuery.of(context).size.height - 160,
          margin: const EdgeInsets.only(bottom: 50),
          child: ListView.builder(
            itemCount: state.listChat.length,
            controller: bloc.scrollController,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            physics: const BouncingScrollPhysics(),
            reverse: true,
            itemBuilder: (context, index) {
              final data = state.listChat[index];
              return InkWell(
                onTap: () {
                  bloc.add(SelectedItem(
                      unSelectItem: true, selectCurrentMessage: data));
                },
                onLongPress: () {
                  bloc.add(SelectedItem(
                    selectCurrentMessage: data,
                  ));
                },
                child: Container(
                  color: state.selectCurrentMessage == data
                      ? const Color(0xff9373EE)
                      : null,
                  padding: EdgeInsets.only(
                      left: data.isUser ? 45 : 14,
                      right: data.isUser ? 14 : 38,
                      top: 10,
                      bottom: 10),
                  child: Align(
                    alignment:
                        (data.isUser ? Alignment.topRight : Alignment.topLeft),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: !data.isUser,
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                'assets/images/img-system.png',
                                height: 25,
                                width: 25,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: (data.isUser
                                ? Alignment.topRight
                                : Alignment.topLeft),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.content ?? '',
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.black)),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'now',
                                    style: GoogleFonts.dmSans().copyWith(
                                        fontSize: 10, color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Visibility(
                          visible: data.isUser,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/images/img-user.png',
                              height: 25,
                              width: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget _buildBottomSection() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              if (state.status.isLoading) {
                return InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    bloc.add(CancelResponse());
                  },
                  child: Container(
                    height: 30,
                    width: 140,
                    decoration: BoxDecoration(
                        color: const Color(0xffF2EEFD),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.stop_rounded,
                          color: Color(0xff9373EE),
                        ),
                        Text(
                          'Stop Responding',
                          style: GoogleFonts.dmSans().copyWith(
                              fontSize: 12, color: const Color(0xff9373EE)),
                        )
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            height: 60,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: bloc.messageController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 15),
                      fillColor: const Color(0xffF9F6FF),
                      filled: true,
                      hintStyle: const TextStyle(
                          color: Color(0xffB9BAC0),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                      hintText: 'What is in your mind ?...',
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(
                            10,
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                InkResponse(
                  onTap: () async {
                    bloc.add(SendMessage());
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF4D84FF),
                            Color(0xFFDE8FFF),
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    height: 40,
                    width: 40,
                    child: const Icon(
                      Icons.send,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return AnimatedSwitcher(duration: const Duration(milliseconds: 400),
          child: state.selectCurrentMessage.content != null
              ? _buildSelectedItem(state, context) : _buildUnSelectItem(context),
        );


      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void unSelectItem(BuildContext context){
    context.read<ChatBloc>().add(SelectedItem(
        selectCurrentMessage: MessagesModel(),unSelectItem: true));
  }
  Widget _buildSelectedItem(ChatState state, BuildContext context){
    return SafeArea(
      key: const ValueKey(2),
      child: Container(
        height: 80,
        color: const Color(0xffF4F7FE),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {
              unSelectItem(context);
            }, icon: const Icon(Icons.close)),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete_outline_outlined,
                        size: 18)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.info_outline_rounded,
                      size: 18,
                    )),
                IconButton(
                    onPressed: ()async {
                      unSelectItem(context);
                      await Clipboard.setData(ClipboardData(text: state.selectCurrentMessage.content??''));
                      Fluttertoast.showToast(msg: 'کپی شد');

                    },
                    icon: const Icon(
                      Icons.copy,
                      size: 16,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildUnSelectItem(BuildContext context) {
    return AppBar(
      key: const ValueKey(1),
      actions: [
        IconButton(onPressed: () {

        }, icon: const Icon(Icons.history,
          color: Color(0xff747474),)),

        IconButton(onPressed: () {

        }, icon: const Icon(Icons.edit,
          color: Color(0xff747474),)),

        Visibility(
          visible: kDebugMode,
          child: IconButton(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return DeveloperView();
          },));
          }, icon: const Icon(Icons.developer_mode,
            color: Color(0xff747474),)),
        ),
      ],
      title:  Text(
        "Chat AI",
        style: GoogleFonts.dmSans().copyWith(
            fontSize: 16
        ),
      ),
    );
  }


}
