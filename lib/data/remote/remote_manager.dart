import 'package:base_constructor/data/remote/user/customer_service.dart';

class RemoteManager {

  static RemoteManager _instance;
  CustomerService _customerService;

  RemoteManager._internal();

  factory RemoteManager() {
    return _instance == null ? RemoteManager._internal() : _instance;
  }

  static CustomerService get customerService => CustomerService();
}