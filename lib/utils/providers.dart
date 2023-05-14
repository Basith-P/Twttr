import 'package:appwrite/appwrite.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twttr/constants/appwrite_constants.dart';

final appwriteClientProvider = Provider((_) => Client()
    .setEndpoint(AppwriteConstants.endPoint)
    .setProject(AppwriteConstants.projectId)
    .setSelfSigned());

final accountProvider = Provider((ref) {
  final client = ref.watch(appwriteClientProvider);
  return Account(client);
});

final appwriteDbProvider =
    Provider((ref) => Databases(ref.watch(appwriteClientProvider)));

final appwriteStorageProvider =
    Provider((ref) => Storage(ref.watch(appwriteClientProvider)));
