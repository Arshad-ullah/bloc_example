part of 'comments_bloc.dart';

@immutable
sealed class CommentsState {}

final class CommentsInitial extends CommentsState {}

class CommentsLoadingState extends CommentsState{}
class CommentsSuccessState extends CommentsState{

  List<CommentsModel> commentList=[];
  
  CommentsSuccessState({required this.commentList});
  
}
class CommentsFailureState extends CommentsState{}


