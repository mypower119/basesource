import 'dart:async';

import 'package:base_constructor/data/local/dao/staff_dao.dart';
import 'package:base_constructor/data/local/entity/staff_db.dart';
import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [
  StaffDB,
])
abstract class AppDatabase extends FloorDatabase {
  StaffDao get staffDao;
}
