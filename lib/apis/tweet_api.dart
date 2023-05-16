import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twttr/constants/appwrite_constants.dart';
import 'package:twttr/utils/failure.dart';
import 'package:twttr/utils/typedefs.dart';

import '../features/tweet/models/tweet_model.dart';
import '../utils/providers.dart';

final tweetApiProvider = Provider((ref) {
  return TweetApi(ref.watch(appwriteDbProvider));
});

abstract class ITweetApi {
  FutureEither<Document> shareTweet(Tweet tweet);
  Future<List<Document>> getTweets();
}

class TweetApi implements ITweetApi {
  final Databases _db;

  TweetApi(this._db);

  @override
  FutureEither<Document> shareTweet(Tweet tweet) async {
    try {
      final doc = await _db.createDocument(
          databaseId: AppwriteConstants.databaseId,
          collectionId: AppwriteConstants.tweetsCollection,
          documentId: ID.unique(),
          data: tweet.toJson());
      return right(doc);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<List<Document>> getTweets() async {
    final docs = await _db.listDocuments(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.tweetsCollection);
    return docs.documents;
  }
}
