part of 'comments_bloc.dart';

@immutable
sealed class CommentsEvent {}

class CommentsInitialEvent extends CommentsEvent
{
  int postId;
  CommentsInitialEvent({required this.postId});
}
