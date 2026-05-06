
class ResponseModel {
  final String message;
  final LoginData data;
  final bool status;
  final int code;

  ResponseModel({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      message: json['message'] ?? '',
      data: LoginData.fromJson(json['data'] ?? {}),
      status: json['status'] ?? false,
      code: json['code'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data.toJson(),
      'status': status,
      'code': code,
    };
  }
}

class LoginData {
  final String token;
  final String username;

  LoginData({
    required this.token,
    required this.username,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      token: json['token'] ?? '',
      username: json['username'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'username': username,
    };
  }
}