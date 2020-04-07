class ItemModel{

  String _id;
  String _name;


  ItemModel(this._name, this._id);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

}