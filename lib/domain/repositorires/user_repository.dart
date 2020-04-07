import 'package:base_constructor/data/local/entity/staff_db.dart';

abstract class UserRepository {
  @override
  Future<void> deleteAll();

  @override
  Future<List<StaffDB>> getAllStaff();

  @override
  Future<StaffDB> getStaff(int id);

  @override
  Future<void> insertStaff(StaffDB item);

  @override
  Future<void> insertStaffs(List<StaffDB> items);


}