import 'package:Quarentena_Tech/components/menuButton.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final List<String> _menuItems = ['Cursos', 'Comunidade', 'Twitch', 'Youtube'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _menuItems.length,
        itemBuilder: (BuildContext context, index) {
          final menuItemTitle = _menuItems[index];
          return MenuButton(
            title: menuItemTitle,
          );
        },
      ),
    );
  }
}
