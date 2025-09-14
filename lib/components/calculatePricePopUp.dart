import 'package:flutter/material.dart';
import 'package:gold_td/components/sellBuyPopUp.dart';

final List<TextEditingController> _controllers = List.generate(
  1,
  (index) => TextEditingController(),
);

final List<String> _labels = ["ငွေကြေးပမာဏ", "ရွှေပမာဏ"];
final List<String> _hintLabels = ["MMK", "ရွေး"];

void CalculatePricePopUp(
  BuildContext context,
  String isBuySelected, {
  required totalPrice,
  required onUpdateGold,
  required onUpdateMoney,
}) {
  final screenWidth = MediaQuery.of(context).size.width;
  String showingText = "";
  String? _errorInputText;
  String? _errorText;
  bool isDisabled = true;

  showDialog(
    context: context,
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
                  // void _validateBuyBtn() {
                  //   double enteredMoney =
                  //       double.tryParse(_controllers[0].text) ?? 0;

                  //   if (totalPrice < enteredMoney) {
                  //     setStateDialog(() {
                  //       _errorInputText =
                  //           "ရွေထပ်ဝယ်ဖို့ ငွေကြေးပမာဏမလုံလောက်ပါ";
                  //       showingText = "";
                  //     });
                  //   } else {
                  //     Sellbuypopup(
                  //       context,
                  //       isBuySelected,
                  //       gold: isBuySelected == "1"
                  //           ? _controllers[0].text
                  //           : showingText,
                  //       price: isBuySelected == "1"
                  //           ? showingText
                  //           : _controllers[0].text,
                  //       onUpdateGold: onUpdateGold,
                  //       onUpdateMoney: onUpdateMoney,
                  //       onClose: () {
                  //         setStateDialog(() {
                  //           isDisabled = true;
                  //           showingText = "-";
                  //           _controllers[0].clear();
                  //         });
                  //       },
                  //     );
                  //   }
                  // }
                  void _validateBuyBtn() {
                    double enteredMoney =
                        double.tryParse(_controllers[0].text) ?? 0;

                    Sellbuypopup(
                      context,
                      isBuySelected,
                      gold: isBuySelected == "1"
                          ? _controllers[0].text
                          : showingText,
                      price: isBuySelected == "1"
                          ? showingText
                          : _controllers[0].text,
                      onUpdateGold: onUpdateGold,
                      onUpdateMoney: onUpdateMoney,
                      onClose: () {
                        setStateDialog(() {
                          isDisabled = true;
                          showingText = "-";
                          _controllers[0].clear();
                        });
                      },
                    );
                  }

                  void _validateInput() {
                    final inputValue = double.tryParse(_controllers[0].text);
                    if (inputValue == null) {
                      setStateDialog(() {
                        _errorInputText = "Input တွင်တစ်ခုခုထည့်ပါ";
                        showingText = "";
                      });
                    } else if (isBuySelected == "1" &&
                        (inputValue < 1 || inputValue > 120)) {
                      setStateDialog(() {
                        _errorInputText =
                            "1 ရွေး မှ 120 ရွေးအထိသာရောင်းချနိုင်";
                        showingText = "";
                      });
                    } else if (isBuySelected == "0" && inputValue <= 4999) {
                      setStateDialog(() {
                        _errorInputText =
                            "5,000 (5 ထောင်) အောက်ဝယ်လို့မရနိုင်ပါ";
                        showingText = "";
                      });
                    } else {
                      setStateDialog(() {
                        isDisabled = false;
                        _errorText = null;
                        _errorInputText = null;
                        final inputValue =
                            double.tryParse(_controllers[0].text) ?? 0;

                        showingText = isBuySelected == "0"
                            ? (inputValue / (totalPrice / 128)).toStringAsFixed(
                                2,
                              )
                            : (inputValue * (totalPrice / 128)).toStringAsFixed(
                                2,
                              );
                      });
                    }
                  }

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isBuySelected == "0"
                                ? "ရွှေဝယ်မှု တွက်ချက်ခြင်း"
                                : "ရွေရောင်းချမှု တွက်ချက်ခြင်း",
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

                      const SizedBox(height: 15),

                      //input
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(_labels[isBuySelected == "0" ? 0 : 1]),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            controller: _controllers[0],
                            style: TextStyle(fontSize: 15),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText:
                                  _hintLabels[isBuySelected == "0" ? 0 : 1],
                              errorText: _errorInputText,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 13,
                              ),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.orange,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.orange,
                                  width: 1,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.orange,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 35),

                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'စုစုပေါင်းရရှိနိုင်မည့် ${_labels[isBuySelected == "0" ? 1 : 0]}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  showingText.isNotEmpty
                                      ? Text(
                                          showingText,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : Text(
                                          "-",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                  SizedBox(width: 10),
                                  Text(
                                    _hintLabels[isBuySelected == "0" ? 1 : 0],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 40),

                      //Three Btn
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _validateInput();
                            },
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(
                                10,
                                15,
                                10,
                                10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                  color: const Color(0xFF9c0003),
                                  width: 2,
                                ),
                              ),
                              child: Text(
                                'တွက်ပါ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'NotoSerifMyanmar',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setStateDialog(() {
                                isDisabled = true;
                                showingText = "-";
                                _controllers[0].clear();
                                _errorInputText = null;
                                _errorText = null;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(
                                10,
                                15,
                                10,
                                10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                  color: const Color(0xFF9c0003),
                                  width: 2,
                                ),
                              ),
                              child: Text(
                                'ဖျက်မယ်',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'NotoSerifMyanmar',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (isDisabled) return;

                              _validateBuyBtn();
                            },

                            child: Container(
                              padding: const EdgeInsets.fromLTRB(
                                10,
                                15,
                                10,
                                10,
                              ),
                              decoration: BoxDecoration(
                                color: isDisabled
                                    ? Colors.grey[300]
                                    : Colors.white, // background
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                  color: isDisabled
                                      ? Colors.grey
                                      : const Color(0xFF9c0003), // border
                                  width: 2,
                                ),
                              ),
                              child: Text(
                                'ဆောင်ရွက်မည်',
                                style: TextStyle(
                                  color: isDisabled
                                      ? Colors.grey
                                      : Colors.black, // text color
                                  fontFamily: 'NotoSerifMyanmar',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      //Error Text
                      _errorText != null
                          ? Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                _errorText!,
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          : Container(),
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

  _controllers[0].clear();
}
