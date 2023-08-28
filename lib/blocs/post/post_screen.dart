import 'package:counter_bloc/blocs/post/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../comments/comments_screen.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = BlocProvider.of<PostBloc>(context);
    model.add(PostLoadingEvent());
    return Scaffold(
      body: BlocConsumer<PostBloc, PostState>(
        listener: (context, state) {
          // print(state);
          if (state is NavigateToCommentState) {
            Get.to(() => CommentsCreenWdiget(
                  postModel: state.userModel,
                ));
          }
        },
        builder: (context, state) {
          if (state is PostLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostSuccessState) {
            return ListView.builder(
              itemCount: state.userModelList.length,
              itemBuilder: (context, index) {
                final data = state.userModelList[index];
                return Card(
                  child: ListTile(
                    onTap: () {
                      model.add(NavigateToCommentScreen(
                          userModel: model.userModelList[index]));
                    },
                    leading: const CircleAvatar(
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                    title: Text(data.title),
                    subtitle: Text(data.body.toString()),
                    trailing: Text(data.id.toString()),
                  ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
