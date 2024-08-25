import 'package:ai_test/ai_injection_container.dart';
import 'package:ai_test/core/Dto/Enums/ApiStatus.dart';
import 'package:ai_test/presentation/chat/bloc/chat_bloc.dart';
import 'package:ai_test/presentation/chat/ui/ChatView.dart';
import 'package:ai_test/presentation/login/bloc/login_bloc.dart';
import 'package:ai_test/presentation/register/ui/RegisterView.dart';
import 'package:ai_test/presentation/widgets/GradientText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Scaffold(
            bottomNavigationBar:  Stack(
              children: [
                CustomPaint(
                  size: const Size(double.infinity,200), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter(),),
                CustomPaint(
                  size: const Size(double.infinity,200), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter2(),),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Login',
                      style: GoogleFonts.dmSans(
                          fontSize: 24.0, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 30.0),
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
                        controller: bloc.emailTextField,
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
                        controller: bloc.passwordTextField,
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
                  InkWell(
                    onTap: () {
                      bloc.add(const ApiLogin());
                    },
                    child: BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        print('asedsadsa ${state.status}');
                        if(state.status.isSuccess){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BlocProvider(create: (context) =>
                                ChatBloc(chatUseCase: injector())..add(CheckHistory()),
                              child: ChatView(),),));
                        }
                      },
                      builder: (context, state) {
                        return Container(
                          height: 48,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: const Color(0xff9373EE),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: state.status.isLoading
                                  ? const CircularProgressIndicator(color: Colors.white,)
                                  : Text(
                                      "Login",
                                      style: GoogleFonts.dmSans(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    )),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Center(
                    child: TextButton(
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Already haven\'t an account?',
                            style: TextStyle(color: Colors.black),
                          ),
                          GradientText(' Sign Up',
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
                            return const RegisterView();
                          },
                        ));
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
        ));
  }
}


class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(121, 243, 195, 252)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width*0.0066506,size.height*0.4014286);
    path_0.cubicTo(size.width*0.5034068,size.height*1.2876602,size.width*0.7501179,size.height*0.4039110,size.width*1.0001629,size.height*0.4014286);
    path_0.quadraticBezierTo(size.width*1.0001629,size.height*0.5888529,size.width*1.0034968,size.height*0.9972145);
    path_0.lineTo(size.width*-0.0000172,size.height*1.0021794);
    path_0.quadraticBezierTo(size.width*0.0041502,size.height*0.9599779,size.width*0.0066506,size.height*0.4014286);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class RPSCustomPainter2 extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const  Color.fromARGB(84, 225, 179, 255)

      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.0019417,size.height*0.5741571);
    path_0.quadraticBezierTo(size.width*0.0006917,size.height*0.7884429,size.width*-0.0008333,size.height*0.9985714);
    path_0.lineTo(size.width*0.9704500,size.height*1.0010143);
    path_0.quadraticBezierTo(size.width*0.9741000,size.height*0.9827000,size.width*0.9819667,size.height*0.9666429);
    path_0.quadraticBezierTo(size.width*0.9912250,size.height*0.9505571,size.width,size.height*0.9479000);
    path_0.quadraticBezierTo(size.width*0.9971583,size.height*0.6327143,size.width*0.9969500,size.height*0.5798571);
    path_0.cubicTo(size.width*0.7992500,size.height*1.3571429,size.width*0.3156917,size.height*0.5770143,size.width*0.0019417,size.height*0.5741571);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}




