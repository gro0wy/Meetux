import 'package:flutter/material.dart';

import 'package:meetux/model/event.dart';
import 'package:meetux/ui/widgets/event_card.dart';
import 'package:meetux/utils/store.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  // New member of the class:
  List<Event> events = getEvents();
  List<String> userFavorites = getFavoritesIDs();

  // New method:
  // Inactive widgets are going to call this method to
  // signalize the parent widget HomeScreen to refresh the list view.
  void _handleFavoritesListChanged(String eventID) {
    // Set new state and refresh the widget:
    setState(() {
      if (userFavorites.contains(eventID)) {
        userFavorites.remove(eventID);
      } else {
        userFavorites.add(eventID);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // New method:
    Padding _buildEvents(List<Event> eventsList) { // New code
      return Padding( // New code
        // Padding before and after the list view:
        padding: const EdgeInsets.symmetric(vertical: 5.0), // New code
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: eventsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return new EventCard(
                    event: eventsList[index],
                    inFavorites:
                    userFavorites.contains(eventsList[index].id),
                    onFavoriteButtonPressed: _handleFavoritesListChanged,
                  );
                },
              ),
            ),
          ],
        ),
      ); // New code
    }

    const double _iconSize = 20.0;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          // We set Size equal to passed height (50.0) and infinite width:
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 2.0,
            bottom: TabBar(
              labelColor: Theme.of(context).indicatorColor,
              tabs: [
                Tab(icon: Icon(Icons.restaurant, size: _iconSize)),
                Tab(icon: Icon(Icons.local_drink, size: _iconSize)),
                Tab(icon: Icon(Icons.favorite, size: _iconSize)),
                Tab(icon: Icon(Icons.settings, size: _iconSize)),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: TabBarView(
            // Replace placeholders:
            children: [
              // Display recipes of type food:
              _buildEvents(events
                  .where((event) => event.type == EventType.workshop)
                  .toList()),
              // Display recipes of type drink:
              _buildEvents(events
                  .where((event) => event.type == EventType.seminar)
                  .toList()),
              // Display favorite recipes:
              _buildEvents(events
                  .where((event) => userFavorites.contains(event.id))
                  .toList()),
              Center(child: Icon(Icons.settings)),
            ],
          ),
        ),
      ),
    );
  }
}