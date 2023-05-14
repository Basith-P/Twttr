import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twttr/constants/appwrite_constants.dart';
import 'package:twttr/models/app_user.dart';
import 'package:twttr/utils/failure.dart';
import 'package:twttr/utils/providers.dart';
import 'package:twttr/utils/typedefs.dart';

final userApiProvider =
    Provider((ref) => UserApi(ref.watch(appwriteDbProvider)));

abstract class IUserApi {
  FutureVoid saveUserData(AppUser user);
  Future<Document> getUserData(String userId);
}

class UserApi implements IUserApi {
  UserApi(this._db);

  final Databases _db;

  @override
  FutureVoid saveUserData(AppUser user) async {
    try {
      await _db.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.usersCollection,
        documentId: user.uid,
        data: user.toMap(),
      );
      return right(null);
    } on AppwriteException catch (e) {
      return left(Failure(e.message ?? 'Some unexpected error occured'));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Document> getUserData(String uid) {
    debugPrint('=======UserAPI:getUserData======> UID: $uid <============');
    return _db.getDocument(
      databaseId: AppwriteConstants.databaseId,
      collectionId: AppwriteConstants.usersCollection,
      documentId: uid,
    );
  }
}
