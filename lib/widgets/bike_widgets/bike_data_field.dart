import 'package:flutter/material.dart';

class BikeDataField extends StatelessWidget {
  final String dataField;
  const BikeDataField(this.dataField, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: Text(dataField,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
