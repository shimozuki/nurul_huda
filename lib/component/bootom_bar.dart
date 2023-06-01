import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  const MyBottomNavigationBar(
      {super.key, required this.currentIndex, required this.onTabTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: onTabTapped,
      currentIndex: currentIndex,
      selectedItemColor: const Color(0xff52bf95),
      unselectedItemColor: const Color(0xff626262),
      selectedLabelStyle: const TextStyle(color: Color(0xff626262)),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          label: 'Agenda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance),
          label: 'Keuangan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on_outlined),
          label: 'Donasi',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_phone),
          label: 'Kontak',
        ),
      ],
    );
  }
}
