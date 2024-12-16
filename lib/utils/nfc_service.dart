import 'package:flutter/services.dart';

class NfcService {
  static const MethodChannel _channel = MethodChannel('nfc_service');

  static Future<void> startNFCReading() async {
    print("Nfe service util ");

    try {
      print("welcome");

      await _channel.invokeMethod('startCardEmulation', {
        'uuid': '12345678', // Replace with logic to generate or retrieve the UUID
        'ndefMessage': 'NDEFMessage', // Replace with your desired NDEF message
      });

      print("gonderdim");

    } on PlatformException catch (e) {
      print("Failed to start NFC reading: ${e.message}");
    }

  }


}
