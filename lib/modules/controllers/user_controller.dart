import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:qwc/index.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  final _isUserLoggedIn = false.obs;
  final _currentUserInfo = UserModel().obs;
  User? _currentFirebaseUser;

  initUser() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        _isUserLoggedIn.value = true;
        _currentFirebaseUser = user;
      }
    });
  }

  // update current firebase user
  updateCurrentFirebaseUser(User user) {
    _currentFirebaseUser = user;
  }

  updateCurrentUserInfo(UserModel userModel) {
    _currentUserInfo.value = userModel;
  }

  bool get isUserLoggedIn => _isUserLoggedIn.value;
  UserModel get currentUserInfo => _currentUserInfo.value;
  User? get currentFirebaseUser => _currentFirebaseUser;
}
