import 'package:base_constructor/data/exception/exception.dart';
import 'package:base_constructor/data/remote/base_service.dart';

import 'model/customer_response.dart';

class CustomerService extends BaseService{

  Future<List<CustomerServer>> getAllCustomer() async {

    FormData formData = FormData.fromMap({
      'status':'1',
    });

    var responseJson = await dio.post(CUSTOMER_PATH, data: formData);
    CustomerResponse response;
    try {
      response = CustomerResponse.fromJson(responseJson.data);
    } catch(e) {
      throw CustomException(1123, 'Lỗi parse dữ liệu');
    }
    if(responseSuccess(responseJson)){
      return response.data??List();
    } else {
      throw CustomException(1123, 'error');
    }
  }
}