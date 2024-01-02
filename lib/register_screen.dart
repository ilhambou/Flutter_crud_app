import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/controle.page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> registerUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (userCredential.user != null) {
        navigateToControlPage();
      }
    } on FirebaseAuthException catch (e) {
      handleRegistrationError(e);
    } catch (e) {
      print(e.toString());
    }
  }

  void navigateToControlPage() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => ControlPage()),
    );
  }

  void handleRegistrationError(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      showSnackbar('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      showSnackbar('The account already exists for that email.');
    }
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Register to MyApp",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 44.0),
            buildEmailTextField(),
            const SizedBox(height: 26.0),
            buildPasswordTextField(),
            const SizedBox(height: 26.0),
            buildRegisterButton(),
          ],
        ),
      ),
    );
  }

  Widget buildEmailTextField() {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: "Enter Email",
        prefixIcon: Icon(Icons.mail, color: Colors.black),
      ),
    );
  }

  Widget buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: "Enter Password",
        prefixIcon: Icon(Icons.lock, color: Colors.black),
      ),
    );
  }

  Widget buildRegisterButton() {
    return Container(
      width: double.infinity,
      child: RawMaterialButton(
        fillColor: const Color(0xFF0069FE),
        elevation: 0.0,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        onPressed: registerUser,
        child: const Text(
          "Register",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
