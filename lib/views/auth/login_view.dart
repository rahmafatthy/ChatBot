import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatbot/componant/custom_rich_text.dart';
import 'package:chatbot/views/auth/sign_up.dart';
import 'package:chatbot/views/home/home_view.dart';
import 'package:chatbot/componant/custom_button.dart';
import 'package:chatbot/componant/custom_text_field.dart';
import 'package:chatbot/componant/imgComponant.dart';
import 'package:chatbot/utils/colors.dart';
import 'package:chatbot/utils/images.dart';
import 'package:chatbot/utils/text.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../componant/social_box.dart';
import 'package:chatbot/utils/dialog_utils.dart';
import 'package:chatbot/utils/validation_utils.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final passController = TextEditingController();
  final emailController = TextEditingController();
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
                  login_1,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const SizedBox(height: 10),
                const Text(
                  login_2,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const SizedBox(height: 20),
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
                  controller: passController,
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
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    forgotPassword,
                    style: TextStyle(
                      color: secondaryPrimaryColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: signIn,
                  onTap: () {
                    if (_formKey.currentState?.validate() == true) {
                      login();
                    }
                  },
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150.0,
                      child: Divider(
                        color: gray,
                        thickness: 1.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        or,
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150.0,
                      child: Divider(
                        color: gray,
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SocialBox(
                  onTap: () {
                    _handleGoogleSignIn();
                  },
                  text: google,
                  img: googleImg,
                ),
                const SizedBox(height: 20),
                CustomRichText(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  text1: dontHaveAccount,
                  text2: signUp,
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

  void login() async {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    DialogUtils.showLoadingDialog(context, "Loading...");
    try {
      await authService.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      DialogUtils.hideDialog(context);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomeView()),
        (Route<dynamic> route) => false,
      );
    } on FirebaseAuthException catch (e) {
      DialogUtils.hideDialog(context);
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided.';
      } else {
        errorMessage = 'An error occurred. Please try again.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      DialogUtils.hideDialog(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again.')),
      );
    }
  }

  void _handleGoogleSignIn() async {
    try {
      // Trigger the Google Sign-in flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        // Obtain the GoogleSignInAuthentication object
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential using the GoogleAuthProvider
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in with the credential
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        final User? user = userCredential.user;

        if (user != null) {
          // Navigate to the desired screen or perform further actions
        } else {
          print('Google sign-in failed.');
        }
      } else {
        // Handle sign-in failure
        print('Google sign-in failed.');
      }
    } catch (error) {
      print('Error signing in with Google: $error');
    }
  }
}
