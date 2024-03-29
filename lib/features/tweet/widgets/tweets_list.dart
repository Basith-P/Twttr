import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twttr/common/common.dart';
import 'package:twttr/constants/appwrite_constants.dart';
import 'package:twttr/features/tweet/models/tweet_model.dart';
import 'package:twttr/features/tweet/tweet_controller.dart';

import 'tweet_card.dart';

class TweetsList extends HookConsumerWidget {
  const TweetsList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getTweetsProvider).when(
          data: (tweets) => ref.watch(latestTweetProvider).when(
                data: (data) {
                  debugPrint(
                      '=========TweetsList=============> ${data.events}');
                  if (data.events.contains(
                      'databases.*.collections.${AppwriteConstants.tweetsCollection}.documents.*.create')) {
                    tweets.insert(0, Tweet.fromJson(data.payload));
                  } else if (data.events.contains(
                    'databases.*.collections.${AppwriteConstants.tweetsCollection}.documents.*.update',
                  )) {
                    final startingPoint =
                        data.events[0].lastIndexOf('documents.');
                    final endPoint = data.events[0].lastIndexOf('.update');
                    final tweetId =
                        data.events[0].substring(startingPoint + 10, endPoint);

                    Tweet tweet =
                        tweets.where((element) => element.id == tweetId).first;

                    final tweetIndex = tweets.indexOf(tweet);
                    tweets.removeWhere((element) => element.id == tweetId);

                    tweet = Tweet.fromJson(data.payload);
                    tweets.insert(tweetIndex, tweet);
                  }
                  return ListView.separated(
                    itemCount: tweets.length,
                    itemBuilder: (context, i) => TweetCard(tweet: tweets[i]),
                    separatorBuilder: (_, __) => const Divider(),
                  );
                },
                error: (e, st) {
                  debugPrint(st.toString());
                  return ErrorPage(e.toString());
                },
                loading: () => ListView.separated(
                  itemCount: tweets.length,
                  itemBuilder: (context, i) => TweetCard(tweet: tweets[i]),
                  separatorBuilder: (_, __) => const Divider(),
                ),
              ),
          error: (e, st) {
            debugPrint(st.toString());
            return ErrorPage(e.toString());
          },
          loading: () => const LoaderPage(),
        );
  }
}
