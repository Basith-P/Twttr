import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twttr/utils/failure.dart';
import 'package:twttr/utils/typedefs.dart';

import '../utils/providers.dart';

final authApiProvider = Provider((ref) {
  final account = ref.watch(accountProvider);
  return AuthApi(account: account);
});

abstract class IAuthApi {
  FutureEither<User> signUp({required String email, required String password});
}

class AuthApi implements IAuthApi {
  final Account _account;

  AuthApi({required Account account}) : _account = account;

  @override
  FutureEither<User> signUp(
      {required String email, required String password}) async {
    try {
      final user = await _account.create(
          userId: ID.unique(), email: email, password: password);
      return right(user);
    } on AppwriteException catch (e, st) {
      return left(Failure(e.message ?? 'Somethine went wrong', st));
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }
}
