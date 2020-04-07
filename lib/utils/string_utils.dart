import 'package:intl/intl.dart';

String convertToCurrency(dynamic price) {
  if(price is String){
    price = double.parse(price);
  }
  return CURRENCY_FORMAT.format(price);// + "đ";
}

String convertToThoundsand(dynamic price) {
  try {
    if (price is String) {
      price = double.parse(price);
    }
    return CURRENCY_FORMAT.format(price);
  }catch(e){
    return price;
  }
}

double getReverseValue(String value, bool isIgnore){
  if(isIgnore){
    return double.parse(value);
  }
  try{
    return  double.parse(value) * -1;
  }catch(e){
    return 0;
  }
}

String removeDecimalIfNeeded(dynamic value,{int decimal = 1}){
  if(value is String){
    try{
      value = double.parse(value);
    }catch(e){
      return value;
    }
  }
  if(value is double){
    if(value % 1 == 0){
      return value.toInt().toString();
    }
    return value.toStringAsFixed(decimal);
  }
}

bool isNotEmpty(dynamic item) {
  if (item == null) return false;
  if (item is String) {
    return item.isNotEmpty;
  }
  return false;
}

bool isEmpty(String s) {
  return !isNotEmpty(s);
}

final CURRENCY_FORMAT = new NumberFormat("#,##0", "vi_VN");

String getAssetPath(String asset) {
  return "assets/$asset";
}
