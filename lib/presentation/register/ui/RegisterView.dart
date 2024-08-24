import 'package:ai_test/presentation/chat/ui/ChatView.dart';
import 'package:ai_test/presentation/login/ui/LoginView.dart';
import 'package:ai_test/presentation/register/bloc/register_bloc.dart';
import 'package:ai_test/presentation/widgets/GradientText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final registerBloc = RegisterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      bloc: registerBloc,
      listener: (BuildContext context, RegisterState state) {
        if(state is RegisterIsAgreeState){
          print("ASDSAD ${state.isAgree}");
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        InkResponse(
                          radius: 20,
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            child: const Icon(Icons.arrow_back),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text('Create an Account',
                            style: GoogleFonts.dmSans(
                                fontSize: 24.0, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 30.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Name',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                TextFormField(
                                  controller: registerBloc.cntName,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(left: 15),
                                    fillColor: const Color(0xffF8F8F8),
                                    filled: true,
                                    hintStyle: const TextStyle(
                                        color: Color(0xffB9BAC0),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    hintText: 'Please write your name...',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(
                                          4,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'E-Mail Address',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            TextFormField(
                              controller: registerBloc.cntEmail,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 15),
                                fillColor: const Color(0xffF8F8F8),
                                filled: true,
                                hintStyle: const TextStyle(
                                    color: Color(0xffB9BAC0),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                                hintText: 'Jaki@gmail.com',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(
                                      4,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Password',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            TextFormField(
                              controller: registerBloc.cntPassword,

                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 15),
                                fillColor: const Color(0xffF8F8F8),
                                filled: true,
                                hintStyle: const TextStyle(
                                    color: Color(0xffB9BAC0),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                                hintText: '*****',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(
                                      4,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24.0),
                        Row(
                          children: <Widget>[

                            Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                side: const BorderSide(
                                    color: Color(0xffEFEFEF), width: 2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                value: (state is RegisterIsAgreeState) ? state.isAgree : false,
                                onChanged: (value) {
                                  registerBloc.add(RegisterIsAgreeEvent(isAgree: value ?? false));
                                },
                              ),
                            ) ,
                            const Row(
                              children: [
                                Text('I agree with',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff747474))),
                                GradientText(' Terms and conditions',
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xff4D84FF),
                                        Color(0xffDE8FFF),
                                      ],
                                      stops: [0.1, 3],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ))
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 24.0),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              const ChatView(),));

                            registerBloc.add(RegisterIsLoadingCreateAccountEvent());
                          },
                          child: Container(
                            height: 48,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: const Color(0xff9373EE),
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                                child: (state is
                                RegisterLoadingBtnCreateAccountState) &&
                                state.isLoadingButton ?

                                const CircularProgressIndicator() : Text(
                              "Create an Account",
                              style: GoogleFonts.dmSans(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Center(
                          child: TextButton(
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Already have an account?',
                                  style: TextStyle(color: Colors.black),
                                ),
                                GradientText(' Login',
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xff9D7AFF),
                                        Color(0xff52D5FF),
                                      ],
                                      stops: [0.1, 0.9],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ))
                              ],
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const LoginView();
                                },
                              ));
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
