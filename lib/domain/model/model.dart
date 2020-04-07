import 'package:base_constructor/data/local/entity/staff_db.dart';

class Model{

  String _id;
  String _name;



  Model(this._name, this._id);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

}