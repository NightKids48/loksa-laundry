import 'package:lestari_laundry/user/domain/model/data/login/login_data_user.dart';

class LoginData {
  String jwt;
  LoginDataUser data;

  LoginData(
    this.jwt,
    this.data,
  );
}
