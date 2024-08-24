import 'package:ai_test/ai_injection_container.dart';
import 'package:ai_test/core/Helper/ImageUrls.dart';
import 'package:ai_test/core/Interfaces/DataSource/AiRemoteDataSource.dart';
import 'package:ai_test/core/Interfaces/Repository/AiRepository.dart';
import 'package:ai_test/core/UseCases/LoginUseCase.dart';
import 'package:ai_test/presentation/login/bloc/login_bloc.dart';
import 'package:ai_test/presentation/login/ui/LoginView.dart';
import 'package:ai_test/presentation/register/ui/RegisterView.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [_buildBgImage(), _buildBottomSection()],
        ));
  }

  _buildBgImage() {
    final size = MediaQuery.of(context).size;
    return Positioned(
        top: 0,
        right: 0,
        left: 0,
        bottom: size.height * 0.3,
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            // Create a linear gradient shader for the mask
            return const LinearGradient(
              colors: [Colors.white, Colors.black],
              stops: [0.6, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bounds);
          },
          child: Container(
            margin: const EdgeInsets.only(right: 0),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageUrls.bgOnboarding),
                    fit: BoxFit.fitHeight)),
          ),
        ));
  }

  _buildBottomSection() {
    final size = MediaQuery.of(context).size;

    return Positioned(
        bottom: 0,
        height: size.height * 0.45,
        right: 0,
        left: 0,
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    // Create a linear gradient shader for the mask
                    return LinearGradient(
                      colors: [ const Color(0xff9373EE), Colors.blue.shade300 ,Colors.blue.shade300  ],
                      stops: [0.1, 0.5 , 0.9],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(bounds);
                  },
                  child: Text(
                    'Create \n anything your \n want with AI',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                        fontSize: 48,color: const Color(0xff9373EE)
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              FadeInUp(
                delay: const Duration(milliseconds: 400),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const RegisterView();
                    },));
                  },
                  child: Container(
                    height: 48,
                    width: size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xff9373EE),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center(child: Text("Create an Account",
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 16,
                    ),)),
                  ),
                ),
              ),

              const SizedBox(height: 10,),
              FadeInUp(
                delay: const Duration(milliseconds: 500),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return BlocProvider(create: (context) => LoginBloc(loginUseCase: injector()),
                      child: const LoginView(),);
                    },));
                  },
                  child: Container(
                    height: 48,
                    width: size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center(child: Text("Login",
                    style: GoogleFonts.dmSans(
                      color: const Color(0xff9373EE),
                      fontSize: 16,
                             ),),),
                  ),
                ),
              )
            ],
          ),
        ));
  }


}
