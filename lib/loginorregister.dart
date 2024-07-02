import 'package:dc/RegisterPage.dart';
import 'package:dc/login.dart';
import 'package:flutter/material.dart';

class loginorregister extends StatefulWidget {

  const loginorregister({super.key});

  @override
  State<loginorregister> createState() => _loginorregisterState();
}

class _loginorregisterState extends State<loginorregister> {

  bool ShowLoginPage=true;

  void togglepages(){
    setState(() {
      ShowLoginPage=!ShowLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(ShowLoginPage)
      {
        return loginpage(onTap: togglepages);
      }
    else
      {
        return RegisterPage(onTap: togglepages);
      }
  }
}
