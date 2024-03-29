import 'package:http/http.dart';
import '../../../../base/base_config/base_config.dart';
import '../../../../domain/model/request/login/login_request.dart';

class LoginRemoteService {
  Client client = Client();

  Future<Response> postLogin(LoginRequest request) async {
    final url = Uri.https(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.LOGIN,
    );

    print("URL : ${url.toString()}");
    print('REQUEST : ${request.toJson()}');

    return client.post(url, body: request.toJson());
  }
}
