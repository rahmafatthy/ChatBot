import 'package:chatbot/utils/dialog_utils.dart';
import 'package:chatbot/utils/validation_utils.dart';
import 'package:chatbot/views/auth/login_view.dart';
import 'package:chatbot/views/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../componant/checkButton.dart';
import '../../componant/custom_alert_dialog.dart';
import '../../componant/custom_button.dart';
import '../../componant/custom_rich_text.dart';
import '../../componant/custom_text_field.dart';
import '../../componant/imgComponant.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isButtonChecked = false;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cpassController = TextEditingController();
  FirebaseAuth authService = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 150, 12, 30),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const imgComponant(
                    width: 90, height: 90, img: splashBackground),
                const SizedBox(height: 10),
                const Text(
                  createYourAccount,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const SizedBox(height: 10),
                const Text(
                  Continue,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const SizedBox(height: 20),
                MyCustomTextField(
                  controller: nameController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Enter Full Name';
                    }
                    return null;
                  },
                  icon: Icons.person,
                  hintText: hintEnterName,
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyCustomTextField(
                  controller: emailController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Enter Email';
                    }
                    if (!ValidationUtils.isValidEmail(text)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  icon: Icons.mail,
                  hintText: hintEnterEmail,
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyCustomTextField(
                  controller: passwordController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Enter Password';
                    }
                    if (text.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  icon: Icons.lock,
                  hintText: hintPassword,
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                MyCustomTextField(
                  controller: cpassController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Confirm your Password';
                    }
                    if (passwordController.text != text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                  icon: Icons.lock,
                  hintText: hintConfirmPassword,
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: signUp,
                  onTap: () {
                    register();
                  },
                ),
                const SizedBox(height: 20),
                CheckButton(
                  text1: termsOfService1,
                  text2: terms,
                  text3: and,
                  text4: Privacy,
                  isChecked: _isButtonChecked,
                  onChanged: (value) {
                    setState(() {
                      _isButtonChecked = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                CustomRichText(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SignIn()),
                    );
                  },
                  text1: alreadyHaveAccount,
                  text2: signIn,
                  color1: black,
                  color2: secondaryPrimaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    if (_formKey.currentState?.validate() == true && _isButtonChecked) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog();
        },
      );

      try {
        await authService.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const CustomAlertDialog()),
            (Route<dynamic> route) => false,
          );
        });
        DialogUtils.hideDialog(context);
      } on FirebaseAuthException catch (e) {
        Navigator.of(context).pop(); // Close the dialog
        String errorMessage;
        if (e.code == 'weak-password') {
          errorMessage = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'The account already exists for that email.';
        } else {
          errorMessage = 'An error occurred. Please try again.';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      } catch (e) {
        Navigator.of(context).pop(); // Close the dialog
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred. Please try again.')),
        );
      }
    } else if (!_isButtonChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You must agree to the terms and conditions.'),
        ),
      );
    }
  }
}
