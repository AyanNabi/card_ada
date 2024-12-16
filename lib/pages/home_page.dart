import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../components/home/identity_card.dart';
import '../components/home/information_sharing.dart';
import '../components/home/selected_information.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F6F1),
      appBar: AppBar(
        backgroundColor: Color(0xFFF7F8FA),
        elevation: 0,
        title: Text('adacard', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: false,
        actions: [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.visibility_off, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.mail_outline, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            IdentityCard(),
            SizedBox(height: 24),
            InformationSharing(),
            SizedBox(height: 24),
            SelectedInformation(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana səhifə',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Məlumatlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services),
            label: 'Xidmətlər',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

/*
void _startNFCReading() async {
  try {
    debugPrint('NFC Tag Type: ');

    bool isAvailable = await NfcManager.instance.isAvailable();

    //We first check if NFC is available on the device.
    if (isAvailable) {
      //If NFC is available, start an NFC session and listen for NFC tags to be discovered.
      NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          // Process NFC tag, When an NFC tag is discovered, print its data to the console.
          // Extract NFC tag data

          final nfcaData = tag.data['nfca'];
          final mifareData = tag.data['mifareclassic'];
          final identifier = nfcaData?['identifier'];

          // Convert identifier to formatted serial number
          String serialNumber;
          if (identifier is List<int>) {
            // Handle identifier as a list of integers
            serialNumber = identifier
                .map((byte) => byte.toRadixString(16).padLeft(2, '0').toUpperCase())
                .join(':');
          } else if (identifier is String) {
            // Handle identifier as a string
            // Assume identifier is a raw string of bytes without colons
            final bytes = identifier.split('').map((e) => int.parse(e, radix: 16)).toList();
            serialNumber = bytes
                .map((byte) => byte.toRadixString(16).padLeft(2, '0').toUpperCase())
                .join(':');
          } else {
            serialNumber = 'Unknown Serial Number';
          }

          final tagType = mifareData != null ? 'MIFARE Classic' : 'Unknown Type';

          // Print the tag type and serial number to the console
          debugPrint('NFC Tag Type: $tagType');
          debugPrint('NFC Tag Serial Number: $serialNumber');


        },
      );
    } else {
      debugPrint('NFC not available.');
    }
  } catch (e) {
    debugPrint('Error reading NFC: $e');
  }
}

void _writeNfcTag(String record) {
  print("Icon tapped, starting NFC writing ...");
  NfcManager.instance.startSession(onDiscovered: (NfcTag badge) async {
    var ndef = Ndef.from(badge);

    if (ndef != null && ndef.isWritable) {
      NdefRecord ndefRecord = NdefRecord.createText(record);
      NdefMessage message = NdefMessage([ndefRecord]);

      try {
        await ndef.write(message);
      } catch (e) {
        NfcManager.instance.stopSession(
            errorMessage: "Error while writing to badge");
      }
    }

    NfcManager.instance.stopSession();
  });
}
*/
