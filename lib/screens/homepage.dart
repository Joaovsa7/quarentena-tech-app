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
  List<String> _filterBy = [];
  bool isLoading;
  bool darkMode = false;

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
    setState(() {
      _events = events;
      isLoading = false;
    });
  }

  List filterList([List array, dynamic parameter, Function callback]) {
    return array
        .where(callback != null ? callback : (value) => value != parameter)
        .toList();
  }

  void addFilter(String title) {
    var loweredTitle = title.toLowerCase();
    if (_filterBy.contains(loweredTitle)) {
      List newFilteredList = filterList(_filterBy, loweredTitle);
      setState(() {
        _filterBy = newFilteredList;
      });
    } else {
      setState(() {
        _filterBy.add(loweredTitle);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.transparent,
          ),
        ),
      );
    }

    bool hasFilter = _filterBy.length > 0;
    List filteredResults = _events
        .where((event) => _filterBy.contains(event.categories[0]))
        .toList();

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
                      Switch(
                        value: darkMode,
                        activeTrackColor: Colors.black,
                        activeColor: Colors.purple,
                        onChanged: (value) {
                          setState(() {
                            darkMode = value;
                          });
                        },
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
                    children: List.generate(
                      hasFilter ? filteredResults.length : _events.length,
                      (index) {
                        Events event =
                            hasFilter ? filteredResults[index] : _events[index];
                        return ChannelCard(
                          heroTag: index,
                          eventData: event,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Menu(
                callback: addFilter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
