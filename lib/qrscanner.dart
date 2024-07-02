import 'package:dc/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

const Bgcolor = Color(0xfffafafa);

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  bool isScanCompleted=false;
  bool isFlashOn=false;
  bool isFrontCamera=false;
  MobileScannerController controller=MobileScannerController();

  void closeScreen(){
    isScanCompleted=false;
  }
  void SignUserOut()
  {
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Bgcolor,
      drawer: const Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            setState(() {
              isFlashOn=!isFlashOn;
            });
            if(isFlashOn) {
              controller.toggleTorch();
            }
            else
              {
                controller.toggleTorch();
              }
          }, icon: Icon(Icons.flash_on, color: isFlashOn? Colors.black87 : Colors.white,)),
          IconButton(onPressed: (){
            setState(() {
              isFrontCamera=!isFrontCamera;
            });
            controller.switchCamera();
          }, icon: Icon(Icons.camera_front, color: isFrontCamera ? Colors.black87 : Colors.white,)),
          IconButton(
              onPressed:SignUserOut,
              icon: const Icon(Icons.logout)
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text("QR Scanner",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          )
          ,)
      ),
      body: Container(
      width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Expanded(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Place the QR code in the area below",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),),
                    ],
                  ),
                ),
            Expanded(
                flex:5,
              child: Stack(
                children: [
                  MobileScanner(
                    controller: controller,
                      allowDuplicates: true,
                      onDetect: (barcode,args){
                        if(!isScanCompleted){
                          String code= barcode.rawValue ?? '---';
                          isScanCompleted=true;
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>Result(closeScreen: closeScreen,code: code,)));
                        }
                      }),
                  QRScannerOverlay(overlayColor: Bgcolor),
                ],
              ),
            ),
            Expanded(
                child: Container(color: Colors.transparent)),
          ],
        ),
      ),
    );
  }
}
