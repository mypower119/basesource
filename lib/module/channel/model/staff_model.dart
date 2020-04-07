
class StaffModel {
  String staffServerId;
  String userName;
  String fullName;
  StaffModel.newStaff() {}

  Map<String, dynamic> toJson() => {
    'staffServerId': staffServerId,
    'fullname': fullName,
    "username": userName
  };

  factory StaffModel.fromJson(Map<String, dynamic> json){
    StaffModel staff = new StaffModel.newStaff();
    staff.staffServerId = json["staffServerId"]??"";
    staff.userName = json["username"]??"";
    staff.fullName = json["fullname"]??"";
    return staff;
  }
}