// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tweet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tweet _$TweetFromJson(Map<String, dynamic> json) {
  return _Tweet.fromJson(json);
}

/// @nodoc
mixin _$Tweet {
  String get text => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  List<String> get links => throw _privateConstructorUsedError;
  List<String> get hashtags => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  TweetType get tweetType => throw _privateConstructorUsedError;
  DateTime get tweetedAt => throw _privateConstructorUsedError;
  List<String> get likedBy => throw _privateConstructorUsedError;
  List<String> get commentedBy => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  int get resharedCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TweetCopyWith<Tweet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TweetCopyWith<$Res> {
  factory $TweetCopyWith(Tweet value, $Res Function(Tweet) then) =
      _$TweetCopyWithImpl<$Res, Tweet>;
  @useResult
  $Res call(
      {String text,
      List<String> images,
      List<String> links,
      List<String> hashtags,
      String uid,
      TweetType tweetType,
      DateTime tweetedAt,
      List<String> likedBy,
      List<String> commentedBy,
      String id,
      int resharedCount});
}

/// @nodoc
class _$TweetCopyWithImpl<$Res, $Val extends Tweet>
    implements $TweetCopyWith<$Res> {
  _$TweetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? images = null,
    Object? links = null,
    Object? hashtags = null,
    Object? uid = null,
    Object? tweetType = null,
    Object? tweetedAt = null,
    Object? likedBy = null,
    Object? commentedBy = null,
    Object? id = null,
    Object? resharedCount = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hashtags: null == hashtags
          ? _value.hashtags
          : hashtags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      tweetType: null == tweetType
          ? _value.tweetType
          : tweetType // ignore: cast_nullable_to_non_nullable
              as TweetType,
      tweetedAt: null == tweetedAt
          ? _value.tweetedAt
          : tweetedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      likedBy: null == likedBy
          ? _value.likedBy
          : likedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      commentedBy: null == commentedBy
          ? _value.commentedBy
          : commentedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      resharedCount: null == resharedCount
          ? _value.resharedCount
          : resharedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TweetCopyWith<$Res> implements $TweetCopyWith<$Res> {
  factory _$$_TweetCopyWith(_$_Tweet value, $Res Function(_$_Tweet) then) =
      __$$_TweetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text,
      List<String> images,
      List<String> links,
      List<String> hashtags,
      String uid,
      TweetType tweetType,
      DateTime tweetedAt,
      List<String> likedBy,
      List<String> commentedBy,
      String id,
      int resharedCount});
}

/// @nodoc
class __$$_TweetCopyWithImpl<$Res> extends _$TweetCopyWithImpl<$Res, _$_Tweet>
    implements _$$_TweetCopyWith<$Res> {
  __$$_TweetCopyWithImpl(_$_Tweet _value, $Res Function(_$_Tweet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? images = null,
    Object? links = null,
    Object? hashtags = null,
    Object? uid = null,
    Object? tweetType = null,
    Object? tweetedAt = null,
    Object? likedBy = null,
    Object? commentedBy = null,
    Object? id = null,
    Object? resharedCount = null,
  }) {
    return _then(_$_Tweet(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hashtags: null == hashtags
          ? _value._hashtags
          : hashtags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      tweetType: null == tweetType
          ? _value.tweetType
          : tweetType // ignore: cast_nullable_to_non_nullable
              as TweetType,
      tweetedAt: null == tweetedAt
          ? _value.tweetedAt
          : tweetedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      likedBy: null == likedBy
          ? _value._likedBy
          : likedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      commentedBy: null == commentedBy
          ? _value._commentedBy
          : commentedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      resharedCount: null == resharedCount
          ? _value.resharedCount
          : resharedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tweet implements _Tweet {
  const _$_Tweet(
      {required this.text,
      required final List<String> images,
      required final List<String> links,
      required final List<String> hashtags,
      required this.uid,
      required this.tweetType,
      required this.tweetedAt,
      required final List<String> likedBy,
      required final List<String> commentedBy,
      required this.id,
      required this.resharedCount})
      : _images = images,
        _links = links,
        _hashtags = hashtags,
        _likedBy = likedBy,
        _commentedBy = commentedBy;

  factory _$_Tweet.fromJson(Map<String, dynamic> json) =>
      _$$_TweetFromJson(json);

  @override
  final String text;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<String> _links;
  @override
  List<String> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  final List<String> _hashtags;
  @override
  List<String> get hashtags {
    if (_hashtags is EqualUnmodifiableListView) return _hashtags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hashtags);
  }

  @override
  final String uid;
  @override
  final TweetType tweetType;
  @override
  final DateTime tweetedAt;
  final List<String> _likedBy;
  @override
  List<String> get likedBy {
    if (_likedBy is EqualUnmodifiableListView) return _likedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likedBy);
  }

  final List<String> _commentedBy;
  @override
  List<String> get commentedBy {
    if (_commentedBy is EqualUnmodifiableListView) return _commentedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commentedBy);
  }

  @override
  final String id;
  @override
  final int resharedCount;

  @override
  String toString() {
    return 'Tweet(text: $text, images: $images, links: $links, hashtags: $hashtags, uid: $uid, tweetType: $tweetType, tweetedAt: $tweetedAt, likedBy: $likedBy, commentedBy: $commentedBy, id: $id, resharedCount: $resharedCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tweet &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._links, _links) &&
            const DeepCollectionEquality().equals(other._hashtags, _hashtags) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.tweetType, tweetType) ||
                other.tweetType == tweetType) &&
            (identical(other.tweetedAt, tweetedAt) ||
                other.tweetedAt == tweetedAt) &&
            const DeepCollectionEquality().equals(other._likedBy, _likedBy) &&
            const DeepCollectionEquality()
                .equals(other._commentedBy, _commentedBy) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.resharedCount, resharedCount) ||
                other.resharedCount == resharedCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      text,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_links),
      const DeepCollectionEquality().hash(_hashtags),
      uid,
      tweetType,
      tweetedAt,
      const DeepCollectionEquality().hash(_likedBy),
      const DeepCollectionEquality().hash(_commentedBy),
      id,
      resharedCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TweetCopyWith<_$_Tweet> get copyWith =>
      __$$_TweetCopyWithImpl<_$_Tweet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TweetToJson(
      this,
    );
  }
}

abstract class _Tweet implements Tweet {
  const factory _Tweet(
      {required final String text,
      required final List<String> images,
      required final List<String> links,
      required final List<String> hashtags,
      required final String uid,
      required final TweetType tweetType,
      required final DateTime tweetedAt,
      required final List<String> likedBy,
      required final List<String> commentedBy,
      required final String id,
      required final int resharedCount}) = _$_Tweet;

  factory _Tweet.fromJson(Map<String, dynamic> json) = _$_Tweet.fromJson;

  @override
  String get text;
  @override
  List<String> get images;
  @override
  List<String> get links;
  @override
  List<String> get hashtags;
  @override
  String get uid;
  @override
  TweetType get tweetType;
  @override
  DateTime get tweetedAt;
  @override
  List<String> get likedBy;
  @override
  List<String> get commentedBy;
  @override
  String get id;
  @override
  int get resharedCount;
  @override
  @JsonKey(ignore: true)
  _$$_TweetCopyWith<_$_Tweet> get copyWith =>
      throw _privateConstructorUsedError;
}
