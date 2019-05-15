import 'package:flutter/material.dart';

import 'package:meetux/model/event.dart';
import 'package:meetux/ui/screens/detail.dart';
import 'package:meetux/ui/widgets/event_title.dart';
import 'package:meetux/ui/widgets/event_image.dart';


class EventCard extends StatelessWidget {
  final Event event;
  final bool inFavorites;
  final Function onFavoriteButtonPressed;




  EventCard({@required this.event,
    @required this.inFavorites,
    @required this.onFavoriteButtonPressed
  });

  // hello world

  @override
  Widget build(BuildContext context) {
    RawMaterialButton _buildFavoriteButton() {
      return RawMaterialButton(
        constraints: const BoxConstraints(minWidth: 40.0, minHeight: 40.0),
        onPressed: () => onFavoriteButtonPressed(event.id),
        child: Icon(
          // Conditional expression:
          // show "favorite" icon or "favorite border" icon depending on widget.inFavorites:
          inFavorites == true ? Icons.favorite : Icons.favorite_border,
          color: Theme.of(context).iconTheme.color,
        ),
        elevation: 2.0,
        fillColor: Theme.of(context).buttonColor,
        shape: CircleBorder(),
      );
    }

    
       Stack(
         children: <Widget>[
        EventImage(event.imageURL),
        Positioned(
          child: _buildFavoriteButton(),
          top: 2.0,
          right: 2.0,
        ),
      ],
    );

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => new DetailScreen(event, inFavorites),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // We overlap the image and the button by
              // creating a Stack object:
              Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16.0 / 9.0,
                    child: Image.network(
                      event.imageURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: _buildFavoriteButton(),
                    top: 2.0,
                    right: 2.0,
                  ),
                ],
              ),
              EventTitle(event, 15),
            ],
          ),
        ),
      ),
    );
  }
}