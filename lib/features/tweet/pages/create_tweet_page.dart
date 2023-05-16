import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twttr/common/common.dart';
import 'package:twttr/features/auth/controller/auth_controller.dart';

import '../../../constants/assets_constants.dart';
import '../../../constants/ui_constants.dart';
import '../../../utils/functions.dart';
import '../../../utils/theme/app_colors.dart';
import '../tweet_controller.dart';

class CreateTweetPage extends HookConsumerWidget {
  const CreateTweetPage({super.key});

  static const routeName = '/create-tweet';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserDataProvider).value;
    final tweetTextController = useTextEditingController();
    final mdQry = MediaQuery.of(context);

    bool isLoading = ref.watch(tweetControllerProvider);

    ValueNotifier<List<File>> images = useState([]);

    void onGalleryIconClicked() async {
      images.value = await pickImages();
    }

    void shareTweet() {
      if (tweetTextController.text.isEmpty) {
        showSnackBar('A tweet needs some text');
        return;
      }
      ref
          .read(tweetControllerProvider.notifier)
          .shareTweet(text: tweetTextController.text, images: images.value);
    }

    return currentUser == null || isLoading
        ? const LoaderPage()
        : Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => navigator.pop(),
                icon: const Icon(Icons.close_rounded),
              ),
              actions: [
                PrimaryButton(
                  text: 'Tweet',
                  onPressed: shareTweet,
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPaddingAmount,
                    vertical: kDefaultPaddingAmount / 2,
                  ),
                  backgroundColor: AppColors.blue,
                  foregroundColor: AppColors.white,
                ),
                gapW4,
              ],
            ),
            body: Column(
              children: [
                Padding(
                  padding: kDefaultPadding,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        foregroundImage:
                            CachedNetworkImageProvider(currentUser.photoUrl),
                        backgroundImage: const CachedNetworkImageProvider(
                            AssetsConstants.defaultProfilePic),
                      ),
                      gapW4,
                      Expanded(
                        child: TextField(
                          controller: tweetTextController,
                          decoration: const InputDecoration(
                            hintText: 'What\'s happening?',
                            border: InputBorder.none,
                          ),
                          autofocus: true,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                    ],
                  ),
                ),
                gapH4,
                if (images.value.isNotEmpty)
                  CarouselSlider(
                    items: images.value
                        .map(
                          (e) => Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                                horizontal: kDefaultPaddingAmount / 4),
                            decoration: BoxDecoration(
                              borderRadius: kDefaultBorderRadius,
                              image: DecorationImage(
                                image: FileImage(e),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(enableInfiniteScroll: false),
                  ),
              ],
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.only(bottom: mdQry.viewInsets.bottom),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.greyDark, width: 0.5),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: onGalleryIconClicked,
                    icon: SvgPicture.asset(AssetsConstants.galleryIcon),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AssetsConstants.gifIcon),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AssetsConstants.emojiIcon),
                  ),
                ],
              ),
            ));
  }
}
