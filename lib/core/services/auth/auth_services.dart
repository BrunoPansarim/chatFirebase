import 'dart:io';
import 'package:chatfirebase/core/models/chat_user.dart';
import 'package:chatfirebase/core/services/auth/auth_mock_service.dart';

 abstract class AuthService {
  ChatUser? get currentUser;

  Stream<ChatUser?> get userChanges;

  Future<void> signup(
    String nome,
    String email,
    String password,
    File? image,
  );

  Future<void> login(
    String email,
    String password,
  );

  Future<void> logout();

  factory AuthService() {
    return AuthMockService();
    // return AuthFireBaseService();
  }
}
