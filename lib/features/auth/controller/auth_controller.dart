import 'package:appwrite/models.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twttr/apis/auth_api.dart';
import 'package:twttr/apis/user_api.dart';
import 'package:twttr/features/feed/pages/home_page.dart';
import 'package:twttr/models/app_user.dart';

import '../../../utils/functions.dart';
import '../views/pages/login_page.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    authApi: ref.watch(authApiProvider),
    userApi: ref.watch(userApiProvider),
  );
});

final currentAccountProvider = FutureProvider((ref) async {
  return ref.watch(authControllerProvider.notifier).getCurrentAccount();
});

final userDataProvider =
    FutureProvider.family<AppUser, String>((ref, uid) async {
  debugPrint('=======userDataProvider======> UID: $uid <============');
  return ref.watch(authControllerProvider.notifier).getUserData(uid);
});

final currentUserDataProvider = FutureProvider((ref) async {
  final uid = ref.watch(currentAccountProvider).value!.$id;
  debugPrint('=======currentUserDataProvider======> UID: $uid <============');
  return ref.watch(userDataProvider(uid)).value;
});

class AuthController extends StateNotifier<bool> {
  AuthController({required AuthApi authApi, required UserApi userApi})
      : _authApi = authApi,
        _userApi = userApi,
        super(false);

  final AuthApi _authApi;
  final UserApi _userApi;

  Future<User?> getCurrentAccount() async => await _authApi.getCurrentAccount();

  void signUp({required String email, required String password}) async {
    state = true;
    final res = await _authApi.signUp(email: email, password: password);
    res.fold(
      (l) => showSnackBar(l.message),
      (user) async {
        final appUser = AppUser(
            email: email,
            name: getNameFromEmail(email),
            followers: const [],
            following: const [],
            photoUrl:
                'https://cdn.pixabay.com/photo/2020/06/30/10/23/icon-5355896_640.png',
            bannerUrl: '',
            uid: user.$id,
            bio: '',
            isTwttrBlue: false);
        final res = await _userApi.saveUserData(appUser);
        res.fold((l) => showSnackBar(l.message), (r) {
          showSnackBar('Account created successfully, please login');
          navigator.pushReplacementNamed(LoginPage.routeName);
        });
      },
    );
    state = false;
  }

  void login({required String email, required String password}) async {
    state = true;
    final res = await _authApi.login(email: email, password: password);
    res.fold((l) => showSnackBar(l.message),
        (r) => navigator.pushReplacementNamed(HomePage.routeName));
    state = false;
  }

  Future<AppUser> getUserData(String uid) async {
    debugPrint('=======getUserData======> UID: $uid <============');
    final res = await _userApi.getUserData(uid);
    debugPrint('=======getUserData======> Res: $res <============');
    return AppUser.fromMap(res.data);
  }
}
