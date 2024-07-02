import 'package:dc/Components/field.dart';
import 'package:dc/Components/mybutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmpassword=TextEditingController();

  void signUserUp() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
    );
    //try creating user
    try {
      if(password.text==confirmpassword.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: username.text,
          password: password.text,
        );
      }
      else{
          const AlertDialog(title: Text("Error Password Do not Match"),);
        }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmailmessage();
      }
      else if (e.code == 'wrong-password') {
        wrongpassword();
        print('Error');
      }
    }
  }
  void wrongEmailmessage(){
    showDialog(context: context,
        builder: (context){
          return const AlertDialog(title: Text('Incorrect Email'),);
        });
  }
  void wrongpassword(){
    showDialog(context: context,
        builder: (context){
          return const AlertDialog(title: Text('Incorrect Password'));
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                //logo
                const Icon(
                  Icons.lock,
                  color: Colors.blue,
                  size: 100,
                ),
                const SizedBox(height: 40),
                //Welcome message
                const Text('Let\'s create a new account for you',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),),
                //username text field
                const SizedBox(height: 70),
                my_textfield(
                  controller: username,
                  hintText: 'Email',
                  obscureText: false,
                ),
                //password text field
                const SizedBox(height: 10),
                my_textfield(
                  controller: password,
                  hintText: 'Password',
                  obscureText: true,
                ),
                //Confirm password
                const SizedBox(height: 10),
                my_textfield(
                  controller: confirmpassword,
                  hintText: ' Confirm Password',
                  obscureText: true,
                ),

                //Forgot password
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.blue,
                          fontSize: 14,),
                      ),
                    ],
                  ),
                ),
                //Sign In button
                const SizedBox(height: 20.0,),
                Mybutton(
                  onTap: signUserUp,
                  text: "Sign Up"
                      "",
                ),
                //New User?Register
                const SizedBox(height: 60,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already Have an Account?',
                        style: TextStyle(color: Colors.black87,
                            fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Login Now',
                          style: TextStyle(color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
