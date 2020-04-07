import 'package:base_constructor/data/local/dao/staff_dao.dart';
import 'package:floor/floor.dart';
import 'database.dart';

class DBManager {
  static DBManager _instance;

  DBManager._internal();

  factory DBManager() {
    return _instance == null ? DBManager._internal() : _instance;
  }

  AppDatabase _database;

  StaffDao _staffDao;

  // Khởi tạo trước khi start app
  Future initDatabase() async {
    _database = await $FloorAppDatabase
        .databaseBuilder('app_database.db')
        .addMigrations([])
        .build();

    initDao();
  }

  initDao() {
    _staffDao = _database.staffDao;
  }

  final migration1to2 = Migration(1, 2, (database) {
    print("UPGRADE DATABASE VERSION 2");
    database.execute('ALTER TABLE Product ADD COLUMN foodThumbnailLocal TEXT');
    database.execute('UPDATE Product SET foodThumbnailLocal = foodThumbnail');
    database.execute('UPDATE Product  SET foodThumbnail = "" ');
  });

  Future<StaffDao> getStaffDao() async {
    if(_staffDao == null){
      await initDatabase();
    }
    return _staffDao;
  }

}
