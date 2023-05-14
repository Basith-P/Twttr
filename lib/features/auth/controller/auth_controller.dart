import 'package:appwrite/models.dart';
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
      (r) async {
        final appUser = AppUser(
            email: email,
            name: getNameFromEmail(email),
            followers: const [],
            following: const [],
            photoUrl: '',
            bannerUrl: '',
            uid: '',
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
}
