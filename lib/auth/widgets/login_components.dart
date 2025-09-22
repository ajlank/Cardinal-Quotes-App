import 'package:flutter/material.dart';

class LoginComponents extends StatelessWidget {
  const LoginComponents({super.key, required this.passwordController, 
   required this.emailController});
  final TextEditingController passwordController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),

        _buildTextField(
          controller: emailController,
          hintText: 'Enter your email address',
        ),
        
        const SizedBox(height: 16),

        _buildTextField(
          controller: passwordController,
          hintText: 'Enter password',
          isPassword: true,
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
