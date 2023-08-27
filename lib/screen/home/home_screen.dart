import 'package:counter_bloc/blocs/signin_bloc/signin_bloc.dart';
import 'package:counter_bloc/blocs/signin_bloc/signin_event.dart';
import 'package:counter_bloc/blocs/signin_bloc/signin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = BlocProvider.of<SinginBloc>(context);
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: model.state is LoadingState,
        child: Center(
          child: TextButton(onPressed: () {

            model.add(LogoutAuthEvent());

          }, child: Text("Logout")),
        ),
      ),
    );
  }
}
