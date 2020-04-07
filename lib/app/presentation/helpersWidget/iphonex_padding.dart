import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

// workaround for iPhone X which draws navigation in the bottom of the screen.
// Wait until https://github.com/flutter/flutter/issues/12099 is fixed
class IPhoneXPadding extends Container {
  final Widget child;

  IPhoneXPadding({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    if (!_isIPhoneX(mediaQueryData)) {
      // fallback for all non iPhone X
      return child;
    }

    var homeIndicatorHeight = mediaQueryData.orientation == Orientation.portrait ? 10.0 : 10.0;
//    var homeIndicatorHeight = mediaQueryData.orientation == Orientation.portrait ? 0.0 : 0.0;

//    var outer = mediaQueryData.padding;
//    var bottom = outer.bottom + homeIndicatorHeight;
//    return new MediaQuery(data: new MediaQueryData(
//        padding: new EdgeInsets.fromLTRB(
//            outer.left, outer.top, outer.right, bottom)),
//        child: child
//    );
    return Padding(
      padding: EdgeInsets.only(bottom: homeIndicatorHeight),
      child: child,
    );
  }

  bool _isIPhoneX(MediaQueryData mediaQuery) {
    if (Platform.isIOS) {
      var size = mediaQuery.size;
      if (size.height == 812.0 || size.width == 812.0
          || size.height == 896.0 || size.width == 896.0
          || size.height >= 1024.0 || size.width >= 1024.0) {// ipad
        return true;
      }
    }
    return false;
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