import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final List<TextEditingController> _controllers = List.generate(
  6,
  (index) => TextEditingController(),
);

final List<TextEditingController> _buyControllers = List.generate(
  5,
  (index) => TextEditingController(),
);

final List<TextEditingController> _sellControllers = List.generate(
  2,
  (index) => TextEditingController(),
);

// Labels for each input
final List<String> _BuyLabels = [
  "note တွင်ရေးပေးပါရန်",
  "ငွေလွှဲအကောင့်အမည်",
  "ကူပွန်ကုဒ်",
  "ငွေလွှဲပုံတင်သွင်းရန်",
];

final List<String> _SellLabels = ["ငွေလက်ခံမည့်နံပါတ်", "ငွေလက်ခံမည့်အမည်"];

List<XFile> screenshots = []; // store selected images
final ImagePicker picker = ImagePicker();

void Sellbuypopup(
  BuildContext context,
  String isBuySelected, {
  required String gold,
  required String price,
  required Null Function() onClose,
  required void Function({double? inputYway, int? fromWhere}) onUpdateGold,
  required void Function() onUpdateMoney,
}) {
  final screenWidth = MediaQuery.of(context).size.width;

  bool isConfirmed = false; // global for this dialog

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenWidth * 0.9,
            maxHeight: double.infinity,
          ),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: StatefulBuilder(
                builder: (context, setStateDialog) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isBuySelected == "0"
                                ? "ရွှေဝယ်မှု လုပ်ဆောင်ရန်"
                                : "ရွေရောင်းချမှု လုပ်ဆောင်ရန်",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'NotoSerifMyanmar',
                              fontWeight: FontWeight.w700,
                              color: Colors.orange,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) =>
                            SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(1, 0), // from right → left
                                end: Offset(0, 0),
                              ).animate(animation),
                              child: child,
                            ),
                        child: !isConfirmed
                            ? Column(
                                key: ValueKey('confirmView'),
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("ရွှေပမာဏ : "),
                                      SizedBox(width: 10),
                                      Text(
                                        gold,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF9c0003),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "ရွေး",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF9c0003),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Text("ငွေပမာဏ : "),
                                      SizedBox(width: 10),
                                      Text(
                                        price,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF9c0003),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "MMK",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF9c0003),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 25),
                                  Text('Confirm passcode'),
                                  const SizedBox(height: 20),

                                  //passcode input
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(6, (index) {
                                      return Container(
                                        width: 40,
                                        height: 50,
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xFF9c0003),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                        ),
                                        child: TextField(
                                          controller: _controllers[index],
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          maxLength: 1,
                                          decoration: InputDecoration(
                                            counterText: '',
                                            border: InputBorder.none,
                                          ),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Color(0xFF9c0003),
                                          ),
                                          onChanged: (value) {
                                            if (value.length == 1 &&
                                                index < 5) {
                                              FocusScope.of(
                                                context,
                                              ).nextFocus();
                                            } else if (value.isEmpty &&
                                                index > 0) {
                                              FocusScope.of(
                                                context,
                                              ).previousFocus();
                                            }
                                          },
                                        ),
                                      );
                                    }),
                                  ),

                                  const SizedBox(height: 16),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(
                                          0xFF9c0003,
                                        ),
                                      ),
                                      onPressed: () {
                                        setStateDialog(() {
                                          isConfirmed = true;
                                        });
                                      },
                                      child: Text(
                                        "Confirm",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : (isBuySelected == "0")
                            ?
                              //Buy PopUp
                              Column(
                                key: ValueKey('depositFormView'),
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("ရွှေပမာဏ : "),
                                      SizedBox(width: 10),
                                      Text(
                                        gold,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF9c0003),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "ရွေး",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF9c0003),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Text("ငွေပမာဏ : "),
                                      SizedBox(width: 10),
                                      Text(
                                        price,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF9c0003),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "MMK",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF9c0003),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 25),

                                  Row(
                                    children: [
                                      Flexible(
                                        fit: FlexFit.tight,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [Text('ငွေပေးချေမှူ')],
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: DropdownButtonFormField<String>(
                                          value: "Kpay",
                                          items: ["Kpay", "Wave", "AYA"].map((
                                            v,
                                          ) {
                                            return DropdownMenuItem(
                                              value: v,
                                              child: Text(v),
                                            );
                                          }).toList(),
                                          onChanged: (val) {},
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                  horizontal: 16,
                                                  vertical: 8,
                                                ),
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 20),

                                  //ငွေလွှဲရမည့်နံပါတ်
                                  Row(
                                    children: [
                                      Flexible(
                                        fit: FlexFit.tight,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text('ငွေလွှဲရမည့်နံပါတ်'),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text('09769361178'),
                                            SizedBox(width: 10),
                                            Icon(Icons.copy),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 20),

                                  //မှတ်ချက် , ငွေလွှဲအကောင့်အမည် , Promo Code
                                  Column(
                                    children: [
                                      for (int i = 0; i < 3; i++) ...[
                                        Row(
                                          children: [
                                            Flexible(
                                              fit: FlexFit.tight,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [Text(_BuyLabels[i])],
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: TextField(
                                                controller: _buyControllers[i],
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 8,
                                                      ),
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                      ],
                                    ],
                                  ),

                                  const SizedBox(height: 20),
                                  Text(
                                    _BuyLabels[3],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 20),

                                  // Screenshot upload buttons
                                  Center(
                                    child: Wrap(
                                      spacing:
                                          12, // horizontal spacing between cards
                                      runSpacing:
                                          12, // vertical spacing between rows
                                      children: List.generate(6, (index) {
                                        if (index < screenshots.length) {
                                          final file = screenshots[index];
                                          return Stack(
                                            children: [
                                              Container(
                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.red,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  image: DecorationImage(
                                                    image: FileImage(
                                                      File(file.path),
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                right: -8,
                                                top: -8,
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.close,
                                                    size: 18,
                                                    color: Colors.black,
                                                  ),
                                                  onPressed: () {
                                                    setStateDialog(() {
                                                      screenshots.removeAt(
                                                        index,
                                                      );
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          // empty slot to maintain 3x2 grid
                                          return GestureDetector(
                                            onTap: () async {
                                              final XFile?
                                              image = await picker.pickImage(
                                                source: ImageSource
                                                    .gallery, // or ImageSource.camera
                                              );
                                              if (image != null) {
                                                setStateDialog(() {
                                                  screenshots.add(image);
                                                });
                                              }
                                            },
                                            child: Container(
                                              width: 80,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.red,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.red,
                                              ),
                                            ),
                                          );
                                        }
                                      }),
                                    ),
                                  ),
                                  const SizedBox(height: 16),

                                  GestureDetector(
                                    onTap: () {
                                      onUpdateGold(
                                        inputYway:
                                            double.tryParse(gold) ?? 0.00,
                                        fromWhere: 0,
                                      );
                                      onUpdateMoney();
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      width: double
                                          .infinity, // makes it full width
                                      padding: const EdgeInsets.fromLTRB(
                                        10,
                                        15,
                                        10,
                                        10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF9c0003),
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                          color: const Color(0xFF9c0003),
                                          width: 2,
                                        ),
                                      ),
                                      child: Text(
                                        'လုပ်ဆောင်မည်',
                                        textAlign: TextAlign
                                            .center, // center text horizontally
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'NotoSerifMyanmar',
                                          fontWeight: FontWeight.w800,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            :
                              //Sell PopUp
                              Column(
                                key: ValueKey('depositFormView'),
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("ရွှေပမာဏ : "),
                                      SizedBox(width: 10),
                                      Text(
                                        gold,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF9c0003),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Text("ငွေပမာဏ : "),
                                      SizedBox(width: 10),
                                      Text(
                                        price,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF9c0003),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 25),

                                  //"ငွေလက်ခံမည့်အကောင့်နံပါတ်", "ငွေလက်ခံမည့်အကောင့်အမည်",
                                  Column(
                                    children: [
                                      for (int i = 0; i < 2; i++) ...[
                                        Row(
                                          children: [
                                            Flexible(
                                              fit: FlexFit.tight,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(_SellLabels[i]),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: TextField(
                                                controller: _sellControllers[i],
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 8,
                                                      ),
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                      ],
                                    ],
                                  ),

                                  const SizedBox(height: 20),

                                  Text(
                                    'ငွေထုတ်ယူရန်အတွက် အချက်အလက်ကို မှန်ကန်စွာဖြည့်ပါ။',
                                    style: TextStyle(color: Color(0xFF9c0003)),
                                  ),

                                  const SizedBox(height: 20),

                                  GestureDetector(
                                    onTap: () {
                                      onUpdateGold(
                                        inputYway:
                                            double.tryParse(gold) ?? 0.00,
                                        fromWhere: 1,
                                      );
                                      onClose();
                                      onUpdateMoney();
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: double
                                          .infinity, // makes it full width
                                      padding: const EdgeInsets.fromLTRB(
                                        10,
                                        15,
                                        10,
                                        10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF9c0003),
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                          color: const Color(0xFF9c0003),
                                          width: 2,
                                        ),
                                      ),
                                      child: Text(
                                        'လုပ်ဆောင်မည်',
                                        textAlign: TextAlign
                                            .center, // center text horizontally
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'NotoSerifMyanmar',
                                          fontWeight: FontWeight.w800,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      );
    },
  );
}
