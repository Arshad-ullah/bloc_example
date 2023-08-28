
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:counter_bloc/core/model/postmodel.dart';
import 'package:counter_bloc/src/core/services/post_api.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {

  ApiService apiService = ApiService();
  List<UserModel> userModelList=[];
  PostBloc() : super(PostInitial()) {
    // init();
    on<PostLoadingEvent>(postLoading);
    on<NavigateToCommentScreen>(navigateToComment);
  }


 void postLoading(PostLoadingEvent event, Emitter<PostState> emit) async {
    emit(PostLoadingState());
    try {
   userModelList=   await apiService.getPost();

    //  await Future.delayed(const Duration(seconds: 1));

      emit(PostSuccessState(
        userModelList:userModelList
      ));

      
    } catch (e) {

      print("some issue$e");

      emit(PostFailureState());
    }
  }

  FutureOr<void> navigateToComment(NavigateToCommentScreen event, Emitter<PostState> emit) {
    emit(NavigateToCommentState(userModel: event.userModel));
    emit(PostSuccessState(userModelList:userModelList));
 
 
  }
}
