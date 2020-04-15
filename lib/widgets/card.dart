import 'package:Quarentena_Tech/models/events.dart';
import 'package:Quarentena_Tech/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

Map<String, Color> channelsMap = {
  'youtube': Colors.red,
  'twitch': Colors.purple,
  'cursos': Colors.green,
  'comunidade': Colors.blue,
};

class ChannelCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int heroTag;
  final Events eventData;

  ChannelCard({
    Key key,
    this.imageUrl,
    this.title,
    this.heroTag,
    this.eventData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Hero(
            tag: heroTag,
            child: new GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HeroDetail(
                    heroTag: heroTag,
                    eventData: eventData,
                  ),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 120,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        imageUrl,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      color: channelsMap[eventData.categories[0]],
                      child: Text(
                        eventData.categories[0],
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text(
              eventData.title,
              style: TextStyle(
                fontSize: 12,
                height: 1.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
