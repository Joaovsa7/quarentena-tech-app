import 'package:flutter/material.dart';

class MenuButton extends StatefulWidget {
  final String title;
  final Function fetchData;

  MenuButton({
    Key key,
    this.title,
    this.fetchData,
  }) : super(key: key);

  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  bool isSelected = false;

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
      height: 15,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
        border: Border.all(
          color:
              isSelected == true ? Colors.white : Theme.of(context).buttonColor,
        ),
      ),
      child: FlatButton(
        color:
            isSelected == false ? Colors.white : Theme.of(context).buttonColor,
        child: Text(
          widget.title,
          style: TextStyle(
            color: isSelected == true
                ? Colors.white
                : Theme.of(context).buttonColor,
            fontSize: 10,
          ),
        ),
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
          widget.fetchData(widget.title);
        },
      ),
    );
  }
}
