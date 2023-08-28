import 'dart:convert';

import 'package:counter_bloc/core/model/commentsModel.dart';
import 'package:counter_bloc/core/model/postmodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // get request
  getPost() async {
    List<UserModel> userModelList = [];
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      print(response.statusCode);

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(response.body);
        for (var value in data) {
          userModelList.add(UserModel(
              title: value["title"],
              body: value["body"],
              id: value["id"],
              userId: value["userId"]));
          // postModelList.add(PostModel(
          //     title: value["title"],
          //     body: value["body"],
          //     userId: value["userId"],
          //     id: value["id"]));
        }
        // print("length as:${userModelList.length}");
        // print(userModelList.length);
        return userModelList;
      } else {
        return userModelList;
        // return postModelList;
      }
    } catch (e) {
      //  return userModelList;
      print("Some issue in the get post request$e");
    }
  }

  //getComments

  getComments(String postId) async {
    List<CommentsModel> commentList = [];
    try {
      final response = await http.get(Uri.parse(
          "https://jsonplaceholder.typicode.com/posts/$postId/comments"));

      print(response.statusCode);

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(response.body);
        for (var value in data) {
          commentList.add(CommentsModel(
              body: value["body"], email: value["email"], name: value["name"]));

          // postModelList.add(PostModel(
          //     title: value["title"],
          //     body: value["body"],
          //     userId: value["userId"],
          //     id: value["id"]));
        }
        return commentList;
        // print("length as:${userModelList.length}");
        // print(userModelList.length);
        // return userModelList;
      } else {
        return commentList;
        // return userModelList;
        // return postModelList;
      }
    } catch (e) {
      // return userModelList;
      print("Some issue in the get post request$e");
    }
  }
}
