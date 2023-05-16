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
  return TweetApi(db: ref.watch(appwriteDbProvider), ref: ref);
});

abstract class ITweetApi {
  FutureEither<Document> shareTweet(Tweet tweet);
  Future<List<Document>> getTweets();
  Stream<RealtimeMessage> getLatestTweet();
}

class TweetApi implements ITweetApi {
  final Databases _db;
  final Ref _ref;

  TweetApi({required Databases db, required Ref ref})
      : _db = db,
        _ref = ref;

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
        collectionId: AppwriteConstants.tweetsCollection,
        queries: [Query.orderDesc('tweetedAt')]);
    return docs.documents;
  }

  @override
  Stream<RealtimeMessage> getLatestTweet() {
    final realtime = _ref.watch(appwriteRealtimeProvider);
    return realtime.subscribe([
      'databases.${AppwriteConstants.databaseId}.collections.${AppwriteConstants.tweetsCollection}.documents'
    ]).stream;
  }
}
