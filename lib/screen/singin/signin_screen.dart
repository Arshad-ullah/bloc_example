import 'package:counter_bloc/blocs/signin_bloc/signin_bloc.dart';
import 'package:counter_bloc/blocs/signin_bloc/signin_event.dart';
import 'package:counter_bloc/core/components/colors.dart';
import 'package:counter_bloc/core/components/fontmanager.dart';
import 'package:counter_bloc/screen/signup/signup_screen.dart';
import 'package:counter_bloc/widget/customCotainer.dart';
import 'package:counter_bloc/widget/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    final signinBloc=BlocProvider.of<SinginBloc>(context);
    return Scaffold(
      body: SafeArea(child: BlocBuilder<SinginBloc, AuthState>(
        builder: (context, state) {
          if(state==AuthState.initial|| state==AuthState.loading)
          {
              return ModalProgressHUD(
                inAsyncCall:state==AuthState.loading,
                
                child: Container(
                child: SingleChildScrollView(
                          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          controller:signinBloc.emailController,
                          labelText: "Enter email",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        CustomTextField(
                          controller: signinBloc.passwordController,
                          labelText: "Enter password",
                          // keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        CustomContainer(
                          borderColor: Colors.blue,
                          onTap: () {
                          if(signinBloc.emailController.text.trim().isNotEmpty && signinBloc.passwordController.text.trim().isNotEmpty)
                          {
                            signinBloc.add(SigninAuthEvent(email: signinBloc.emailController.text.trim(), password: signinBloc.passwordController.text.trim()));

                          }
                          },
                          // containerColor:Colors.red,
              
                          widget: Center(
                              child: manropeText(
                                  text: "Login",
                                  color: kwhiteColor,
                                  fontSize: 20)),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            manropeText(
                                text: "Create a account! ",
                                color: kblackColor,
                                fontSize: 15),
                            GestureDetector(
                                onTap: () {
                                  print('arshad');
                                  Get.to(() => SignUpScreen());
                                },
                                child: manropeText(
                                    text: "Signup",
                                    color: klightBlueColor,
                                    fontSize: 15)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
                          ),
                        )),
              );
        
          }
          else 
          {
            return SizedBox();
          }
        },
      )),
    );
  }
}
