package io.flutter.plugins

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry

/**
 * @author jv.lee
 * @date 2020-01-16
 * @description Flutter与native 电量数值获取插件
 */
class BatteryPlugin constructor(context: Context) : MethodChannel.MethodCallHandler {
    private var context: Context? = null

    init {
        this.context = context
    }

    object BatteryStatic {
        private const val batteryPluginName = "simple.flutter.io/battery"

        fun registerWith(registrar: PluginRegistry.Registrar) {
            val channel = MethodChannel(registrar.messenger(), batteryPluginName)
            channel.setMethodCallHandler(BatteryPlugin(registrar.context()))
        }
    }

    override fun onMethodCall(call: MethodCall, channel: MethodChannel.Result) {
        if (call.method == "getBatteryLevel") {
            val batteryLevel = getBatteryLevel()
            if (batteryLevel != -1) {
                channel.success(batteryLevel)
            } else {
                channel.error("UNAVAILABLE", "Battery level not available.", null)
            }
        } else {
            channel.notImplemented()
        }
    }

    private fun getBatteryLevel(): Int {
        val batteryLevel: Int
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            val batteryManager = context?.getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(context).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
            batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }

        return batteryLevel
    }

}
