package com.example.androidapplication

import android.app.Application
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MyApplication : Application() {
    lateinit var flutterEngine: FlutterEngine

    companion object {
        lateinit var methodChannel: MethodChannel
    }

    override fun onCreate() {
        super.onCreate()

        flutterEngine = FlutterEngine(this)
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        methodChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "dart_multi_platform"
        )
    }
}