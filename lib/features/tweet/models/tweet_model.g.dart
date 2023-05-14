// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tweet _$$_TweetFromJson(Map<String, dynamic> json) => _$_Tweet(
      text: json['text'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      links: (json['links'] as List<dynamic>).map((e) => e as String).toList(),
      hashtags:
          (json['hashtags'] as List<dynamic>).map((e) => e as String).toList(),
      uid: json['uid'] as String,
      tweetType: $enumDecode(_$TweetTypeEnumMap, json['tweetType']),
      tweetedAt: DateTime.parse(json['tweetedAt'] as String),
      likedBy:
          (json['likedBy'] as List<dynamic>).map((e) => e as String).toList(),
      commentedBy: (json['commentedBy'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      id: json['\$id'],
      resharedCount: json['resharedCount'] as int,
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
      // 'id': instance.id,
      'resharedCount': instance.resharedCount,
    };

const _$TweetTypeEnumMap = {
  TweetType.text: 'text',
  TweetType.image: 'image',
};
