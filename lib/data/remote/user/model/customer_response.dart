// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:base_constructor/utils/convert_utils.dart';


CustomerResponse fromJson(String str) => CustomerResponse.fromJson(json.decode(str));

String toJson(CustomerResponse data) => json.encode(data.toJson());

class CustomerResponse {
  int status;
  int errorCode;
  List<CustomerServer> data;
  String msg;

  CustomerResponse({
    this.status,
    this.errorCode,
    this.data,
    this.msg,
  });

  factory CustomerResponse.fromJson(Map<String, dynamic> json) => CustomerResponse(
    status: json["status"],
    errorCode: json["error_code"],
    data: List<CustomerServer>.from(json["data"].map((x) => CustomerServer.fromJson(x))),
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error_code": errorCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "msg": msg,
  };
}

class CustomerServer {
  int id;
  int shopId;
  String name;
  String image;
  int groupid;
  String address;
  String tel;
  String notes;
  int invalid;
  String taxCode;
  String email;
  String website;
  int customerFlg;
  int supplierFlg;
  int debt;
  int priceplan;
  int allowOrderFlg;
  String regdate;
  String birthday;
  String barcode;
  int feeShip;
  int pricePolicyId;
  String customerSex;
  String paymentMethod;
  String extraInfo1;
  String extraInfo2;
  int orderCount;
  int pricegroupUpdateFlg;
  String membercardType;
  int totalEarnPoint;
  double totalBuyAmount;
  double totalRemainAmount;
  String rankcardStartDate;
  String cardrankExpireDate;
  int status;
  String password;
  String emailPassword;
  String otpCode;
  int otpVerifyFlg;
  String token;
  int accessAccountId;
  String otpExpireDate;
  String groupName;

  CustomerServer({
    this.id,
    this.shopId,
    this.name,
    this.image,
    this.groupid,
    this.address,
    this.tel,
    this.notes,
    this.invalid,
    this.taxCode,
    this.email,
    this.website,
    this.customerFlg,
    this.supplierFlg,
    this.debt,
    this.priceplan,
    this.allowOrderFlg,
    this.regdate,
    this.birthday,
    this.barcode,
    this.feeShip,
    this.pricePolicyId,
    this.customerSex,
    this.paymentMethod,
    this.extraInfo1,
    this.extraInfo2,
    this.orderCount,
    this.pricegroupUpdateFlg,
    this.membercardType,
    this.totalEarnPoint,
    this.totalBuyAmount,
    this.totalRemainAmount,
    this.rankcardStartDate,
    this.cardrankExpireDate,
    this.status,
    this.password,
    this.emailPassword,
    this.otpCode,
    this.otpVerifyFlg,
    this.token,
    this.accessAccountId,
    this.otpExpireDate,
    this.groupName,
  });

  factory CustomerServer.fromJson(Map<String, dynamic> json) => CustomerServer(
    id: json["id"],
    shopId: json["shop_id"],
    name: json["name"],
    image: ConvertUtils().getString(json["image"]),
    groupid: json["groupid"],
    address: ConvertUtils().getString(json["address"]),
    tel: ConvertUtils().getString(json["tel"]),
    notes: ConvertUtils().getString(json["notes"]),
    invalid: json["invalid"],
    taxCode: ConvertUtils().getString(json["tax_code"]),
    email: ConvertUtils().getString(json["email"]),
    website: ConvertUtils().getString(json["website"]),
    customerFlg: json["customer_flg"],
    supplierFlg: json["supplier_flg"],
    debt: json["debt"],
    priceplan: json["priceplan"],
    allowOrderFlg: json["allow_order_flg"],
    regdate: json["regdate"],
    birthday: ConvertUtils().getString(json["birthday"]),
    barcode: ConvertUtils().getString(json["barcode"]),
    feeShip: json["fee_ship"],
    pricePolicyId: json["price_policy_id"],
    customerSex: ConvertUtils().getString(json["customer_sex"]),
    paymentMethod: ConvertUtils().getString(json["payment_method"]),
    extraInfo1: ConvertUtils().getString(json["extra_info1"]),
    extraInfo2: ConvertUtils().getString(json["extra_info2"]),
    orderCount: json["order_count"],
    pricegroupUpdateFlg: json["pricegroup_update_flg"],
    membercardType: ConvertUtils().getString(json["membercard_type"]),
    totalEarnPoint: ConvertUtils().getInt(json["total_earn_point"]),
    totalBuyAmount: ConvertUtils().getDouble(json["total_buy_amount"]),
    totalRemainAmount: ConvertUtils().getDouble(json["total_remain_amount"]),
    rankcardStartDate:ConvertUtils().getString(json["rankcard_start_date"]),
    cardrankExpireDate: ConvertUtils().getString(json["cardrank_expire_date"]),
    status: json["status"],
    password: ConvertUtils().getString(json["password"]),
    emailPassword: ConvertUtils().getString(json["email_password"]),
    otpCode: ConvertUtils().getString(json["otp_code"]),
    otpVerifyFlg: json["otp_verify_flg"],
    token: ConvertUtils().getString(json["token"]),
    accessAccountId: json["access_account_id"],
    otpExpireDate: ConvertUtils().getString(json["otp_expire_date"]),
    groupName: json["group_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shop_id": shopId,
    "name": name,
    "image": image,
    "groupid": groupid,
    "address": address,
    "tel": tel,
    "notes": notes,
    "invalid": invalid,
    "tax_code": taxCode,
    "email": email,
    "website": website,
    "customer_flg": customerFlg,
    "supplier_flg": supplierFlg,
    "debt": debt,
    "priceplan": priceplan,
    "allow_order_flg": allowOrderFlg,
    "regdate": regdate,
    "birthday": birthday,
    "barcode": barcode,
    "fee_ship": feeShip,
    "price_policy_id": pricePolicyId,
    "customer_sex": customerSex,
    "payment_method": paymentMethod,
    "extra_info1": extraInfo1,
    "extra_info2": extraInfo2,
    "order_count": orderCount,
    "pricegroup_update_flg": pricegroupUpdateFlg,
    "membercard_type": membercardType,
    "total_earn_point": totalEarnPoint,
    "total_buy_amount": totalBuyAmount,
    "total_remain_amount": totalRemainAmount,
    "rankcard_start_date": rankcardStartDate,
    "cardrank_expire_date": cardrankExpireDate,
    "status": status,
    "password": password,
    "email_password": emailPassword,
    "otp_code": otpCode,
    "otp_verify_flg": otpVerifyFlg,
    "token": token,
    "access_account_id": accessAccountId,
    "otp_expire_date": otpExpireDate,
    "group_name": groupName,
  };
}
