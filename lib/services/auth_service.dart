import 'dart:convert';

import 'package:flutter_app/modal/auth_modal.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future login(LoginData data) async {
    try {
      final response = await http
          .post(Uri.parse('https://api-lplus.axalize.vn/api/login'), body: {
        'mail_address': data.email,
        'password': data.password,
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
