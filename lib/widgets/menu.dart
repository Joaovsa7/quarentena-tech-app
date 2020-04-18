import 'package:Quarentena_Tech/components/menuButton.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final Function handleFilter;
  Menu({Key key, this.handleFilter}) : super(key: key);

  final List<String> _menuItems = ['Cursos', 'Twitch', 'Youtube', 'Comunidade'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 60,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black12,
                offset: Offset(0, -2),
              )
            ],
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _menuItems.length,
            itemBuilder: (BuildContext context, int index) {
              return MenuButton(
                onTap: handleFilter,
                title: _menuItems[index],
              );
            },
          ),
        )
      ],
    );
  }
}
