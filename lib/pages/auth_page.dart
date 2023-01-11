import 'package:chatfirebase/components/auth_form.dart';
import 'package:chatfirebase/models/auth_form_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

  class _AuthPageState extends State<AuthPage> {
    bool _isLoading = false;

    void _handleSubmit(AuthFormData formData) {
      setState(() => _isLoading = true);

      print('AuthPage...');
      print(formData.email);

    setState(() => _isLoading = false);
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
          if (_isLoading)
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(0, 0, 0, 05),
              ),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
