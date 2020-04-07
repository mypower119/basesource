import 'package:base_constructor/data/local/entity/staff_db.dart';
import 'package:base_constructor/data/repositories/user_repository_impl.dart';
import 'package:base_constructor/domain/model/model.dart';
import 'package:base_constructor/domain/repositorires/user_repository.dart';

class UserUseCase {
  static final UserUseCase _instance = UserUseCase._internal();

  factory UserUseCase() {
    return _instance;
  }

  UserRepository userRepository;

  UserUseCase._internal(){
    init();
  }

  init() {
    userRepository = UserRepositoryImpl();
  }

  UserRepository get useRepository => userRepository;

  Future<List<Model>> businessLogicFunctionTest() async {
    await userRepository.deleteAll();
    List<StaffDB> items = await userRepository.getAllStaff();
  }

  Future<bool> upddate(Model modelUi, StaffDB orderDB) async {
    await userRepository.deleteAll();
    List<StaffDB> items = await userRepository.getAllStaff();
  }
}