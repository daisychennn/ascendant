// reference:
// https://github.com/HayesGordon/chatter/tree/tutorial-001-base-ui-complete

import 'package:ascendant/theme.dart';
import 'package:ascendant/view/account_view.dart';
import 'package:ascendant/view/profile_view.dart';
import 'package:ascendant/view/messages_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier("My Account");

  final pages = const [
    ProfileView(),
    MessagesListView(),
    AccountView(),
  ];

  final pageTitles = const [
    "My Matches",
    "Messages",
    "My Account",
  ];

  void _onNavigationItemSelected(index) {
    title.value = pageTitles[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 5,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.close),
              color: Colors.red,
              tooltip: 'Are you sure you want to log out?',
              onPressed: () {
                Navigator.pop(context);
              },
            );
          }
        ),
        title: ValueListenableBuilder(
          valueListenable: title,
          builder: (BuildContext context, String value, _) {
            return Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            );
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: Icon(CupertinoIcons.sparkles, color: Colors.purpleAccent)
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: _onNavigationItemSelected,
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  __BottomNavigationBarState createState() => __BottomNavigationBarState();
}

class __BottomNavigationBarState extends State<_BottomNavigationBar> {
  int selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(0),
        child: SafeArea(
            top: false,
            bottom: true,
            child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _NavigationBarItem(
                      index: 0,
                      label: 'Matches',
                      icon: Icons.star,
                      isSelected: (selectedIndex == 0),
                      onTap: handleItemSelected,
                    ),
                    _NavigationBarItem(
                      index: 1,
                      label: 'Chat',
                      icon: Icons.message,
                      isSelected: (selectedIndex == 1),
                      onTap: handleItemSelected,
                    ),
                    _NavigationBarItem(
                      index: 2,
                      label: 'Account',
                      icon: Icons.face,
                      isSelected: (selectedIndex == 2),
                      onTap: handleItemSelected,
                    ),
                  ],
                ))));
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem(
      {Key? key,
      required this.index,
      required this.label,
      required this.icon,
      this.isSelected = false,
      required this.onTap})
      : super(key: key);

  final int index;
  final String label;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          onTap(index);
        },
        child: SizedBox(
            height: 50,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: isSelected ? AppColors.secondary : null,
                ),
                Text(
                  label,
                  style: isSelected
                      ? const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondary,
                        )
                      : null,
                )
              ],
            )));
  }
}
