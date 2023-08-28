part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}
class PostLoadingEvent extends PostEvent{}

class NavigateToCommentScreen extends PostEvent{

  UserModel userModel;
  NavigateToCommentScreen({required this.userModel});
}



