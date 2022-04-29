package com.example.app_with_module;


import android.os.Bundle;
import androidx.annotation.NonNull;
import java.util.HashMap;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

//TODO: Classe para tratamento do envio de dados para o Flutter
public class MyFlutterActivity extends FlutterActivity {
    private static final String CHANNEL = "samples.flutter.io/dados";

    String title = "";
    HashMap<String, String> modelTeste;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Bundle extras = getIntent().getExtras();

        title = extras.getString("title");
        modelTeste = (HashMap<String, String>) extras.getSerializable("model");
    }


    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler(((methodCall, result) -> {
            switch (methodCall.method) {
                case "getBatteryLevel":

                    result.success("batteryLevel"); // It returns string "batteryLevel".

                    break;
                case "getTitle":

                    result.success(title); // It returns string "batteryLevel".
                    break;
                case "getModel":

                    result.success(modelTeste); // It returns string "batteryLevel".
                    break;
                default:
                    result.notImplemented();
                    break;
            }
        }));
    }
}
