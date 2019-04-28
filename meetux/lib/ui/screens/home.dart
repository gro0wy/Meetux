import 'package:flutter/material.dart';

import 'package:meetux/model/event.dart';
import 'package:meetux/utils/store.dart';
import 'package:meetux/ui/widgets/event_card.dart';
import 'package:meetux/model/state.dart';
import 'package:meetux/state_widget.dart';
import 'package:meetux/ui/screens/login.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  StateModel appState;
  List<Event> events = getEvents();
  List<String> userFavorites = getFavoritesIDs();

  DefaultTabController _buildTabView({Widget body}) {
    const double _iconSize = 20.0;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          // We set Size equal to passed height (50.0) and infinite width:
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
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
          child: body,
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (appState.isLoading) {
      return _buildTabView(
        body: _buildLoadingIndicator(),
      );
    } else if (!appState.isLoading && appState.user == null) {
      return new LoginScreen();
    } else {
      return _buildTabView(
        body: _buildTabsContent(),
      );
    }
  }

  Center _buildLoadingIndicator() {
    return Center(
      child: new CircularProgressIndicator(),
    );
  }

  TabBarView _buildTabsContent() {
    Padding _buildEvents(List<Event> eventsList) {
      return Padding(
        // Padding before and after the list view:
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: eventsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return new EventCard(
                    event: eventsList[index],
                    inFavorites: userFavorites.contains(eventsList[index].id),
                    onFavoriteButtonPressed: _handleFavoritesListChanged,
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    return TabBarView(
      children: [
        _buildEvents(
            events.where((event) => event.type == EventType.workshop).toList()),
        _buildEvents(events
            .where((event) => event.type == EventType.seminar)
            .toList()),
        _buildEvents(events
            .where((event) => userFavorites.contains(event.id))
            .toList()),
        Center(child: Icon(Icons.settings)),
      ],
    );
  }

  // Inactive widgets are going to call this method to
  // signalize the parent widget HomeScreen to refresh the list view:
  void _handleFavoritesListChanged(String eventID) {
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
    // Build the content depending on the state:
    appState = StateWidget.of(context).state;
    return _buildContent();
  }
}