import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twttr/apis/storage_api.dart';
import 'package:twttr/features/tweet/models/tweet_model.dart';
import 'package:twttr/utils/functions.dart';

import '../../apis/tweet_api.dart';
import '../../utils/enums.dart';
import '../auth/controller/auth_controller.dart';

final tweetControllerProvider =
    StateNotifierProvider<TweetController, bool>((ref) {
  return TweetController(ref);
});

class TweetController extends StateNotifier<bool> {
  TweetController(this._ref) : super(false);

  final Ref _ref;

  void shareTweet({required String text, required List<File> images}) async {
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
      tweetedAt: DateTime.now(),
      likedBy: [],
      commentedBy: [],
      resharedCount: 0,
    );
    final res = await _ref.read(tweetApiProvider).shareTweet(tweet);
    state = false;
    res.fold(
        (l) => showSnackBar(l.message), (r) => debugPrint(r.data.toString()));
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
