import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  BuildContext ctx;
  DateTime selectedDate;
  DateTime dateTime;
  Map<String, Object> initValues;
  bool editing;
  CustomDatePicker(
      {Key? key,
      required this.ctx,
      required this.selectedDate,
      required this.dateTime,
      required this.initValues,
      required this.editing})
      : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  Future<DateTime> _showDatePicker() async {
    await showCupertinoModalPopup(
        context: widget.ctx,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(widget.ctx).copyWith().size.height * 0.25,
            child: CupertinoDatePicker(
              backgroundColor: CupertinoColors.systemBackground,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (value) {
                if (value != null && value != widget.selectedDate) {
                  setState(() {
                    widget.selectedDate = value;
                  });
                }
              },
              initialDateTime: DateTime.now(),
              minimumYear: 2000,
              maximumYear: 2022,
            ),
          );
        });
    return widget.selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoFormRow(
      prefix: Text('Date', style: Theme.of(context).textTheme.headlineMedium),
      child: CupertinoButton(
        padding: const EdgeInsets.all(10),
        onPressed: () {
          _showDatePicker().then((date) {
            setState(() {
              widget.dateTime = date;
            });
          });
        },
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 16),
          child: widget.editing
              ? Text(
                  DateFormat('dd - MM - yy')
                      .format(widget.initValues['date'] as DateTime),
                  style: Theme.of(context).textTheme.labelLarge,
                )
              : Text(
                  DateFormat('dd - MM - yy').format(widget.dateTime),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
        ),
      ),
    );
  }
}
