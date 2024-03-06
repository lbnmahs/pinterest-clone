import 'package:flutter/material.dart';

import 'package:pinterest_clone/views/screens/chat_screen.dart';
import 'package:pinterest_clone/views/screens/home_screen.dart';
import 'package:pinterest_clone/views/screens/profile_screen.dart';
import 'package:pinterest_clone/views/screens/search_screen.dart';
import 'package:pinterest_clone/views/widgets/add_button_modal.dart';
import 'package:pinterest_clone/views/widgets/bottom_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeTabState();
  }
}

class _HomeTabState extends State<HomeTab> {
  int _selectedIndex = 0;

  final _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const ChatScreen(),
    const ProfileScreen()
  ];

  void _onNavItemSelect(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text('All'),
            const SizedBox(height: 5),
            Container(
              height: 3,
              width: 25,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onBackground,
                borderRadius: BorderRadius.circular(20),
              )
            )
          ],
        ),
        forceMaterialTransparency: true,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 50,
        width: 50,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context, 
              builder: (ctx) => const AddButtonModal()
            );
          },
          elevation: 0.0,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            Icons.add, 
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        icons: const [
          Icons.home_rounded,
          Icons.search_rounded,
          Icons.bubble_chart_rounded,
          Icons.person_rounded,
        ], 
        selectedIndex: _selectedIndex, 
        onItemSelected: _onNavItemSelect
      )
    );
  }
}
