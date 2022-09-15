import 'package:flutter/material.dart';
import 'package:motobox/providers/fuel_consumptions.dart';
import 'package:motobox/widgets/app_widgets/dismissible_card.dart';
import 'package:motobox/widgets/fuel_consumptions_widgets/fuel_consumption_item.dart';
import 'package:provider/provider.dart';

class FuelConsumptionList extends StatefulWidget {
  const FuelConsumptionList({Key? key}) : super(key: key);

  @override
  State<FuelConsumptionList> createState() => _FuelConsumptionListState();
}

class _FuelConsumptionListState extends State<FuelConsumptionList> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<FuelConsumptions>(context)
          .fetchAndSetFuelConsumptions()
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _refreshData(BuildContext ctx) async {
    await Provider.of<FuelConsumptions>(ctx, listen: false)
        .fetchAndSetFuelConsumptions();
  }

  @override
  Widget build(BuildContext context) {
    final fcData = Provider.of<FuelConsumptions>(context);
    final fuelConsumptions = fcData.consumptions;
    return RefreshIndicator(
      onRefresh: () => _refreshData(context),
      child: ListView.builder(
        itemCount: fuelConsumptions.length,
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
          value: fuelConsumptions[i],
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : MyDismissibleCard(
                  const FuelCosumptionItem(), fuelConsumptions[i].id),
        ),
      ),
    );
  }
}
