import 'package:cardinal_quotes_app/auth/controller/auth_controller.dart';
import 'package:cardinal_quotes_app/auth/models/login_model.dart';
import 'package:cardinal_quotes_app/auth/models/sign_up_model.dart';
import 'package:cardinal_quotes_app/auth/widgets/login_components.dart';
import 'package:cardinal_quotes_app/auth/widgets/sign_up_components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({super.key});

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _emc= TextEditingController();
  final _pac = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final wid = MediaQuery.of(context).size.width;
   final ht=MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: SizedBox(
    height: ht * 0.25,
    width: wid,       
    child: Image.asset(
      'assets/auth_files/bottom_pic.png',
      fit: BoxFit.cover, 
      width: wid,
    ),
  ),
      backgroundColor: const Color.fromARGB(255, 255, 241, 208),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/auth_files/bird.png', height: 170),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildToggleButton('Sign Up', 0, wid),
                const SizedBox(width: 20),
                _buildToggleButton('Log In', 1, wid),
              ],
            ),
            const SizedBox(height: 30),

            (context.watch<AuthController>().getIndex == 0)
                ? SignUpComponents(
                    usernameController: _usernameController,
                    passwordController: _passwordController,
                    confirmPasswordController: _confirmPasswordController,
                    emailController: _emailController,
                  )
                : LoginComponents(
                    passwordController: _pac,
                    emailController: _emc,
                  ),
            const SizedBox(height: 30),

            (context.watch<AuthController>().getIndex == 0)
                ? ElevatedButton(
                    onPressed: () {
                      SignUpModel userData=SignUpModel(
                        name: _usernameController.text,
                       email: _emailController.text,
                        password: _passwordController.text);
                     
                       String user=signUpModelToJson(userData);
                       context.read<AuthController>().registerFunc(user);
                       context.read<AuthController>().setIndex(1);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  )
                : ElevatedButton(
                    onPressed: () {
                     LoginModel userLoginData=LoginModel(email: _emc.text, 
                     password: _pac.text);

                     String userD=loginModelToJson(userLoginData);
                     context.read<AuthController>().loginFunc(userD,context);
                   
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, int index, double wid) {
    final selected = context.watch<AuthController>().getIndex == index;
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        color: selected
            ? Colors.brown
            : const Color.fromARGB(255, 248, 243, 184),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1),
      ),
      child: TextButton(
        onPressed: () {
          context.read<AuthController>().setIndex(index);
        },
        child: Text(
          text,
          style: TextStyle(color: selected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
