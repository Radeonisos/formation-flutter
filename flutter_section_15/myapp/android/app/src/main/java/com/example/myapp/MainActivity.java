package com.example.myapp;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import android.content.*;
import android.os.*;


public class MainActivity extends FlutterActivity {

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    new MethodChannel(getFlutterView(),  "course.flutter.dev/battery").setMethodCallHandler(
            new MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                if(methodCall.method.equals("getBatteryLevel")) {
                    int bat = getBatteryLevel();
                    if (bat != -1){
                        result.success(bat);
                    } else {
                        result.error("UNAVAILABLE","PAS de battery",null);
                    }
                } else {
                    result.notImplemented();
                }
              }
            }
    );
  }

  private int getBatteryLevel() {
      int batteryLevel = -1;

      if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP){
          BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
          batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
      } else {
          Intent intent = new ContextWrapper(getApplicationContext()).registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
          batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)*100) / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
      }
      return batteryLevel;
  }

}
