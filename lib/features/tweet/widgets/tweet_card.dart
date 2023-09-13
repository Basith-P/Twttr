import 'package:any_link_preview/any_link_preview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:twttr/common/common.dart';
import 'package:twttr/constants/constants.dart';
import 'package:twttr/features/auth/controller/auth_controller.dart';
import 'package:twttr/features/tweet/models/tweet_model.dart';
import 'package:twttr/features/tweet/pages/reply_tweet_view.dart';
import 'package:twttr/features/tweet/tweet_controller.dart';
import 'package:twttr/utils/functions.dart';
import 'package:twttr/utils/theme/app_colors.dart';

import 'hashtag_text.dart';
import 'images_carousel.dart';
import 'tweet_card_button.dart';

class TweetCard extends ConsumerWidget {
  const TweetCard({super.key, required this.tweet});

  final Tweet tweet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserDataProvider).value;
    return currentUser == null
        ? const SizedBox.shrink()
        : ref.watch(userDataProvider(tweet.uid)).when(
              data: (user) => GestureDetector(
                onTap: () => navigator.pushNamed(
                  TwitterReplyScreen.routeName,
                  arguments: tweet,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.transparent,
                            backgroundImage: const CachedNetworkImageProvider(
                                AssetsConstants.defaultProfilePic),
                            foregroundImage:
                                CachedNetworkImageProvider(user.photoUrl),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (tweet.retweetedBy != null)
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        AssetsConstants.retweetIcon,
                                        color: AppColors.grey,
                                        height: 16,
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        '${tweet.retweetedBy} retweeted',
                                        style: const TextStyle(
                                          color: AppColors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                Row(
                                  children: [
                                    Text(user.name),
                                    Flexible(
                                      child: Text(
                                        ' @${user.uid}',
                                        style: const TextStyle(
                                            color: AppColors.grey),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      ' • ${timeago.format(tweet.tweetedAt, locale: 'en_short')}',
                                      style: const TextStyle(
                                          color: AppColors.grey),
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                                if (tweet.repliedTo != null)
                                  ref
                                      .watch(getTweetByIdProvider(
                                          tweet.repliedTo!))
                                      .when(
                                        data: (repliedToTweet) {
                                          final replyingToUser = ref
                                              .watch(
                                                userDataProvider(
                                                    repliedToTweet.uid),
                                              )
                                              .value;
                                          return RichText(
                                            text: TextSpan(
                                              text: 'Replying to',
                                              style: const TextStyle(
                                                color: AppColors.grey,
                                                fontSize: 16,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      ' @${replyingToUser?.name}',
                                                  style: const TextStyle(
                                                    color: AppColors.blue,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        error: (error, st) =>
                                            ErrorPage(error.toString()),
                                        loading: () => const SizedBox(),
                                      ),
                                HashTagText(tweet.text),
                                if (tweet.images.isNotEmpty) ...[
                                  gapH3,
                                  TweetImagesCarousel(tweet.images)
                                ],
                                if (tweet.links.isNotEmpty) ...[
                                  gapH3,
                                  AnyLinkPreview(link: tweet.links.first),
                                ],
                                gapH2,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TweetCardButton(
                                      onPressed: () {},
                                      iconPath: AssetsConstants.viewsIcon,
                                      text: (tweet.commentedBy.length +
                                              tweet.resharedCount +
                                              tweet.likedBy.length)
                                          .toString(),
                                    ),
                                    LikeButton(
                                      onTap: (isLiked) async {
                                        ref
                                            .read(tweetControllerProvider
                                                .notifier)
                                            .likeTweet(tweet, currentUser);
                                        return !isLiked;
                                      },
                                      size: 18,
                                      isLiked: tweet.likedBy
                                          .contains(currentUser.uid),
                                      likeBuilder: (isLiked) => isLiked
                                          ? SvgPicture.asset(
                                              AssetsConstants.likeFilledIcon,
                                              color: AppColors.red,
                                              height: 18,
                                            )
                                          : SvgPicture.asset(
                                              AssetsConstants.likeOutlinedIcon,
                                              color: AppColors.grey,
                                              height: 18,
                                              width: 18,
                                            ),
                                      likeCount: tweet.likedBy.length,
                                      countBuilder: (count, isLiked, text) {
                                        return Text(
                                          count == 0 ? ' 0' : ' $text',
                                          style: const TextStyle(
                                            color: AppColors.grey,
                                          ),
                                        );
                                      },
                                    ),
                                    TweetCardButton(
                                      onPressed: () {},
                                      iconPath: AssetsConstants.commentIcon,
                                      text: tweet.commentedBy.length.toString(),
                                    ),
                                    TweetCardButton(
                                      onPressed: () => ref
                                          .read(
                                              tweetControllerProvider.notifier)
                                          .reshareTweet(tweet, currentUser),
                                      iconPath: AssetsConstants.retweetIcon,
                                      text: tweet.resharedCount.toString(),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              error: (e, st) {
                debugPrint(st.toString());
                return Text(e.toString());
              },
              loading: () => primaryLoader,
            );
  }
}
