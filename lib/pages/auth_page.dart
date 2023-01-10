import 'package:chatfirebase/components/auth_form.dart';
import 'package:flutter/material.dart';

import '../models/auth_form_data.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key, required String title}) : super(key: key);

  void _handleSubmit(AuthFormData formData) {
    print('AuthPage...');
    print(formData.email);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
         Center(
          child: SingleChildScrollView(
            child: AuthForm(onSubmit: _handleSubmit),
          ),
        ),
        ]
      ),
    );
  }
}
