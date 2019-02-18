package com.yothon.flutterapp;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.os.Bundle;
import android.text.TextUtils;
import android.widget.Toast;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    public static final String CANNEL = "com.yothon.flutterapp/android";
    public static final String NET_CHANGE = "com.yothon.flutterapp/netChanged";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        new MethodChannel(getFlutterView(), CANNEL).setMethodCallHandler((methodCall, result) -> {
            System.out.println(methodCall.method);
            if (methodCall.method.equals("showToast")) {
                if (methodCall.hasArgument("msg") && !TextUtils.isEmpty(methodCall.argument("msg")
                        .toString())) {
                    Toast.makeText(MainActivity.this, methodCall.argument("msg")
                            .toString(), Toast.LENGTH_LONG).show();
                } else {
                    Toast.makeText(MainActivity.this, "Toast content is null", Toast.LENGTH_LONG)
                            .show();
                }
            } else if (methodCall.method.equals("netConnection")) {
                boolean networkConnected = NetUtil.isNetworkConnected(MainActivity.this);
                result.success(networkConnected);
            }
        });

        new EventChannel(getFlutterView(),NET_CHANGE).setStreamHandler(new EventChannel.StreamHandler() {
            private BroadcastReceiver broadcastReceiver;

            @Override
            public void onListen(Object o, EventChannel.EventSink eventSink) {
                broadcastReceiver = broadcastReceiver(eventSink);
                registerReceiver(broadcastReceiver,new IntentFilter(ConnectivityManager.CONNECTIVITY_ACTION));
            }

            @Override
            public void onCancel(Object o) {
                unregisterReceiver(broadcastReceiver);
                broadcastReceiver = null;
            }
        });
    }

    private BroadcastReceiver broadcastReceiver(final EventChannel.EventSink events){
        return new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {
                boolean networkConnected = NetUtil.isNetworkConnected(MainActivity.this);
                events.success(networkConnected?"网络可用":"网络不可用");
            }
        };
    }
}
