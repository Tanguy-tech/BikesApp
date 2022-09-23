import 'package:flutter/material.dart';
import 'package:motobox/widgets/bike_widgets/bike_data_container.dart';

class MyBikeScreen extends StatelessWidget {
  static const routeName = '/my_bike';
  const MyBikeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return LayoutBuilder(builder: ((context, constraints) {
          return Column(
            children: const [
              BikeMainInfo(),
              SizedBox(height: 20),
              Text(
                'HEY THIS IS MY BIKE SCREEN!\nhere wil go the follow up of all maintenance and everything the bike i chose the display if i have more than one',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text('HERE GOES THE CHAIN MAINTENANCE DATA'),
              SizedBox(height: 20),
              Text('HERE GOES THE OIL MAINTENANCE DATA'),
              SizedBox(height: 20),
              Text('HERE GOES THE FILTERS MAINTENANCE DATA'),
              SizedBox(height: 20),
              Text('HERE GOES OTHERS MAINTENANCE DATA'),
            ],
          );
        }));
        // return const Center(
        //   child: Text(
        //     'HEY THIS IS MY BIKE SCREEN!\nhere wil go the follow up of all maintenance and everything the bike i chose the display if i have more than one',
        //     textAlign: TextAlign.center,
        //   ),
        // );
      },
    );
  }
}
