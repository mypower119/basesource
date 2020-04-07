import 'dart:math';
import 'dart:typed_data';
import 'package:base_constructor/app/base_state/life_cycle.dart';
import 'package:base_constructor/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';

/// Provides common utilities and functions to build ui and handle app lifecycle
abstract class BaseState<T extends StatefulWidget> extends LifeCycleState<T> {
  Size screenSize;

  Size designScreenSize;

  bool isTablet;

  bool isLandScape;

  /// Called when the app is temporarily closed or a new route is pushed
  @override
  void onPause() {

  }

  /// Called when users return to the app or the adjacent route of this widget is popped
  @override
  void onResume() {

  }

  /// Called onnce when this state's widget finished building
  @override
  void onFirstFrame() {

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var query = MediaQuery.of(context);

    screenSize = query.size;
    designScreenSize = getDesignSize() ?? Size(375.0, 667.0);

    // check landscape
    isLandScape = query.orientation == Orientation.landscape;

    // check tablet device
    var diagonal = sqrt(
        (screenSize.width * screenSize.width) +
            (screenSize.height * screenSize.height)
    );
//    print(
//      'size: ${screenSize.width}x${screenSize.height}\n'
//      'pixelRatio: ${query.devicePixelRatio}\n'
//      'pixels: ${screenSize.width * query.devicePixelRatio}x${screenSize.height * query.devicePixelRatio}\n'
//      'diagonal: $diagonal'
//    );
    isTablet = diagonal > 1100.0;
  }

  /// Override to define new design size for ui
  Size getDesignSize() => null;

  String get packageName => null;

  /// Scale the provided 'designSize' proportionally to the screen's width
  double scaleWidth(num designSize, {bool preventScaleDown = false}) {
    if (designSize == null) return null;
    final scaledSize = screenSize.width * designSize / designScreenSize.width;

    if (preventScaleDown && scaledSize < designSize) {
      return designSize?.toDouble();
    }

    return scaledSize;
  }

  /// Scale the provided 'designSize' proportionally to the screen's height
  double scaleHeight(num designSize, {bool preventScaleDown = false}) {
    if (designSize == null) return null;
    final scaledSize = screenSize.height * designSize / designScreenSize.height;

    if (preventScaleDown && scaledSize < designSize) {
      return designSize?.toDouble();
    }

    return scaledSize;
  }

  Widget buildAssetsImage(String path,
      {BoxFit fit = BoxFit.contain, num width, num height, String package}) {
    return Image.asset(path,
        height: height?.toDouble(),
        width: width?.toDouble(),
        package: package ?? packageName,
        fit: fit);
  }

  DecorationImage buildDecorationImage(String path,
      {BoxFit fit = BoxFit.contain, ColorFilter filter, String package}) {
    return DecorationImage(
        image: AssetImage(path, package: package ?? packageName),
        fit: fit,
        colorFilter: filter);
  }

  Widget buildRemoteImage(
    String url, {
    num height,
    num width,
    BoxFit fit = BoxFit.contain,
    double scale = 1.0,
    Map<String, String> header,
    bool useDiskCache = false,
    Function loadedCallback,
    Function loadFailedCallback,
    Uint8List fallbackImage,
  }) {

    if (isEmpty(url)) return Container();

    return Image(
      height: height?.toDouble(),
      width: width?.toDouble(),
      fit: fit,
      image: AdvancedNetworkImage(
        url,
        scale: scale,
        fallbackImage: fallbackImage,
        header: header,
        loadedCallback: loadedCallback,
        loadFailedCallback: loadFailedCallback,
        useDiskCache: useDiskCache,
        timeoutDuration: Duration(seconds: 30),
        retryLimit: 10,
        retryDuration: Duration(milliseconds: 2800),
      ),
    );
  }

  ImageProvider buildRemoteImageProvider(
    String url, {
    num height,
    num width,
    BoxFit fit = BoxFit.contain,
    double scale = 1.0,
    Map<String, String> header,
    bool useDiskCache = false,
    Function loadedCallback,
    Function loadFailedCallback,
    Uint8List fallbackImage,
  }) {
      return AdvancedNetworkImage(
        url,
        scale: scale,
        fallbackImage: fallbackImage,
        header: header,
        loadedCallback: loadedCallback,
        loadFailedCallback: loadFailedCallback,
        useDiskCache: useDiskCache,
        timeoutDuration: Duration(seconds: 30),
        retryLimit: 10,
        retryDuration: Duration(milliseconds: 2800),
      );
  }
}


// iPhone 6S
// |_ [portrait]
//    |_ size: 375.0x667.0, pixelRatio: 2.0, pixels: 750.0x1334.0
//       |_ diagonal: 765.1888655750291
// |_ [horizontal]
//    |_ size: 667.0x375.0, pixelRatio: 2.0, pixels: 1334.0x750.0
//       |_ diagonal: 765.1888655750291

// iPhone X
// |_ [portrait]
//    |_ size: 375.0x812.0, pixelRatio: 3.0, pixels: 1125.0x2436.0
//       |_ diagonal: 894.4098613052072
// |_ [horizontal]
//    |_ size: 812.0x375.0, pixelRatio: 3.0, pixels: 2436.0x1125.0
//       |_ diagonal: 894.4098613052072

// iPhone XS Max
// |_ [portrait]
//    |_ size: 414.0x896.0, pixelRatio: 3.0, pixels: 1242.0x2688.0
//       |_ diagonal: 987.0217829409845
// |_ [horizontal]
//    |_ size: 896.0x414.0, pixelRatio: 3.0, pixels: 2688.0x1242.0
//       |_ diagonal: 987.0217829409845

// iPad Pro (9.7-inch)
// |_ [portrait]
//    |_ size: 768.0x1024.0, pixelRatio: 2.0, pixels: 1536.0x2048.0
//       |_ diagonal: 1280.0
// |_ [horizontal]
//    |_ size: 1024.0x768.0, pixelRatio: 2.0, pixels: 2048.0x1536.0
//       |_ diagonal: 1280.0

// iPad Pro (10.5-inch)
// |_ [portrait]
//    |_ size: 834.0x1112.0, pixelRatio: 2.0, pixels: 1668.0x2224.0
//       |_ diagonal: 1390.0
// |_ [horizontal]
//    |_ size: 1112.0x834.0, pixelRatio: 2.0, pixels: 2224.0x1668.0
//       |_ diagonal: 1390.0

// iPad Pro (12.9-inch)
// |_ [portrait]
//    |_ size: 1024.0x1366.0, pixelRatio: 2.0, pixels: 2048.0x2732.0
//       |_ diagonal: 1707.2000468603555
// |_ [horizontal]
//    |_ size: 1366.0x1024.0, pixelRatio: 2.0, pixels: 2732.0x2048.0
//       |_ diagonal: 1707.2000468603555