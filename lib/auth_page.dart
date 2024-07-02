import 'package:dc/loginorregister.dart';
import 'package:dc/qrscanner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class authpage extends StatelessWidget {
  const authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot){
        //user is logged in
        if(snapshot.hasData)
          {
            return const QRScanner();
          }
        //user is not logged in
        else
          {
            return const loginorregister();
          }
      },
      ),
    );
  }
}
