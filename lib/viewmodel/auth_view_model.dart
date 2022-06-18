import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/repositroy/auth_repositry.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRespository();
  bool _loading = false;
  bool get Loading => _loading;
  SetLaoding(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;
  SetSignUpLaoding(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    SetLaoding(true);
    _myRepo.loginApi(data).then(
      (value) {
        SetLaoding(false);
        Utils.flushBarErrorMessage('Login Successfuly', context);
        Navigator.pushNamed(context, RoutesName.home);
        if (kDebugMode) {
          print(value);
        }
      },
    ).onError(
      (error, stackTrace) {
        print(error.toString());
        Utils.flushBarErrorMessage(error.toString(), context);
      },
    );
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    SetSignUpLaoding(true);
    _myRepo.signUpApi(data).then(
      (value) {
        SetSignUpLaoding(false);
        Utils.flushBarErrorMessage('SignUp Successfuly', context);
        Navigator.pushNamed(context, RoutesName.home);
        if (kDebugMode) {
          print(value);
        }
      },
    ).onError(
      (error, stackTrace) {
        print(error.toString());
        Utils.flushBarErrorMessage(error.toString(), context);
      },
    );
  }
}
