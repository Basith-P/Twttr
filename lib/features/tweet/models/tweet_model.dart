import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twttr/utils/enums.dart';

part 'tweet_model.freezed.dart';
part 'tweet_model.g.dart';

@freezed
class Tweet with _$Tweet {
  const factory Tweet({
    @JsonKey(name: '\$id', includeToJson: false) String? id,
    required String text,
    @Default([]) List<String> images,
    @Default([]) List<String> links,
    @Default([]) List<String> hashtags,
    required String uid,
    required TweetType tweetType,
    required DateTime tweetedAt,
    @Default([]) List<String> likedBy,
    @Default([]) List<String> commentedBy,
    @Default(0) int resharedCount,
    String? retweetedBy,
    String? repliedTo,
  }) = _Tweet;

  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);
}
