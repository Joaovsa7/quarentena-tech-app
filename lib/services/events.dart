import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Quarentena_Tech/models/events.dart';

class EventsService {
  Future<List<Events>> getAll() async {
    return http.get('https://quarentena.tech/api/things').then((data) {
      var result = json.decode(data.body);
      List<Events> eventsData = [];
      if (result == null) {
        return [];
      }

      for (var e in result) {
        Events event = Events.fromJson(e);
        event.logo = 'https://quarentena.tech/${event.logo}';
        eventsData.add(event);
      }

      return eventsData;
    });
  }
}
