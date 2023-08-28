part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

class PostSuccessState extends PostState{

   List<UserModel> userModelList=[];

   PostSuccessState({required this.userModelList});

}
class PostLoadingState extends PostState{}
class PostFailureState extends PostState{}
class NavigateToCommentState extends PostState{
  UserModel userModel;
  NavigateToCommentState({required this.userModel});
}
