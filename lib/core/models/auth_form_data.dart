import 'dart:io';

enum AuthMode { Signup, Login }

class AuthFormData {
  String name = '';
  String email = '';
  String password = '';
  File? image;
  AuthMode mode = AuthMode.Login;

  bool get isLogin {
    return mode == AuthMode.Login;
  }

  bool get isSignup {
    return mode == AuthMode.Signup;
  }

  void toggleAuthMode() {
    mode = isLogin ? AuthMode.Signup : AuthMode.Login;
  }
}