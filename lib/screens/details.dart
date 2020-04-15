import 'package:Quarentena_Tech/models/events.dart';
import 'package:Quarentena_Tech/staticData/channelColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

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
    bool isSvgImage = eventData.logo.contains('.svg');
    Color channelColor = channelsColorMap[eventData.categories[0]];
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 3,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.5,
              color: channelColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    eventData.categories[0].toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    top: -100,
                    width: MediaQuery.of(context).size.width,
                    child: Hero(
                      tag: heroTag,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 15.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(
                                      1,
                                      1,
                                    ),
                                    color: Colors.black12,
                                  )
                                ],
                              ),
                              child: SizedBox(
                                height: 180,
                                width: 180,
                                child: isSvgImage
                                    ? SvgPicture.network(eventData.logo)
                                    : CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          eventData.logo,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      height: 300,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Text(
                                eventData.title,
                                style: TextStyle(
                                  fontSize: 12,
                                  height: 1.5,
                                  color: channelColor,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                              child: Text(
                                eventData.content,
                                textAlign: TextAlign.center,
                                style: TextStyle(height: 1.5),
                              ),
                            ),
                            RaisedButton(
                              color: channelColor,
                              child: Text(
                                'Detalhes',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () => _launchURL(eventData.url),
                            ),
                            RaisedButton(
                              color: channelColor,
                              child: Text(
                                'Compartilhar',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                Share.share(eventData.url,
                                    subject: 'Conheça o canal');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

//  Container(
//       color: Colors.red,
//       width: MediaQuery.of(context).size.width,
//       child: Column(
//         children: <Widget>[
//           Container(
//             margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
//             child: Text(
//               eventData.content,
//               textAlign: TextAlign.center,
//             ),
//           ),
//           FlatButton(
//             child: Text('Detalhes'),
//             onPressed: () {
//               Share.share(eventData.url, subject: 'Conheça o canal');
//             },
//           ),
//           RaisedButton(
//             onPressed: () => _launchURL(eventData.url),
//             child: Text('Show Flutter homepage'),
//           ),
//         ],
//       ),
//     )
