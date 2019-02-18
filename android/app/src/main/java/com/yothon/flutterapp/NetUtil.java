package com.yothon.flutterapp;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;

/**
 * Created by yothon on 2019/2/12.
 */

public class NetUtil {
    /**
     * 判断网络是否连接
     *
     * @param activity Activity
     * @return boolean 网络连接状态
     */
    public static boolean isNetworkConnected(Activity activity){
        boolean falg = false;
        ConnectivityManager mConnectivityManager = (ConnectivityManager) activity.getApplicationContext().getSystemService(Context.CONNECTIVITY_SERVICE);
        if (mConnectivityManager == null){
            return falg;
        }
         NetworkInfo[] arrayOfNetworkInfo = mConnectivityManager.getAllNetworkInfo();
        if (arrayOfNetworkInfo != null){
            for (int j = 0; j < arrayOfNetworkInfo.length; j++){
                if (arrayOfNetworkInfo[j].getState() == NetworkInfo.State.CONNECTED){
                    falg = true;
                    break;
                }
            }
        }
        return falg;
    }
}
