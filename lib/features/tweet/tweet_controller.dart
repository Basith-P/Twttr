import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twttr/apis/storage_api.dart';
import 'package:twttr/features/tweet/models/tweet_model.dart';
import 'package:twttr/utils/functions.dart';

import '../../apis/tweet_api.dart';
import '../../models/app_user.dart';
import '../../utils/enums.dart';
import '../auth/controller/auth_controller.dart';

final tweetControllerProvider =
    StateNotifierProvider<TweetController, bool>((ref) {
  return TweetController(ref);
});

final getTweetsProvider = FutureProvider((ref) async {
  return ref.read(tweetControllerProvider.notifier).getTweets();
});

final latestTweetProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(tweetApiProvider).getLatestTweet();
});

class TweetController extends StateNotifier<bool> {
  TweetController(this._ref) : super(false);

  final Ref _ref;

  Future<List<Tweet>> getTweets() async {
    debugPrint('=========TweetController=============> getTweets');
    final tweets = await _ref.read(tweetApiProvider).getTweets();
    debugPrint(tweets.toString());
    return tweets.map((e) => Tweet.fromJson(e.data)).toList();
  }

  void shareTweet({required String text, required List<File> images}) async {
    final now = DateTime.now();
    List<String> imageLinks = [];
    state = true;
    if (images.isNotEmpty) {
      imageLinks = await _ref.read(storageApiProvider).uploadImages(images);
    }
    final links = _getLinkFromText(text);
    final hashtags = _getHashtagFromText(text);

    final tweet = Tweet(
      id: '',
      text: text,
      images: imageLinks,
      links: links,
      hashtags: hashtags,
      uid: _ref.read(currentUserDataProvider).value!.uid,
      tweetType: TweetType.text,
      tweetedAt: now,
      likedBy: [],
      commentedBy: [],
      resharedCount: 0,
    );
    final res = await _ref.read(tweetApiProvider).shareTweet(tweet);
    state = false;
    res.fold((l) => showSnackBar(l.message), (r) => navigator.pop());
  }

  void likeTweet(Tweet tweet, AppUser user) async {
    List<String> likedBy = tweet.likedBy;

    if (tweet.likedBy.contains(user.uid)) {
      likedBy.remove(user.uid);
    } else {
      likedBy = [...likedBy, user.uid];
    }

    tweet = tweet.copyWith(likedBy: likedBy);
    final res = await _ref.read(tweetApiProvider).likeTweet(tweet);
    res.fold((l) => null, (r) {
      // _notificationController.createNotification(
      //   text: '${user.name} liked your tweet!',
      //   postId: tweet.id,
      //   notificationType: NotificationType.like,
      //   uid: tweet.uid,
      // );
    });
  }

  void reshareTweet(Tweet tweet, AppUser currentUser) async {
    final tweetAPI = _ref.read(tweetApiProvider);

    tweet = tweet.copyWith(
      resharedCount: tweet.resharedCount + 1,
      retweetedBy: currentUser.name,
    );
    final res = await tweetAPI.updateReshareCount(tweet);
    res.fold((l) => null, (r) async {
      tweet = tweet.copyWith(
        id: ID.unique(),
        resharedCount: 0,
        tweetedAt: DateTime.now(),
        likedBy: [],
        commentedBy: [],
      );
      final res2 = await tweetAPI.shareTweet(tweet);
      res2.fold(
        (l) => showSnackBar(l.message),
        (r) => showSnackBar('Retweeted!'),
      );
    });
  }

  List<String> _getLinkFromText(String text) {
    final regex = RegExp(r'https?://[\w/:%#\$&\?\(\)~\.=\+\-]+');
    return regex.allMatches(text).map((e) => e.group(0)!).toList();
  }

  List<String> _getHashtagFromText(String text) {
    final regex = RegExp(r'#[\w]+');
    return regex.allMatches(text).map((e) => e.group(0)!).toList();
  }
}
