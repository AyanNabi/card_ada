package com.example.card_ada;

import io.flutter.embedding.android.FlutterActivity;
import android.nfc.NfcAdapter;
import android.nfc.cardemulation.CardEmulation;
import androidx.annotation.NonNull;
import android.nfc.cardemulation.HostApduService;
import android.os.Bundle;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import com.example.card_ada.MyHostApduService;

public class MainActivity extends FlutterActivity {
    private NfcAdapter nfcAdapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        nfcAdapter = NfcAdapter.getDefaultAdapter(this);

        Button startNfcButton = findViewById(R.id.start_nfc_button);
        startNfcButton.setOnClickListener(v -> enableNfcReaderMode());
    }
    private void enableNfcReaderMode() {
        if (nfcAdapter != null) {
            nfcAdapter.enableReaderMode(this, tag -> {
                // Handle NFC tag detection here
                runOnUiThread(() -> {
                    // Process tag data or show UI feedback
                });
            }, NfcAdapter.FLAG_READER_NFC_A | NfcAdapter.FLAG_READER_NFC_B, null);
        }
    }
    private static final String CHANNEL = "nfc_service";
    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler((call, result) -> {
                    if (call.method.equals("startCardEmulation")) {
                        String uuid = call.argument("uuid");
                        String ndefMessage = call.argument("ndefMessage");
                        // Start HCE Service and pass the data
                        System.out.println("main activiteyem");
                        MyHostApduService.startEmulation(uuid, ndefMessage);
                        result.success(null);

                    } else {
                        result.notImplemented();
                    }
                });
    }





}
