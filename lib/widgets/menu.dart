import 'package:Quarentena_Tech/components/menuButton.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final List<String> _menuItems = [
    'Cursos',
    'Twitch',
    'Youtube',
  ];

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _menuItems.length,
          itemBuilder: (BuildContext context, index) {
            return MenuButton(
              title: _menuItems[index],
            );
          },
        ),
      ),
    );
  }
}
