import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/components/miscard_likes_list.dart';
import 'package:project_sym/controllers/api/miscard_controller.dart';
import 'package:project_sym/controllers/api/miscard_detail_controller.dart';
import 'package:project_sym/models/miscard.dart';

class MisCardDetailsFooterIcons extends StatelessWidget {
  final MisCard miscard;
  final int? commentsCount;
  MisCardDetailsFooterIcons(
      {Key? key, required this.miscard, this.commentsCount})
      : super(key: key);
  final MisCardDetailController mdc = Get.find();
  final MisCardController mc = Get.find();

  @override
  Widget build(BuildContext context) {
    bool isLiked = mdc.isLikedByUser;
    bool isDisLiked = mdc.isDisLikedByUser;
    bool isSaved = mdc.isSavedByUser;
    String totalLikes =
        ((miscard.likesCount ?? 0) + mdc.likeCountMaintainer).toString();
    if (totalLikes == '0') {
      totalLikes = '';
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () async {
                  await mdc
                      .handleLike(miscardID: miscard.id)
                      .then((value) async {
                    if (mc.fromLike) {
                      if (mdc.initiallyLiked != mdc.isLikedByUser) {
                        await mc.getLikedMisCards();
                      }
                    }
                    if (mc.fromHome) {
                      if (mdc.initiallyLiked != mdc.isLikedByUser) {
                        await mc.getMisCards();
                      }
                    }
                    if (mc.fromtrending) {
                      if (mdc.initiallyLiked != mdc.isLikedByUser) {
                        await mc.getTrendingMisCards();
                      }
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    isLiked ? Icons.thumb_up_rounded : Icons.thumb_up_outlined,
                    size: 20,
                    color: isLiked ? Colors.green : Colors.black54,
                  ),
                ),
              ),
              // const SizedBox(width: 4),
              if (!(mc.fromLike || mc.fromSaved))
                InkWell(
                  onTap: () {
                    Get.to(() => MisCardLikesList(miscardID: miscard.id));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2, bottom: 2, right: 8),
                    child: Text(
                      totalLikes,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          InkWell(
            onTap: () async {
              await mdc
                  .handleDislike(miscardID: miscard.id)
                  .then((value) async {
                if (mc.fromLike) {
                  if (mdc.initiallyLiked != mdc.isLikedByUser) {
                    await mc.getLikedMisCards();
                  }
                }
                if (mc.fromHome) {
                  if (mdc.initiallyLiked != mdc.isLikedByUser) {
                    await mc.getMisCards();
                  }
                }
                if (mc.fromtrending) {
                  if (mdc.initiallyLiked != mdc.isLikedByUser) {
                    await mc.getTrendingMisCards();
                  }
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(
                isDisLiked
                    ? Icons.thumb_down_alt_rounded
                    : Icons.thumb_down_alt_outlined,
                size: 20,
                color: isDisLiked ? Colors.black : Colors.black54,
              ),
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.defaultDialog(
                    middleText: 'Sort Comments By',
                    cancel: TextButton(
                      onPressed: () async {
                        await mdc.getComments(
                            id: miscard.id, orderByLikes: false);
                        Get.back();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.history_toggle_off_rounded),
                          SizedBox(width: 4),
                          Text('Recent'),
                        ],
                      ),
                    ),
                    confirm: TextButton(
                      onPressed: () async {
                        await mdc.getComments(id: miscard.id);
                        Get.back();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.thumb_up_outlined),
                          SizedBox(width: 4),
                          Text('Most Liked'),
                        ],
                      ),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.comment,
                    size: 20,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '$commentsCount',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(3.0),
              child: Icon(
                Icons.share,
                size: 20,
                color: Colors.black54,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              await mdc.handleSave(miscardID: miscard.id).then(
                (value) async {
                  if (mc.fromSaved) {
                    await mc.getSavedMisCards();
                  }
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(
                isSaved ? Icons.bookmark_added : Icons.bookmark_add_outlined,
                size: 20,
                color: isSaved ? Colors.green : Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
