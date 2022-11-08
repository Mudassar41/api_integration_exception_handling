import 'package:api_demo_http/models/user.dart';
import 'package:api_demo_http/services/api_base_service.dart';
import 'package:api_demo_http/utils/enums.dart';

class JobsService extends ApiBaseService {
  Future<List<User>> fetchUsers() async {
    final response = await apiResponse(url: '/users', mathod: METHOD.GET);
    var result = response;

    print(result);
    //User user = User.fromJson(result);
    List<User> userList =
        result.map<User>((json) => User.fromJson(json)).toList();
    return userList;
  }
}
