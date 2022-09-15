import 'package:flutter/material.dart';
import 'package:motobox/providers/fuel_consumptions.dart';
import 'package:motobox/widgets/app_widgets/lists_skeleton_cards.dart';
import 'package:motobox/widgets/fuel_consumptions_widgets/dismissible_fuelConsumption_card.dart';
import 'package:motobox/widgets/fuel_consumptions_widgets/fuel_consumption_item.dart';
import 'package:provider/provider.dart';

class FuelConsumptionList extends StatefulWidget {
  final bool isPreview;
  const FuelConsumptionList({Key? key, required this.isPreview})
      : super(key: key);

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
    await Provider.of<FuelConsumptions>(ctx, listen: false)
        .fetchAndSetFuelConsumptions();
  }

  @override
  Widget build(BuildContext context) {
    final fcData = Provider.of<FuelConsumptions>(context);
    final fuelConsumptions = fcData.consumptions;
    return _isLoading
        ? const Center(
            child: ListSkeletonCards(),
          )
        : RefreshIndicator(
            onRefresh: () => _refreshData(context),
            child: ListView.builder(
              itemCount: fuelConsumptions.length,
              itemBuilder: (context, i) => ChangeNotifierProvider.value(
                value: fuelConsumptions[i],
                child: DismissibleFuelComsumptionCard(
                    const FuelCosumptionItem(),
                    fuelConsumptions[i].id,
                    widget.isPreview),
              ),
            ),
          );
  }
}
