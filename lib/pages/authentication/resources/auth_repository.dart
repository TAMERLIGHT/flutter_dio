import 'package:flutter_app_new/pages/authentication/bloc/auth_bloc_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert' as convert;

class AuthRepository {
  Future<Response> onGetAuthEvent(GetAuthEvent event) async {
    try {
      final response = await http.post(
        Uri.parse("http://localhost:3000/rest/user/register"),
        body: convert.jsonEncode({
          'username': event.username,
          'email': event.email,
        }),
      );
      return response;
    } catch (_) {
      throw Exception('Ошибка!');
    }
  }
}
