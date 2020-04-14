import 'package:flutter/material.dart';

class MenuButton extends StatefulWidget {
  String title;
  Function onTap;

  MenuButton({
    Key key,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  bool isActive = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
        border: Border.all(
          color:
              isActive == true ? Colors.white : Theme.of(context).buttonColor,
        ),
      ),
      child: FlatButton(
        color: isActive == false ? Colors.white : Theme.of(context).buttonColor,
        child: Text(
          widget.title,
          style: TextStyle(
            color:
                isActive == true ? Colors.white : Theme.of(context).buttonColor,
            fontSize: 12,
          ),
        ),
        onPressed: () {
          setState(() {
            isActive = !isActive;
          });
        },
      ),
    );
  }
}
