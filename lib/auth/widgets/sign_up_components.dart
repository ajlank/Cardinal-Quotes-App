import 'package:flutter/material.dart';

class SignUpComponents extends StatelessWidget {
  const SignUpComponents({super.key, required this.usernameController, required this.passwordController, 
  required this.confirmPasswordController,
   required this.emailController});
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTextField(
          controller: usernameController,
          hintText: 'Enter your username',
        ),
        const SizedBox(height: 16),

        _buildTextField(
          controller: passwordController,
          hintText: 'Create a password',
          isPassword: true,
        ),

        const SizedBox(height: 16),

        _buildTextField(
          controller: confirmPasswordController,
          hintText: 'Confirm password',
          isPassword: true,
        ),
        const SizedBox(height: 16),

        _buildTextField(
          controller: emailController,
          hintText: 'Enter your email address',
        ),
      ],
    );
  }
}

Widget _buildTextField({
  required TextEditingController controller,
  required String hintText,
  bool isPassword = false,
}) {
  return TextField(
    controller: controller,

    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.brown),

      suffixIcon: isPassword
          ? const Icon(Icons.visibility_off, color: Colors.brown)
          : null,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
  );
}
