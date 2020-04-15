import 'package:Quarentena_Tech/components/menuButton.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final Function callback;
  Menu({Key key, this.callback}) : super(key: key);

  final List<String> _menuItems = ['Cursos', 'Twitch', 'Youtube', 'Comunidade'];

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        margin: EdgeInsets.only(top: 15),
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _menuItems.length,
          itemBuilder: (BuildContext context, index) {
            return MenuButton(
              title: _menuItems[index],
              fetchData: callback,
            );
          },
        ),
      ),
    );
  }
}
