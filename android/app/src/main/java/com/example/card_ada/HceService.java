package com.example.yourapp;

import android.nfc.cardemulation.HostApduService;
import android.os.Bundle;

public class HceService extends HostApduService {
    private static String uuid = "DEFAULT_UUID";
    private static String ndefMessage = "DEFAULT_MESSAGE";

    public static void startEmulation(String newUuid, String newMessage) {
        uuid = newUuid;
        ndefMessage = newMessage;
    }

    @Override
    public byte[] processCommandApdu(byte[] commandApdu, Bundle extras) {
        // Respond with UUID and NDEF message
        if (isSelectApdu(commandApdu)) {
            String response = uuid + "|" + ndefMessage; // Format your response as needed
            return response.getBytes();
        }
        return new byte[0];
    }

    @Override
    public void onDeactivated(int reason) {
        // Handle deactivation
    }

    private boolean isSelectApdu(byte[] commandApdu) {
        return commandApdu.length >= 4 &&
                commandApdu[0] == 0x00 &&
                commandApdu[1] == (byte) 0xA4 &&
                commandApdu[2] == 0x04 &&
                commandApdu[3] == 0x00;
    }
}
