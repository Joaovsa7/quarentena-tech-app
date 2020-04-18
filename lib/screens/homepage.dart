import 'package:Quarentena_Tech/models/events.dart';
import 'package:Quarentena_Tech/services/events.dart';
import 'package:Quarentena_Tech/widgets/card.dart';
import 'package:Quarentena_Tech/widgets/logo.dart';
import 'package:Quarentena_Tech/widgets/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Function handleTheme;
  bool darkModeState;
  HomePage({
    Key key,
    this.handleTheme,
    this.darkModeState,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EventsService _eventsService = new EventsService();
  List<Events> _events = [];
  List<String> _filterBy = [];
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

    List<Events> events = await _eventsService.getAll();
    setState(() {
      _events = events;
      isLoading = false;
    });
  }

  List filterList([List array, dynamic parameter]) {
    return array.where((value) => value != parameter).toList();
  }

  void handleFilter(String title) {
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
    bool hasFilter = _filterBy.length > 0;
    List filteredResults = _events
        .where((event) => _filterBy.contains(event.categories[0]))
        .toList();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Logo(),
                    ),
                    Switch(
                      value: widget.darkModeState,
                      onChanged: (value) {
                        widget.handleTheme(value);
                      },
                      activeTrackColor: Theme.of(context).indicatorColor,
                      activeColor: Theme.of(context).toggleableActiveColor,
                      inactiveThumbColor: Colors.black,
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.transparent,
                          ),
                        )
                      : GridView.count(
                          crossAxisCount: 2,
                          children: List.generate(
                            hasFilter ? filteredResults.length : _events.length,
                            (index) {
                              Events event = hasFilter
                                  ? filteredResults[index]
                                  : _events[index];
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
                handleFilter: handleFilter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
