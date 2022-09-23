import 'package:flutter/material.dart';
import 'package:motobox/providers/my_bikes.dart';
import 'package:motobox/widgets/app_widgets/lists_skeleton_cards.dart';
import 'package:motobox/widgets/bike_widgets/bike_data_item.dart';
import 'package:motobox/widgets/bike_widgets/bikes_data_items.dart';
import 'package:motobox/widgets/invoices_widgets/dismissible_invoice_card.dart';
import 'package:provider/provider.dart';
import '../../providers/invoices.dart';

class MyBikesList extends StatefulWidget {
  const MyBikesList({Key? key}) : super(key: key);

  @override
  State<MyBikesList> createState() => _MyBikesListState();
}

class _MyBikesListState extends State<MyBikesList> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

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
    final bikeData = Provider.of<MyBikes>(context);
    final bikes = bikeData.bikes;
    return _isLoading
        ? const Center(
            child: ListSkeletonCards(),
          )
        : LayoutBuilder(
            builder: ((context, constraints) {
              return RefreshIndicator(
                onRefresh: () => _refreshData(context),
                child: ListView.builder(
                  itemCount: bikes.length,
                  itemBuilder: (context, i) => ChangeNotifierProvider.value(
                    value: bikes[i],
                    child: BikesDataItems(bikeData: bikes, constraints),
                  ),
                ),
              );
            }),
          );
  }
}
