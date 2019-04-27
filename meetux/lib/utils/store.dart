import 'package:meetux/model/event.dart';


List<Event> getEvents() {
  return [
    Event(
      id: '0',
      type: EventType.workshop,
      name: 'Women TechmakersIzmir',
      duration: Duration(minutes: 15),
      requirements: [
        'Download flutter package',
        'Install Android Studio',
        'All installations should be completed before the workshop',
        'Attendees should bring their laptops',
        'Applying form is a must',
      ],
      info: [
        'Step 1',
        'Step 2',
        'Step 3',
      ],
      imageURL:
      'https://pbs.twimg.com/profile_images/838671460315054080/YvKrxL_m_200x200.jpg',
    ),
    Event(
      id: '1',
      type: EventType.seminar,
      name: 'Pancakes with Maple Syrup',
      duration: Duration(minutes: 20),
      requirements: [
        '2 eggs',
        '100ml of milk',
        '50g of flour',
        '10g of butter',
        'Baking powder',
        'Maple syrup',
      ],
      info: [
        'Step 1',
        'Step 2',
        'Step 3',
      ],
      imageURL:
      'https://images.unsplash.com/photo-1517741991040-91338b176129?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=f65c4032c1b3131f829d464fb979f5e8&auto=format&fit=crop&w=675&q=80',
    ),
    Event(
      id: '2',
      type: EventType.workshop,
      name: 'Strawberry Juice',
      duration: Duration(minutes: 10),
      requirements: [
        '100g of strawberries',
        '500ml of water',
        '2 teaspoons of sugar',
        'Juice of half a lemon',
      ],
      info: [
        'Step 1',
        'Step 2',
        'Step 3',
      ],
      imageURL:
      'https://images.unsplash.com/photo-1506802913710-40e2e66339c9?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c8ffc5bbb3719b5a46ee703acb0a0ac5&auto=format&fit=crop&w=634&q=80',
    ),
    Event(
      id: '3',
      type: EventType.seminar,
      name: 'Blueberry Smoothie',
      duration: Duration(minutes: 10),
      requirements: [
        '100g of fresh blueberries',
        '200g of plain yoghurt',
        '100g of milk',
        '1 banana',
      ],
      info: [
        'Step 1',
        'Step 2',
        'Step 3',
      ],
      imageURL:
      'https://images.unsplash.com/photo-1532301791573-4e6ce86a085f?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c0d9fe8ce9033db3a46ddf00bba92240&auto=format&fit=crop&w=1050&q=80',
    ),
  ];
}

List<String> getFavoritesIDs() {
  return [
    '0',
    '2',
    '3',
  ];
}