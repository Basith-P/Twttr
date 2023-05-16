import 'package:any_link_preview/any_link_preview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:twttr/common/common.dart';
import 'package:twttr/constants/constants.dart';
import 'package:twttr/features/auth/controller/auth_controller.dart';
import 'package:twttr/features/tweet/models/tweet_model.dart';
import 'package:twttr/utils/theme/app_colors.dart';

import 'hashtag_text.dart';
import 'images_carousel.dart';
import 'tweet_card_button.dart';

class TweetCard extends ConsumerWidget {
  const TweetCard({super.key, required this.tweet});

  final Tweet tweet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userDataProvider(tweet.uid)).when(
          data: (user) => Column(
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
                          Row(
                            children: [
                              Text(user.name),
                              Flexible(
                                child: Text(
                                  ' @${user.uid}',
                                  style: const TextStyle(color: AppColors.grey),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                ' • ${timeago.format(tweet.tweetedAt, locale: 'en_short')}',
                                style: const TextStyle(color: AppColors.grey),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TweetCardButton(
                                onPressed: () {},
                                iconPath: AssetsConstants.viewsIcon,
                                text: (tweet.commentedBy.length +
                                        tweet.resharedCount +
                                        tweet.likedBy.length)
                                    .toString(),
                              ),
                              TweetCardButton(
                                onPressed: () {},
                                iconPath: AssetsConstants.commentIcon,
                                text: tweet.commentedBy.length.toString(),
                              ),
                              TweetCardButton(
                                onPressed: () {},
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
          error: (e, st) {
            debugPrint(st.toString());
            return Text(e.toString());
          },
          loading: () => primaryLoader,
        );
  }
}
