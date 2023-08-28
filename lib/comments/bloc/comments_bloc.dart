import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:counter_bloc/core/model/commentsModel.dart';
import 'package:counter_bloc/src/core/services/post_api.dart';
import 'package:meta/meta.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  ApiService apiService=ApiService();
  
  CommentsBloc() : super(CommentsInitial()) {
    on<CommentsInitialEvent>(comment);
  }

  Future<FutureOr<void>> comment(CommentsInitialEvent event, Emitter<CommentsState> emit) 
  
  async {
    emit(CommentsLoadingState());
    // await apiService.getComments(event.postId.toString());

    emit(CommentsSuccessState( commentList: await apiService.getComments(event.postId.toString()) ));
  
  
  }
}
