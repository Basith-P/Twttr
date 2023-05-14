import 'package:appwrite/models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twttr/apis/auth_api.dart';
import 'package:twttr/features/home/home_page.dart';

import '../../../utils/global.dart';
import '../views/pages/login_page.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(ref.read(authApiProvider));
});

final currentAccountProvider = FutureProvider((ref) async {
  return ref.watch(authControllerProvider.notifier).getCurrentAccount();
});

class AuthController extends StateNotifier<bool> {
  AuthController(this._authApi) : super(false);

  final AuthApi _authApi;

  Future<User?> getCurrentAccount() async => await _authApi.getCurrentAccount();

  void signUp({required String email, required String password}) async {
    state = true;
    final res = await _authApi.signUp(email: email, password: password);
    res.fold((l) => showSnackBar(l.message), (r) {
      showSnackBar('Account created successfully, please login');
      navigator.pushReplacementNamed(LoginPage.routeName);
    });
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
