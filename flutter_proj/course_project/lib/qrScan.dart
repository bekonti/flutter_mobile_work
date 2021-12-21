import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'AshyqView.dart';
import 'DetailView.dart';

class QRScan extends StatefulWidget {
  const QRScan({Key? key}) : super(key: key);

  @override
  _QRScanState createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? barcode;
  QRViewController? controller;

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
          child: Scaffold(
              body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildQrView(context),
          Positioned(
            top: 30,
            child: buildResult(),
          ),
        ],
      )));

  Widget buildResult() => Container(
        padding: EdgeInsets.all(12),
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(8), color: Colors.white24),
        child: Text(
          barcode != null ? '' : 'Рұқсатнама алу үшін ғимараттың\nкіреберісіндегі QR кодын сканерлеңіз',
          textAlign: TextAlign.center,
          style: TextStyle(color:Colors.white),
          maxLines: 3,
        ),
      );

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.green,
          // borderRadius: 10,
          borderLength: 20,
          borderWidth: 10,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
          overlayColor: Colors.transparent.withOpacity(0.85)
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream.listen((barcode) => setState(() {
          this.barcode = barcode;
          if (barcode != null) {
            controller.pauseCamera();
          }
          String code = barcode.code;
          int i = code.indexOf('bin=');
          code = code.substring(i + 4, i + 16);
          if(int.tryParse(code) == null){
            code = 'Ashyq QR-ды сканерлеңіз';
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AshyqView(
                iin: '011012501586',//'001108500875',
                bin: code,
              ),
            ),
          );
        }));
  }
}
