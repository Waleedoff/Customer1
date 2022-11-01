import 'package:flutter/material.dart';
import 'package:expense_project/colors.dart' as color;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:alert/alert.dart';
import 'home.dart';

class SavingPage extends StatefulWidget {
  const SavingPage({Key? key}) : super(key: key);

  @override
  State<SavingPage> createState() => _SavingPageState();
}

class _SavingPageState extends State<SavingPage> {
  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;
    String? selectedItem = '10%';
    final Save newObj = Get.put(Save());
    var savee = TextEditingController();

    final items = ['10%', '50%'];

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              // height: 450,
              // width: 414,
              // margin: const EdgeInsets.only(bottom: 20),
              // padding: const EdgeInsets.symmetric(horizontal: 20),
              // decoration: BoxDecoration(
              //     color: color.Colors.backgroundColor,
              //     borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Your Saving Reat',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            height: 3,
                            color: color.Colors.disableColor,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                                width: 1,
                                color: color.Colors.backgroundGreenColor),
                          ),
                        ),
                        value: selectedItem,
                        iconSize: 20,
                        icon: Icon(Icons.keyboard_arrow_down_sharp,
                            color: color.Colors.backgroundGreenColor),
                        isExpanded: true,
                        items: items
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (item) =>
                            setState(() => selectedItem = item),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Saving For This Month',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            height: 3,
                            color: color.Colors.disableColor,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: savee,

                      // validator: (value) {
                      //   if (savee == null) {
                      //     return 'Please enter some text';
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        hintText: '100 SR',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Saving Data',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            height: 3,
                            color: color.Colors.disableColor,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: '2022-10-31',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        print('ddddd${items[0]}');

                        DateTime now = new DateTime.now();
                        print(now);
                        newObj.s.value = double.parse(savee.value.text);

                        Navigator.pop(context);
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: color.Colors.backgroundGreenColor,
                        minimumSize: Size.fromHeight(48),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
