import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twttr/constants/constants.dart';

import '../utils/providers.dart';

final storageApiProvider = Provider((ref) {
  return StorageApi(ref.watch(appwriteStorageProvider));
});

class StorageApi {
  final Storage _storage;

  StorageApi(this._storage);

  Future<List<String>> uploadImages(List<File> files) async {
    List<String> urls = [];
    for (var file in files) {
      final res = await _storage.createFile(
        bucketId: AppwriteConstants.imagesBucket,
        fileId: ID.unique(),
        file: InputFile.fromPath(
            path: file.path, filename: file.path.split('/').last),
      );
      urls.add(AppwriteConstants.imageUrl(res.$id));
    }
    return urls;
  }
}
