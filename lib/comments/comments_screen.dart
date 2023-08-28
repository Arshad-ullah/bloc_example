
import 'package:counter_bloc/comments/bloc/comments_bloc.dart';
import 'package:counter_bloc/core/model/postmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsCreenWdiget extends StatelessWidget {

UserModel postModel;
    CommentsCreenWdiget({super.key,required this.postModel});

  @override
  Widget build(BuildContext context) {
    print("---------->>");
    print(postModel.id);
    final model=BlocProvider.of<CommentsBloc>(context);
   model.add(CommentsInitialEvent(postId: postModel.id));
    return  BlocConsumer<CommentsBloc, CommentsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if(state is CommentsLoadingState)
        {
          return const Scaffold(body: Center(child: CircularProgressIndicator()),);

        }
        else if(state is CommentsSuccessState)
        {
          
          return  Scaffold(body: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [

              Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    
                    child: Icon(Icons.person,color: Colors.black,)),

                title:Text(postModel.title),
              subtitle:Text(postModel.body),
              
                ),
                
                ),

                const SizedBox(height: 20,),
                const Text("Comments:",style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600
                ),),
                 const SizedBox(height: 20,),
                Expanded(
                  child:ListView.builder(
                    itemCount: state.commentList.length,
                    itemBuilder: (context,index)
                    {
                      return Card(
                        child: ListTile(
                          leading:const CircleAvatar(),
                          title: Text(state.commentList[index].name),
                          trailing:Text(state.commentList[index].email), 
                        ),
                      );

                    },
                  ),
                )
            
              

            

            ],
          ));
        }
        else 
        {
         return const Scaffold(body: Center(child: Text("Nothing")),);
        }
      },
    );
  }
}
