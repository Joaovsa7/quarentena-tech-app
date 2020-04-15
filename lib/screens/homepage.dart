import 'package:Quarentena_Tech/models/events.dart';
import 'package:Quarentena_Tech/services/events.dart';
import 'package:Quarentena_Tech/widgets/card.dart';
import 'package:Quarentena_Tech/widgets/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _eventsService = new EventsService();
  List<Events> _events = [];
  bool isLoading;
  @override
  void initState() {
    super.initState();
    getAllEvents();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getAllEvents() async {
    setState(() {
      isLoading = true;
    });
    var events = await _eventsService.getAll();
    if (events.length > 0) {
      setState(() {
        _events = events;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset(
                        'images/logo.png',
                        width: 220,
                      ),
                      Icon(
                        Icons.ac_unit,
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 10,
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width,
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(_events.length, (index) {
                      Events event = _events[index];
                      return ChannelCard(
                        imageUrl: event.logo,
                        heroTag: index,
                        eventData: event,
                      );
                    }),
                  ),
                ),
              ),
              Menu(),
            ],
          ),
        ),
      ),
    );
  }
}
