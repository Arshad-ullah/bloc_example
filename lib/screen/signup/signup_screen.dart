import 'package:counter_bloc/blocs/signup_bloc/signup_bloc.dart';
import 'package:counter_bloc/blocs/signup_bloc/signup_events.dart';
import 'package:counter_bloc/core/components/colors.dart';
import 'package:counter_bloc/core/components/fontmanager.dart';
import 'package:counter_bloc/screen/singin/signin_screen.dart';
import 'package:counter_bloc/widget/customCotainer.dart';
import 'package:counter_bloc/widget/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    final singupModel = BlocProvider.of<SignupBloc>(context);
    return Scaffold(
      body: SafeArea(child: BlocBuilder<SignupBloc, AuthState>(
        builder: (context, state) {
          if (state == AuthState.initial || state == AuthState.loading) {
            return ModalProgressHUD(
              inAsyncCall: state==AuthState.loading,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.01,
                    ),
                    const Center(
                      child: Text(
                        'Signup',
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
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
                            controller: singupModel.emailController,
                            labelText: "Enter Email",
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          CustomTextField(
                            controller: singupModel.nameController,
                            labelText: "Enter Name",
                            // keyboardType: TextInputType.visiblePassword,
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          CustomTextField(
                            controller: singupModel.phoneController,
                            labelText: "Enter Phone",
                            keyboardType: TextInputType.phone,
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          CustomTextField(
                            controller: singupModel.passwordController,
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
                              if (singupModel.emailController.text.trim().isNotEmpty &&
                                  singupModel.phoneController.text
                                      .trim()
                                      .isNotEmpty &&
                                  singupModel.nameController.text
                                      .trim()
                                      .isNotEmpty &&
                                  singupModel.passwordController.text
                                      .trim()
                                      .isNotEmpty) {
                                singupModel.add(
                                  SignupAuthEvent(
                                      email:
                                          singupModel.emailController.text.trim(),
                                      name:
                                          singupModel.nameController.text.trim(),
                                      password: singupModel
                                          .passwordController.text
                                          .trim(),
                                      phoneNumber: singupModel
                                          .phoneController.text
                                          .trim()),
                                );
                              }
                            },
                            // containerColor:Colors.red,
            
                            widget: Center(
                                child: manropeText(
                                    text: "Signup",
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
                                  text: "Already have a account! ",
                                  color: kblackColor,
                                  fontSize: 15),
                              GestureDetector(
                                  onTap: () {
                                    Get.offAll(() => const SigninScreen());
                                  },
                                  child: manropeText(
                                      text: "Signin",
                                      color: klightBlueColor,
                                      fontSize: 15)),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      )),
    );
  }
}
