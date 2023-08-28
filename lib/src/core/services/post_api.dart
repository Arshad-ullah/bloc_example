import 'dart:convert';

import 'package:counter_bloc/core/model/postmodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // get request
  getPost() async {
    List<UserModel> userModelList = [];
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

      print(response.statusCode);

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
         print(response.body);
        for (var value in data) {
          userModelList.add(UserModel(
              email: value["email"],
              name: value["name"],
              username: value["username"]));
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
}
