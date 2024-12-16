package com.example.card_ada;

import android.nfc.cardemulation.HostApduService;
import android.os.Bundle;
import android.util.Log;
import java.util.Arrays;

public class MyHostApduService extends HostApduService {
    private static String uuid = "DEFAULT_UUID";
    private static String ndefMessage = "DEFAULT_MESSAGE";

    // Method to start emulation and set uuid and ndefMessage
    public static void startEmulation(String newUuid, String newMessage) {
        uuid = newUuid;
        ndefMessage = newMessage;
    }

    @Override
    public byte[] processCommandApdu(byte[] commandApdu, Bundle extras) {
        Log.d("HceService", "Received APDU: " + Arrays.toString(commandApdu));
        if (commandApdu == null || commandApdu.length == 0) {
            Log.e("HceService", "Received an empty APDU command.");
            return new byte[0];
        }

        // Log the received APDU for debugging
        Log.d("HceService", "Received APDU: " + Arrays.toString(commandApdu));

        // Check if the APDU is a SELECT command
        if (isSelectApdu(commandApdu)) {
            String response = uuid + "|" + ndefMessage; // Prepare response
            Log.d("HceService", "Responding with: " + response);
            return response.getBytes();  // Return response as bytes
        }

        // Return an empty byte array if it's not a SELECT APDU
        return new byte[0];
    }

    @Override
    public void onDeactivated(int reason) {
        // Handle the deactivation of the HCE session
    }

    private boolean SelectApdu(byte[] apdu) {
        // Implement logic to check if APDU matches the AID
        return true;  // For simplicity, always returns true
    }

    private byte[] getWelcomeMessage() {
        // Custom response to the POS terminal
        return "Welcome".getBytes();  // Example response
    }
    private boolean isSelectApdu(byte[] commandApdu) {
        // Check if the APDU is a SELECT command (APDU structure)
        return commandApdu.length >= 4 &&
                commandApdu[0] == 0x00 &&
                commandApdu[1] == (byte) 0xA4 &&
                commandApdu[2] == 0x04 &&
                commandApdu[3] == 0x00;
    }
}
