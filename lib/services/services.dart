import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';


import '../models/user_model.dart';

class ApiServices {
  String endPoint = "https://jsonplaceholder.typicode.com/todos";
  Future<List<UserModel>> getUser() async {
    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);

      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }
}

final Provider<ApiServices> userProvider = Provider((ref) => ApiServices());

final userString = Provider<String>((ref) => 'Hi There');
