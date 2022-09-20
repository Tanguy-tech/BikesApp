import 'package:flutter/material.dart';
import 'package:motobox/screens/invoices_screens/invoice_form_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/invoice.dart';
import '../../providers/invoices.dart';

// ignore: must_be_immutable
class DismissibleInvoiceCard extends StatelessWidget {
  Widget? children;
  String id;
  final bool _isPreview;
  DismissibleInvoiceCard(this.children, this.id, this._isPreview, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final invData = Provider.of<Invoice>(context);
    final scaffold = ScaffoldMessenger.of(context);
    return GestureDetector(
      onTap: () {
        _isPreview
            ? showDialog(
                context: context,
                builder: (context) => Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 250, horizontal: 80),
                  child: Stack(
                    children: [
                      Card(
                        margin: const EdgeInsets.only(top: 50.0),
                        child: SizedBox(
                          height: 400.0,
                          width: double.infinity,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        InvoiceFormScreen.routeName,
                                        arguments: id);
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                                Text(
                                  'title: ${invData.title}\nPrice: ${invData.price}€',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        //top: .0,
                        bottom: 170,
                        left: .0,
                        right: .0,
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            radius: 45.0,
                            child: Icon(Icons.receipt,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.color),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : {
                Navigator.of(context)
                    .pushNamed(InvoiceFormScreen.routeName, arguments: id)
              };
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Theme.of(context).colorScheme.primary,
        child: Dismissible(
          onDismissed: (direction) async {
            try {
              await Provider.of<Invoices>(context, listen: false)
                  .deleteInvoice(id);
            } catch (error) {
              scaffold.showSnackBar(const SnackBar(
                content: Text(
                  'Deleting Failed...',
                  textAlign: TextAlign.center,
                ),
              ));
            }
          },
          key: UniqueKey(),
          background: Container(
            padding: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 223, 30, 16),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Row(
              children: [
                Icon(Icons.delete,
                    color: Theme.of(context).textTheme.titleLarge?.color),
                Text(
                  'Delete',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.titleLarge?.color),
                ),
              ],
            ),
          ),
          secondaryBackground: Container(
            padding: const EdgeInsets.only(left: 105),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 223, 30, 16),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Row(
              children: [
                Icon(Icons.delete,
                    color: Theme.of(context).textTheme.titleLarge?.color),
                Text(
                  'Delete',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.titleLarge?.color),
                ),
              ],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: children,
          ),
        ),
      ),
    );
  }
}
