
import 'package:floor/floor.dart';

@entity
class StaffDB {

  @primaryKey
  int id;
  int shopId;
  String username;
  String email;
  String fullName;
  String phone;
  String address;
  String orderpass;
  int role;
  int roleShop;
  String langcode;
  String timework;
  String token;
  int rolePermissionId;
  String rolePermissionName;
  int accountGroupId;
  String accountGroupName;
  String commissionId;
  int customerSupplierGroupId;
  int isAgencyAccount;

  StaffDB({
    this.id,
    this.shopId,
    this.username,
    this.email,
    this.fullName,
    this.phone,
    this.address,
    this.orderpass,
    this.role,
    this.roleShop,
    this.langcode,
    this.timework,
    this.token,
    this.rolePermissionId,
    this.rolePermissionName,
    this.accountGroupId,
    this.accountGroupName,
    this.commissionId,
    this.customerSupplierGroupId,
    this.isAgencyAccount,
  });

}
