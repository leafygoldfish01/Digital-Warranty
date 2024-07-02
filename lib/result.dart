import 'package:dc/qrscanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Result extends StatelessWidget {
  final String code;
  final Function() closeScreen;

  const Result({super.key,required this.closeScreen,required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Bgcolor,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          closeScreen();
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white)),
          centerTitle: true,
          title: const Text("QR Scanner",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )
            ,)
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Qr image child here
            QrImageView(data: code, size: 150,version: QrVersions.auto
            ),
            const Text("Results",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),),
            const SizedBox(
              height: 10,
            ),
            Text(
              code,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 18,
                letterSpacing: 1,
              ),),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width-100,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                onPressed: (){
                  Clipboard.setData(ClipboardData(text: code));
                },
                child: const Text("Data :",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  letterSpacing: 1,
                ),),

              ),
            )
          ],
        ),
      ),
    );
  }
}
