import 'package:Quarentena_Tech/models/events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class HeroDetail extends StatelessWidget {
  final int heroTag;
  final Events eventData;

  HeroDetail({
    Key key,
    this.heroTag,
    this.eventData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: heroTag,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 180,
                    width: 180,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        eventData.logo,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
            child: Text(
              eventData.content,
              textAlign: TextAlign.center,
            ),
          ),
          FlatButton(
            child: Text('Detalhes'),
            onPressed: () {
              Share.share(eventData.url, subject: 'Conheça o canal');
            },
          )
        ],
      ),
    );
  }
}
