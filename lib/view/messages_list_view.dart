// source code from: https://github.com/HayesGordon/chatter/tree/tutorial-001-base-ui-complete

import 'package:ascendant/models/messaging_model.dart';
import 'package:ascendant/theme.dart';
import 'package:ascendant/widgets/avatar.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:ascendant/view/messages_view.dart';
import 'package:get/get.dart';

import 'package:ascendant/helpers.dart';
import 'package:jiffy/jiffy.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(_delegate),
        ),
      ],
    );
  }

  Widget _delegate(BuildContext context, int index) {
    final Faker faker = Faker();
    final date = Helpers.randomDate();
    return _Messages(
      messageModel: MessageModel(
        senderName: faker.person.name(),
        message: faker.lorem.sentence(),
        messageDate: date,
        dateMessage: Jiffy.parseFromDateTime(date).fromNow(),
        profilePicture: Helpers.randomPictureUrl(),
      ),
    );
  }
}

class _Messages extends StatelessWidget {
  const _Messages({Key? key, required this.messageModel}) : super(key: key);

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Get.to(MessagesView()),
        child: Container(
            height: 75,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.purpleAccent,
              width: 0.2,
            ))),
            child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Avatar.medium(url: messageModel.profilePicture),
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          messageModel.senderName,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            letterSpacing: 0.2,
                            wordSpacing: 1.5,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          child: Text(
                            messageModel.message,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    )),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            messageModel.dateMessage.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 11,
                              letterSpacing: -0.2,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textFaded,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Container(
                            width: 18,
                            height: 18,
                            decoration: const BoxDecoration(
                              color: AppColors.secondary,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: AppColors.textLight,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}