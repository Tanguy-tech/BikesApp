import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:motobox/widgets/app_widgets/custom_date_picker.dart';
import 'package:provider/provider.dart';
import '../../../providers/invoice.dart';
import '../../../providers/invoices.dart';

class InvoiceForm extends StatefulWidget {
  const InvoiceForm({Key? key}) : super(key: key);

  @override
  State<InvoiceForm> createState() => _InvoiceFormState();
}

class _InvoiceFormState extends State<InvoiceForm> {
  final _formKey = GlobalKey<FormState>();
  final _dateFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  //final _docFocusNode = FocusNode();
  //final _imageViewerFocusNode = FocusNode();
  // File? image;
  DateTime selectedDate = DateTime.now();
  DateTime _dateTime = DateTime.now();
  // Future pickImage(ImageSource src) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: src);
  //     if (image == null) return;
  //     File tmpImage = File(image.path);
  //     tmpImage = await tmpImage.copy(tmpImage.path);
  //     setState(() {
  //       this.image = tmpImage;
  //     });
  //   } on Exception catch (e) {
  //     if (kDebugMode) {
  //       print(e.toString());
  //     }
  //     //print('Failed to pick Image form gallery...');
  //   }
  // }
  var _inv = Invoice(
      id: '',
      date: DateTime.now(),
      price: 0.0,
      //photo: Image.asset('placeHolder.png'),
      title: 'default');
  var _initValues = {
    'title': '',
    'date': DateTime,
    'price': '',
    'pricePerLitter': '',
  };
  var _isLoading = false;
  var _isInit = true;
  var _editing = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context)?.settings.arguments as String;
      if (productId != null) {
        _inv =
            Provider.of<Invoices>(context, listen: false).findById(productId);
        _initValues = {
          'title': _inv.title,
          'date': _inv.date,
          'price': _inv.price.toString(),
        };
        _editing = true;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _saveForm() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    if (_inv.id != null && _inv.id != '') {
      await Provider.of<Invoices>(context, listen: false)
          .updateInvoice(_inv.id, _inv);
    } else {
      try {
        await Provider.of<Invoices>(context, listen: false).addInvoice(_inv);
      } catch (error) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('An error occured..!'),
            content: const Text('Something went wrong...'),
            actions: <Widget>[
              FloatingActionButton(
                child: const Text('ok'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
      // finally {
      //   setState(() {
      //     _isLoading = false;
      //   });
      //   Navigator.of(context).pop();
      // }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _dateFocusNode.dispose();
    _priceFocusNode.dispose();
    //_docFocusNode.dispose();
    //_imageViewerFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  CupertinoFormSection.insetGrouped(
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Theme.of(context).colorScheme.primary),
                      backgroundColor: Theme.of(context).colorScheme.background,
                      margin: const EdgeInsets.all(8),
                      footer: Text(
                        'Create or edit an invoice. Price in €.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      children: [
                        CupertinoFormRow(
                          prefix: Text(
                            'Title',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: CupertinoTextFormFieldRow(
                            cursorColor:
                                Theme.of(context).colorScheme.secondary,
                            style: Theme.of(context).textTheme.labelLarge,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            initialValue: _initValues['title'].toString(),
                            placeholder: 'Enter a title / invoice content',
                            placeholderStyle:
                                Theme.of(context).textTheme.headlineMedium,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_dateFocusNode);
                            },
                            onSaved: (value) {
                              _inv = Invoice(
                                //id: 'ongoing', // to set the id different of 'id' -> means _inv already exists
                                id: _inv.id,
                                title: value!,
                                date: _inv.date,
                                price: _inv.price,
                              );
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        CustomDatePicker(
                            ctx: context,
                            selectedDate: selectedDate,
                            dateTime: _dateTime,
                            initValues: _initValues,
                            editing: _editing),
                        CupertinoFormRow(
                          prefix: Text(
                            'Price',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: CupertinoTextFormFieldRow(
                            cursorColor:
                                Theme.of(context).colorScheme.secondary,
                            style: Theme.of(context).textTheme.labelLarge,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            initialValue: _initValues['price'].toString(),
                            placeholder: 'Enter price',
                            placeholderStyle:
                                Theme.of(context).textTheme.headlineMedium,
                            textInputAction: TextInputAction.next,
                            focusNode: _priceFocusNode,
                            onFieldSubmitted: (_) {
                              _saveForm();
                            },
                            onSaved: (value) {
                              _inv = Invoice(
                                //id: 'ongoing', // to set the id different of 'id' -> means _inv already exists
                                id: _inv.id,
                                title: _inv.title,
                                date: _inv.date,
                                price: double.parse(value!),
                              );
                            },
                            validator: (value) {
                              if (value?.isEmpty == true) {
                                return 'Please enter an amount';
                              }
                              if (double.tryParse(value!) == null) {
                                return 'Please enter a valid price';
                              }
                              return null;
                            },
                          ),
                        )
                      ]),
                  Container(
                    margin: const EdgeInsets.all(8),
                    width: double.infinity,
                    child: CupertinoButton(
                        color: Theme.of(context).colorScheme.tertiary,
                        onPressed: _saveForm,
                        child: Text('Submit',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary))),
                  )
                ],
              ),
            ),
          );
  }
}


// Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Theme.of(context).backgroundColor),
//                     padding: const EdgeInsets.all(5),
//                     margin: const EdgeInsets.all(10),
//                     child: TextFormField(
//                       initialValue: _initValues['title'].toString(),
//                       // The validator receives the text that the user has entered.
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter a valid title';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         _inv = Invoice(
//                           id: _inv.id,
//                           title: value!,
//                           date: _inv.date,
//                           price: _inv.price,
//                         );
//                         //photo: _inv.photo);
//                       },
//                       decoration: const InputDecoration(
//                         hintText: "Title",
//                         hintStyle: TextStyle(
//                             color: Color.fromARGB(255, 34, 34, 34),
//                             fontSize: 15,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       textInputAction: TextInputAction.next,
//                       onFieldSubmitted: (_) {
//                         FocusScope.of(context).requestFocus(_dateFocusNode);
//                       },
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Theme.of(context).backgroundColor),
//                     child: CupertinoButton(
//                       borderRadius: BorderRadius.circular(15),
//                       color: Theme.of(context).backgroundColor,
//                       // focusNode: _dateFocusNode,
//                       // style: const ButtonStyle(alignment: Alignment.centerLeft),
//                       onPressed: () {
//                         showDatePicker(
//                                 context: context,
//                                 initialDate: DateTime.now(),
//                                 firstDate: DateTime(2000),
//                                 lastDate: DateTime.now())
//                             .then((date) {
//                           setState(() {
//                             _dateTime = date!;
//                           });
//                         });
//                       },
//                       child: _editing
//                           ? Text(DateFormat('dd - MM - yy')
//                               .format(_initValues['date'] as DateTime))
//                           : Text(
//                               'Select a date :   ${DateFormat('dd - MM - yy').format(_dateTime)}',
//                               style: const TextStyle(
//                                   color: Color.fromARGB(255, 34, 34, 34),
//                                   fontWeight: FontWeight.w500),
//                             ),
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Theme.of(context).backgroundColor),
//                     padding: const EdgeInsets.all(5),
//                     margin: const EdgeInsets.all(10),
//                     child: TextFormField(
//                       initialValue: _initValues['price'].toString(),
//                       // The validator receives the text that the user has entered.
//                       validator: (value) {
//                         if (value?.isEmpty == true) {
//                           return 'Please enter a price..';
//                         }
//                         if (double.tryParse(value!) == null) {
//                           return 'Please enter a valide price';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         _inv = Invoice(
//                           id: _inv.id,
//                           title: _inv.title,
//                           date: _inv.date,
//                           price: double.parse(value!),
//                         );
//                         //photo: _inv.photo);
//                       },
//                       decoration: const InputDecoration(
//                         hintText: "Price",
//                         hintStyle: TextStyle(
//                             color: Color.fromARGB(255, 34, 34, 34),
//                             fontSize: 15,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       textInputAction: TextInputAction.next,
//                       keyboardType: const TextInputType.numberWithOptions(
//                           signed: true, decimal: true),
//                       focusNode: _priceFocusNode,
//                       // onFieldSubmitted: (_) {
//                       //   FocusScope.of(context).requestFocus(_imageViewerFocusNode);
//                       // },
//                     ),
//                   ),
//                   // FormField(
//                   //   builder: (field) => Row(
//                   //     mainAxisAlignment: MainAxisAlignment.center,
//                   //     children: [
//                   //       Container(
//                   //         margin: const EdgeInsets.only(left: 10, right: 10),
//                   //         child: ElevatedButton(
//                   //             onPressed: () => pickImage(ImageSource.gallery),
//                   //             child: const Text('Pick from gallery')),
//                   //       ),
//                   //       Container(
//                   //         margin: const EdgeInsets.only(left: 10, right: 10),
//                   //         child: ElevatedButton(
//                   //             onPressed: () => pickImage(ImageSource.camera),
//                   //             child: const Text('Pick from camera')),
//                   //       ),
//                   //     ],
//                   //   ),
//                   //   onSaved: (value) {
//                   //     _inv = Invoice(
//                   //         id: _inv.id,
//                   //         title: _inv.title,
//                   //         date: _inv.date,
//                   //         price: _inv.price,
//                   //         photo: value as Image);
//                   //   },
//                   // ),
//                   // Container(
//                   //   decoration: BoxDecoration(
//                   //       borderRadius: BorderRadius.circular(15),
//                   //       color: Theme.of(context).backgroundColor),
//                   //   padding: const EdgeInsets.all(5),
//                   //   margin: const EdgeInsets.all(10),
//                   //   child: image != null
//                   //       ? Image.file(
//                   //           image!,
//                   //           //  width: constraints.maxWidth,
//                   //           height: 200,
//                   //         )
//                   //       : Image.asset(
//                   //           'placeHolder.png',
//                   //           // width: constraints.maxWidth,
//                   //           height: 200,
//                   //         ),
//                   // ),
//                   FloatingActionButton(onPressed: _saveForm)