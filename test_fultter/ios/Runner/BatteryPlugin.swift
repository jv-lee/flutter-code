//
//  BatteryPlugin.swift
//  Runner
//
//  Created by jv.lee on 2020/1/16.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Foundation

@objc class BatteryPlugin :NSObject{
    init(controller:FlutterViewController) {
        super.init();
        self.initPlugin(controller: controller)
    }
    
    private func initPlugin(controller:FlutterViewController){
        let batteryChannel = FlutterMethodChannel.init(name: "simple.flutter.io/battery", binaryMessenger: controller.binaryMessenger);
        batteryChannel.setMethodCallHandler({
          (call: FlutterMethodCall, result: FlutterResult) -> Void in
          if ("getBatteryLevel" == call.method) {
            self.receiveBatteryLevel(result: result);
          } else {
            result(FlutterMethodNotImplemented);
          }
        });
    }
    
    private func receiveBatteryLevel(result: FlutterResult) {
      let device = UIDevice.current;
      device.isBatteryMonitoringEnabled = true;
      if (device.batteryState == UIDeviceBatteryState.unknown) {
        result(FlutterError.init(code: "UNAVAILABLE",
                                 message: "电池信息不可用",
                                 details: nil));
      } else {
        result(Int(device.batteryLevel * 100));
      }
    }
}
