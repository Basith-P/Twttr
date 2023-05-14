import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class AppUser extends Equatable {
  final String email;
  final String name;
  final List<String> followers;
  final List<String> following;
  final String photoUrl;
  final String bannerUrl;
  final String uid;
  final String bio;
  final bool isTwttrBlue;
  const AppUser({
    required this.email,
    required this.name,
    required this.followers,
    required this.following,
    required this.photoUrl,
    required this.bannerUrl,
    required this.uid,
    required this.bio,
    required this.isTwttrBlue,
  });

  AppUser copyWith({
    String? email,
    String? name,
    List<String>? followers,
    List<String>? following,
    String? profilePic,
    String? bannerPic,
    String? uid,
    String? bio,
    bool? isTwitterBlue,
  }) {
    return AppUser(
      email: email ?? this.email,
      name: name ?? this.name,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      photoUrl: profilePic ?? photoUrl,
      bannerUrl: bannerPic ?? bannerUrl,
      uid: uid ?? this.uid,
      bio: bio ?? this.bio,
      isTwttrBlue: isTwitterBlue ?? isTwttrBlue,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'name': name});
    result.addAll({'followers': followers});
    result.addAll({'following': following});
    result.addAll({'profilePic': photoUrl});
    result.addAll({'bannerPic': bannerUrl});
    result.addAll({'bio': bio});
    result.addAll({'isTwitterBlue': isTwttrBlue});

    return result;
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      followers: List<String>.from(map['followers']),
      following: List<String>.from(map['following']),
      photoUrl: map['profilePic'] ?? '',
      bannerUrl: map['bannerPic'] ?? '',
      uid: map['\$id'] ?? '',
      bio: map['bio'] ?? '',
      isTwttrBlue: map['isTwitterBlue'] ?? false,
    );
  }

  @override
  String toString() {
    return 'UserModel(email: $email, name: $name, followers: $followers, following: $following, profilePic: $photoUrl, bannerPic: $bannerUrl, uid: $uid, bio: $bio, isTwitterBlue: $isTwttrBlue)';
  }

  @override
  List<Object?> get props => [
        email,
        name,
        followers,
        following,
        photoUrl,
        bannerUrl,
        uid,
        bio,
        isTwttrBlue,
      ];
}
