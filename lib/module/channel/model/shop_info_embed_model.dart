import 'dart:convert';

class ShopInfoEmbedModel{
  String token;
  String shopId;
  String shopName;
  String userId;
  String userName;
  String fullName;
  String jsonRoles;
  String jsonChain;
  String shopType;
  String showInPriceExportTransflg;
  String lang;
  String userRoleId;
  String dateExpired;

  ShopInfoEmbedModel();

  Map<String, dynamic> toJson() => {
    'token': token,
    'shopId': shopId,
    "shopName": shopName,
    "userId": userId,
    "userName": userName,
    "fullName": fullName,
    "jsonRoles": jsonRoles,
    "jsonChain": jsonChain,
    "showInPriceExportTransflg": showInPriceExportTransflg,
    "lang":lang,
    "userRoleId":userRoleId,
    "dateExpired":dateExpired,
    "shopType":shopType,
  };

  factory ShopInfoEmbedModel.fromJson(Map<String, dynamic> json){
    ShopInfoEmbedModel shopInfo = ShopInfoEmbedModel();
    shopInfo.token = json["token"];
    shopInfo.shopId = json["shopId"];
    shopInfo.shopName = json["shopName"];
    shopInfo.userId = json["userId"];
    shopInfo.userName = json["userName"];
    shopInfo.fullName = json["fullName"];
    shopInfo.jsonRoles = jsonEncode(json["jsonRoles"]);
    shopInfo.jsonChain = jsonEncode(json["jsonChain"]);
    shopInfo.showInPriceExportTransflg = jsonEncode(json["showInPriceExportTransflg"]);
    shopInfo.lang = json["lang"];
    shopInfo.userRoleId = json["userRoleId"];
    shopInfo.dateExpired = json["dateExpired"];
    shopInfo.shopType = json["shopType"];
    return shopInfo;
  }
}