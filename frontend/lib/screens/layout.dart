import 'package:flutter/material.dart';
import 'package:frontend/screens/venu_screen.dart';
import 'home_screen.dart';
import 'account_screen.dart';
import 'ticket_screen.dart';
import 'package:frontend/l10n/app_localizations.dart';
import 'package:get/get.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  // Pages for each tab
  final List<Widget> _pages = [
    HomeScreen(),
    VenueListSreen(),
    TicketPage(),
    ProfilePage(),
  ];

  // Handle bottom navigation taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: AppLocalizations.of(context)!.venue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number_outlined),
            label: AppLocalizations.of(context)!.ticket,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: AppLocalizations.of(context)!.account,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Get.theme.colorScheme.primary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        // backgroundColor: Get.theme.colorScheme.surface,
      ),
    );
  }
}
