import 'package:ascendant/models/messaging_model.dart';
import 'package:ascendant/theme.dart';
import 'package:ascendant/widgets/avatar.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:ascendant/view/messages_view.dart';

import 'package:ascendant/helpers.dart';
import 'package:jiffy/jiffy.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _Recents(),
        ),
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
        onTap: () {
          // Navigator.of(context).push(MessagesView.route(messageModel));
        },
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

class _Recents extends StatelessWidget {
  _Recents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(top: 8),
        elevation: 0,
        child: SizedBox(
          height: 134,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                    top: 4.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    "Recents",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                      color: AppColors.textFaded,
                    ),
                  )),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    // might need to change later to use other data
                    final faker = Faker();
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: 60,
                            child: _RecentsCard(
                                recentsModel: RecentsModel(
                              name: faker.person.name(),
                              url: Helpers.randomPictureUrl(),
                            ))));
                  },
                ),
              )
            ],
          ),
        ));
  }
}

class _RecentsCard extends StatelessWidget {
  const _RecentsCard({
    Key? key,
    required this.recentsModel,
  }) : super(key: key);

  final RecentsModel recentsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.medium(url: recentsModel.url),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              recentsModel.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                letterSpacing: 0.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
