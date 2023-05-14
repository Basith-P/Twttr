import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twttr/utils/enums.dart';

part 'tweet_model.freezed.dart';
part 'tweet_model.g.dart';

@freezed
class Tweet with _$Tweet {
  const factory Tweet({
    required String text,
    required List<String> images,
    required List<String> links,
    required List<String> hashtags,
    required String uid,
    required TweetType tweetType,
    required DateTime tweetedAt,
    required List<String> likedBy,
    required List<String> commentedBy,
    required String id,
    required int resharedCount,
  }) = _Tweet;

  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);
}
