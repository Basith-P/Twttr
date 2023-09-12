// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tweet _$$_TweetFromJson(Map<String, dynamic> json) => _$_Tweet(
      id: json[r'$id'] as String?,
      text: json['text'] as String,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      links:
          (json['links'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      hashtags: (json['hashtags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      uid: json['uid'] as String,
      tweetType: $enumDecode(_$TweetTypeEnumMap, json['tweetType']),
      tweetedAt: DateTime.parse(json['tweetedAt'] as String),
      likedBy: (json['likedBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      commentedBy: (json['commentedBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      resharedCount: json['resharedCount'] as int? ?? 0,
      retweetedBy: json['retweetedBy'] as String?,
    );

Map<String, dynamic> _$$_TweetToJson(_$_Tweet instance) => <String, dynamic>{
      'text': instance.text,
      'images': instance.images,
      'links': instance.links,
      'hashtags': instance.hashtags,
      'uid': instance.uid,
      'tweetType': _$TweetTypeEnumMap[instance.tweetType]!,
      'tweetedAt': instance.tweetedAt.toIso8601String(),
      'likedBy': instance.likedBy,
      'commentedBy': instance.commentedBy,
      'resharedCount': instance.resharedCount,
      'retweetedBy': instance.retweetedBy,
    };

const _$TweetTypeEnumMap = {
  TweetType.text: 'text',
  TweetType.image: 'image',
};
