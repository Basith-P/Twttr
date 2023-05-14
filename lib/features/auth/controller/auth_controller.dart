import 'package:flutter/foundation.dart' show debugPrint;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twttr/apis/auth_api.dart';

import '../../../utils/global.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(ref.read(authApiProvider));
});

class AuthController extends StateNotifier<bool> {
  AuthController(this._authApi) : super(false);

  final AuthApi _authApi;

  void signUp({required String email, required String password}) async {
    state = true;
    final res = await _authApi.signUp(email: email, password: password);
    state = false;
    res.fold((l) => showSnackBar(l.message), (r) => debugPrint(r.toString()));
  }

  void login({required String email, required String password}) async {
    state = true;
    final res = await _authApi.login(email: email, password: password);
    state = false;
    res.fold((l) => showSnackBar(l.message), (r) => debugPrint(r.toString()));
  }
}
