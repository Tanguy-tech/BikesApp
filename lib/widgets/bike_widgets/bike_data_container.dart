import 'package:flutter/material.dart';
import 'package:motobox/providers/bike_data.dart';
import 'package:motobox/providers/my_bikes.dart';
import 'package:motobox/widgets/app_widgets/home_skeleton_cards.dart';
import 'package:motobox/widgets/bike_widgets/bike_data_field.dart';
import 'package:motobox/widgets/bike_widgets/bike_data_item.dart';
import 'package:provider/provider.dart';

import 'empty_garage.dart';

class BikeMainInfo extends StatefulWidget {
  const BikeMainInfo({Key? key}) : super(key: key);

  @override
  State<BikeMainInfo> createState() => _BikeMainInfoState();
}

class _BikeMainInfoState extends State<BikeMainInfo> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<MyBikes>(context).fetchAndSetBikes().then((_) {
        Future.delayed(const Duration(milliseconds: 50), () {
          setState(() {
            _isLoading = false;
          });
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _refreshData(BuildContext ctx) async {
    await Provider.of<MyBikes>(ctx, listen: false).fetchAndSetBikes();
  }

  @override
  Widget build(BuildContext context) {
    final bikeData = Provider.of<MyBikes>(context).bikes;
    return LayoutBuilder(builder: ((context, constraints) {
      return Stack(
        children: [
          _isLoading
              ? const HomeSkeletonCards()
              : RefreshIndicator(
                  onRefresh: () => _refreshData(context),
                  child: bikeData.isEmpty
                      ? EmptyGarageContainer(constraints)
                      : BikeDataItem(bikeData: bikeData, constraints),
                ),
        ],
      );
    }));
  }
}
