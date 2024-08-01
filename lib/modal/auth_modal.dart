class LoginResponse {
  final String token;
  final String refreshToken;
  LoginResponse({required this.token, required this.refreshToken});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      refreshToken: json['refresh_token'],
    );
  }
}

class LoginData {
  final String email;
  final String password;

  LoginData({required this.email, required this.password});
}
