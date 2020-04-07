import 'package:base_constructor/data/local/entity/staff_db.dart';
import 'package:floor/floor.dart';

@dao
abstract class StaffDao {

  @Query('SELECT * FROM StaffDB')
  Future<List<StaffDB>> getAllStaff();

  @Query('SELECT * FROM StaffDB WHERE id = :id')
  Future<StaffDB> getStaff(int id);

  @Insert(onConflict: OnConflictStrategy.REPLACE)
  Future<void> insertStaff(StaffDB item);

  @Insert(onConflict: OnConflictStrategy.REPLACE)
  Future<void> insertStaffs(List<StaffDB> items);

  @Query('DELETE FROM StaffDB')
  Future<void> deleteAll();

}