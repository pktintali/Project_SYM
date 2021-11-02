import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/controllers/api/miscard_detail_controller.dart';
import 'package:project_sym/models/miscard.dart';

class MisCardDetailsFooterIcons extends StatelessWidget {
  final MisCard miscard;
  final int? commentsCount;
  MisCardDetailsFooterIcons(
      {Key? key, required this.miscard, this.commentsCount})
      : super(key: key);
  final MisCardDetailController mdc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: FutureBuilder(
                      future: mdc.isLiked(miscard.id),
                      builder: (context, AsyncSnapshot<bool> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData) {
                          bool isLiked = snapshot.data??false;
                          return Icon(
                           isLiked?Icons.thumb_up_rounded:Icons.thumb_up_outlined,
                            size: 20,
                            color:isLiked?Colors.green:Colors.black54,
                          );
                        } else {
                          return const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                      }),
                ),
              ),
              // const SizedBox(width: 4),
              Text(
                '${miscard.likesCount ?? ''}',
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
                Icons.thumb_down_alt_outlined,
                size: 20,
                color: Colors.black54,
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
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(3.0),
              child: Icon(
                Icons.bookmark_add_outlined,
                size: 20,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
