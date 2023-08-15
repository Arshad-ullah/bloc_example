import 'package:counter_bloc/screen/login/bloc/login_bloc.dart';
import 'package:counter_bloc/screen/login/bloc/login_bloc.dart';
import 'package:counter_bloc/screen/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocBuilder<LoginBloc, AuthState>(
        builder: (context, state) {

          if(state==AuthState.authenticated)
          {
             return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Authenticated'),
                  ElevatedButton(
                    onPressed: () {
                       context.read<LoginBloc>().add(LogoutAuthEvent());
                    },
                    child: Text('Logout'),
                  ),
                ],
              );
          
          }
          else 
          {
             return Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        context.read<LoginBloc>().add(LogingAuthEvent(email:email,password: password));
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              );
          }
          
        },
      ),
    );
  }
}