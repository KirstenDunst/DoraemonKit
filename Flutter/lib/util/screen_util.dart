import 'dart:ui' as ui show window;

import 'package:flutter/material.dart';

class ScreenUtil {
  ScreenUtil._privateConstructor() {
    final mediaQuery = MediaQueryData.fromView(ui.window);
    if (_mediaQueryData != mediaQuery) {
      _mediaQueryData = mediaQuery;
      _screenWidth = mediaQuery.size.width;
      _screenHeight = mediaQuery.size.height;
      _screenDensity = mediaQuery.devicePixelRatio;
      _statusBarHeight = mediaQuery.padding.top;
      _bottomBarHeight = mediaQuery.padding.bottom;
      _appBarHeight = kToolbarHeight;
    }
  }

  static final ScreenUtil _instance = ScreenUtil._privateConstructor();
  static ScreenUtil get instance => _instance;

  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  double _screenDensity = 0.0;
  double _statusBarHeight = 0.0;
  double _bottomBarHeight = 0.0;
  double _appBarHeight = 0.0;
  MediaQueryData? _mediaQueryData;

  Offset? _screenCenter;
  Offset get screenCenter {
    if (_screenCenter == null) {
      final size = _mediaQueryData!.size;
      final width = size.width;
      final height = size.height;
      final x = width / 2;
      final y = height / 2;
      _screenCenter = Offset(x, y);
    }
    return _screenCenter!;
  }

  /// 屏幕的宽度
  double get screenWidth => _screenWidth;

  /// 屏幕的高度
  double get screenHeight => _screenHeight;

  /// appBar的高度
  double get appBarHeight => _appBarHeight;

  /// 屏幕的像素密度
  double get screenDensity => _screenDensity;

  /// 状态栏的高度
  double get statusBarHeight => _statusBarHeight;

  /// bottom bar的高度
  double get bottomBarHeight => _bottomBarHeight;
}
