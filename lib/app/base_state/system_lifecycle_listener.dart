import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemLifecycleListener {
  static final instance = SystemLifecycleListener();

  final _callbacks = Set<AppLifeCycleCallback>();

  void _invokeCallbacks(AppLifeCycle lifeCycle) {
    for (AppLifeCycleCallback callback in _callbacks) {
      callback(lifeCycle);
    }
  }

  void addCallback(AppLifeCycleCallback callback) {
    _callbacks.add(callback);
  }

  void removeCallback(AppLifeCycleCallback callback) {
    _callbacks.remove(callback);
  }

  SystemLifecycleListener() {
    setHandler();
  }

  void setHandler() {
    SystemChannels.lifecycle.setMessageHandler((msg) async {
      if (msg.toString() == AppLifecycleState.resumed.toString()) {
        _invokeCallbacks(AppLifeCycle.onResume);
      } else if (msg.toString() == AppLifecycleState.paused.toString()) {
        _invokeCallbacks(AppLifeCycle.onPause);
      } else if (msg.toString() == AppLifecycleState.inactive.toString()) {
        _invokeCallbacks(AppLifeCycle.onPause);
      } else if (msg.toString() == AppLifecycleState.detached.toString()) {
        print("onSuspend");
        _invokeCallbacks(AppLifeCycle.onPause);
      }
      return '';
    });
  }
}

enum AppLifeCycle { onPause, onResume }

typedef AppLifeCycleCallback = void Function(AppLifeCycle lifeCycle);
