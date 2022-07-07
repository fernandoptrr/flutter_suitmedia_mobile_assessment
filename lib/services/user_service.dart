import 'dart:convert';

import 'package:flutter_suitmedia_mobile_assessment/models/api_return_value.dart';
import 'package:flutter_suitmedia_mobile_assessment/models/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<ApiReturnValue<List<User>>> getListUser({required int page}) async {
    final url = "https://reqres.in/api/users?page=$page&per_page=6";

    try {
      final response = await http.Client().get(
        Uri.parse(url),
      );
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final List<User> listUser =
            List<User>.from(data["data"].map((x) => User.fromJson(x)));
        return ApiReturnValue(value: listUser);
      } else {
        return ApiReturnValue(
          message:
              'Request failed\nStatus Code: ${response.statusCode}\nReason: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      return ApiReturnValue(message: 'Error: $e');
    }
  }
}
