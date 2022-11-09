import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:flutter_ffi_example/service/generated_bindings.dart';

typedef TypeOfDayWeatherDart = Pointer<Int8> Function();

class AppCService {
  static int add(int a, int b) {
    final dyLib = Platform.isAndroid
        ? DynamicLibrary.open('libexample.so')
        : DynamicLibrary.process();
    try {
      final addSrc = CService(dyLib);
      log('ADD USNG CC');
      return addSrc.addUsingC(a, b);
    } catch (e) {
      log(e.toString());
    }

    return a + b;
  }

  static String getCStr() {
    final dyLib = Platform.isAndroid
        ? DynamicLibrary.open('libexample.so')
        : DynamicLibrary.process();
    try {
      final addSrc = CService(dyLib);
      log('GET STRING FROM CC');
      Pointer<Utf8> ptrUtf = addSrc.get_hello_from_c().cast<Utf8>();
      return ptrUtf.toDartString();
    } catch (e) {
      log(e.toString());
    }

    return 'OK';
  }
}
