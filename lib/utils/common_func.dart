import 'dart:math';
import 'dart:io';

class CommonFunc{
    static final CommonFunc _singleton = CommonFunc._internal();

    CommonFunc._internal();

    factory CommonFunc() {
      return _singleton;
    }

  Future<bool> checkInternetConnection() async {
    try {
      return InternetAddress.lookup('google.com').then((result){
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          return true;
        }
        return false;
      }).catchError((e){
        return false;
      });
    } catch (_) {
      return false;
    }
  }

  String generateUniqueID(){
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    return currentTime.toString() + Random().nextInt(1000).toString();
  }
}


