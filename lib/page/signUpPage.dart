import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gold_td/enumData/data.dart';
import 'package:file_picker/file_picker.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isExpanded = false;

  final _formKey = GlobalKey<FormState>();

  final List<TextEditingController> _controllers = List.generate(
    12,
    (index) => TextEditingController(),
  );

  // Labels for each input
  final List<String> _labels = [
    "အမည်အပြည့်အစုံ",
    "လိင်",
    "အတည်ပြုကတ်ရွှေးခြင်း",
    "ကတ်နံပါတ်",
    "No File Chosen",
    "Email",
    "ဖုန်းနံပါတ်",
    "တိုင်း/ပြည်နယ် ရွေးပါ",
    "မြို့/မြို့နယ် ရွှေးပါ",
    "အိမ်အမှတ်၊ လမ်းအမည်",
    "စကားဝှက်",
    "အတည်ပြုစကားဝှက်",
  ];

  final List<String> _loginLabels = ["Email", "စကားဝှက်"];

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isAgree = false;

  void _showPopupCard() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: screenWidth * 0.9, // responsive width
              maxHeight: double.infinity,
            ),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.antiAlias,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "ရွှေကုန်သည် အကောင့်ဖွင့်ခြင်း",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'NotoSerifMyanmar',
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF8B6508),
                              ),
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Color(0xFF8B6508),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: StatefulBuilder(
                          builder: (context, setStateDialog) {
                            return Column(
                              children: [
                                // name
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: TextField(
                                    controller: _controllers[0],
                                    decoration: InputDecoration(
                                      hintText: _labels[0],
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 2.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // gender
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: DropdownButtonFormField<String>(
                                    value: null, // no default value
                                    decoration: InputDecoration(
                                      hintText: _labels[1],
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 14,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 2.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    isExpanded: true,
                                    items: gender.map((value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Roboto',
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      if (newValue == null) return;
                                      setState(() {
                                        _controllers[1].text = newValue;
                                      });
                                    },
                                  ),
                                ),

                                // nrc
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: DropdownButtonFormField<String>(
                                    value: null, // no default value
                                    decoration: InputDecoration(
                                      hintText: _labels[2],
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 14,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 2.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    isExpanded: true,
                                    items: nrc.map((value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Roboto',
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      if (newValue == null) return;
                                      setState(() {
                                        _controllers[2].text = newValue;
                                      });
                                    },
                                  ),
                                ),

                                // nrcCard
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: TextField(
                                    controller: _controllers[3],
                                    decoration: InputDecoration(
                                      hintText: _labels[3],
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 2.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'ပုံတင်ရန် : ',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'NotoSerifMyanmar',
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromARGB(255, 78, 57, 4),
                                        ),
                                      ),

                                      ElevatedButton(
                                        onPressed: () async {
                                          FilePickerResult? result =
                                              await FilePicker.platform
                                                  .pickFiles(
                                                    type: FileType.image,
                                                  );

                                          if (result != null) {
                                            String fileName =
                                                result.files.single.name;
                                            setState(() {
                                              _controllers[4].text = fileName;
                                            });
                                          }
                                        },
                                        child: const Text(
                                          "Choose File",
                                          style: TextStyle(
                                            fontFamily: 'NotoSerifMyanmar',
                                            fontWeight: FontWeight.w700,
                                            color: Color.fromARGB(
                                              255,
                                              78,
                                              57,
                                              4,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // photo upload
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 14),
                                  child: TextField(
                                    controller: _controllers[4],
                                    decoration: InputDecoration(
                                      hintText: _labels[4],
                                      border: const OutlineInputBorder(),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 2.0,
                                        ),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  child: Align(
                                    alignment: Alignment
                                        .centerLeft, // forces left alignment
                                    child: Text(
                                      'ဆက်သွယ်ရန်',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'NotoSerifMyanmar',
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromARGB(255, 78, 57, 4),
                                      ),
                                    ),
                                  ),
                                ),

                                // email
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: TextField(
                                    controller: _controllers[5],
                                    decoration: InputDecoration(
                                      hintText: _labels[5],
                                      border: const OutlineInputBorder(),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 2.0,
                                        ),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // phone
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    controller: _controllers[6],
                                    decoration: InputDecoration(
                                      hintText: _labels[6],
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 2.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    20,
                                    0,
                                    14,
                                  ),
                                  child: Align(
                                    alignment: Alignment
                                        .centerLeft, // forces left alignment
                                    child: Text(
                                      'နေရပ်လိပ်စာ',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'NotoSerifMyanmar',
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromARGB(255, 78, 57, 4),
                                      ),
                                    ),
                                  ),
                                ),

                                // township
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: DropdownButtonFormField<String>(
                                    value: null, // no default value
                                    decoration: InputDecoration(
                                      hintText: _labels[7],
                                      border: const OutlineInputBorder(),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 14,
                                          ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 2.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    isExpanded: true,
                                    items: township.map((value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Roboto',
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      if (newValue == null) return;
                                      setState(() {
                                        _controllers[7].text = newValue;
                                      });
                                    },
                                  ),
                                ),

                                // town
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: DropdownButtonFormField<String>(
                                    value: null, // no default value
                                    decoration: InputDecoration(
                                      hintText: _labels[8],
                                      border: const OutlineInputBorder(),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 14,
                                          ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 2.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    isExpanded: true,
                                    items: township.map((value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Roboto',
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      if (newValue == null) return;
                                      setState(() {
                                        _controllers[8].text = newValue;
                                      });
                                    },
                                  ),
                                ),

                                // address
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: TextField(
                                    controller: _controllers[9],
                                    decoration: InputDecoration(
                                      hintText: _labels[9],
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 2.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    20,
                                    0,
                                    14,
                                  ),
                                  child: Align(
                                    alignment: Alignment
                                        .centerLeft, // forces left alignment
                                    child: Text(
                                      'စကားဝှက်ဖြည့်သွင်းရန်',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'NotoSerifMyanmar',
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromARGB(255, 78, 57, 4),
                                      ),
                                    ),
                                  ),
                                ),

                                // password
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: _controllers[10],
                                          obscureText: _obscurePassword,
                                          decoration: InputDecoration(
                                            hintText: _labels[10],
                                            border: const OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFF8B6508),
                                                width: 2.0,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFF8B6508),
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      IconButton(
                                        icon: Icon(
                                          _obscurePassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                        onPressed: () {
                                          setStateDialog(() {
                                            _obscurePassword =
                                                !_obscurePassword;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),

                                //confirm password
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: _controllers[11],
                                          obscureText: _obscureConfirmPassword,
                                          decoration: InputDecoration(
                                            hintText: _labels[11],
                                            border: const OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFF8B6508),
                                                width: 2.0,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFF8B6508),
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      IconButton(
                                        icon: Icon(
                                          _obscureConfirmPassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                        onPressed: () {
                                          setStateDialog(() {
                                            _obscureConfirmPassword =
                                                !_obscureConfirmPassword;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),

                                // checkbox
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: _isAgree,
                                        onChanged: (value) {
                                          setStateDialog(() {
                                            _isAgree = value!;
                                          });
                                        },
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Text(
                                          'အချက်အလက်များမှန်ကန်ပါသည်',
                                          style: TextStyle(
                                            fontFamily: 'NotoSerifMyanmar',
                                            fontWeight: FontWeight.w800,
                                            color: Color(0xFF8B6508),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: _isAgree
                                        ? () {
                                            // Collect values
                                            Map<String, String> values = {};
                                            for (int i = 0; i < 10; i++) {
                                              values[_labels[i]] =
                                                  _controllers[i].text;
                                            }

                                            debugPrint(
                                              values.toString(),
                                            ); // check values
                                            Navigator.pop(context);
                                          }
                                        : null, // will be ignored
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 15,
                                      ),
                                      decoration: BoxDecoration(
                                        color: _isAgree
                                            ? const Color(
                                                0xFF8B6508,
                                              ) // enabled color
                                            : const Color(
                                                0xFF8B6508,
                                              ).withOpacity(
                                                0.5,
                                              ), // disabled color
                                        borderRadius: BorderRadius.circular(7),
                                      ),

                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 8.0,
                                          ),
                                          child: Text(
                                            'အကောင့်ဖွင့်ခြင်း',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'NotoSerifMyanmar',
                                              fontWeight: FontWeight.w800,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showLoginPopupCard() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: screenWidth * 0.9, // responsive width
              maxHeight: double.infinity,
            ),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.antiAlias,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "ရွှေကုန်သည် အကောင့်ဝင်ခြင်း",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'NotoSerifMyanmar',
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF8B6508),
                              ),
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Color(0xFF8B6508),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: StatefulBuilder(
                          builder: (context, setStateDialog) {
                            return Column(
                              children: [
                                // email
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: TextField(
                                    controller: _controllers[5],
                                    decoration: InputDecoration(
                                      hintText: _labels[5],
                                      border: const OutlineInputBorder(),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 2.0,
                                        ),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8B6508),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // password
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: _controllers[10],
                                          obscureText: _obscurePassword,
                                          decoration: InputDecoration(
                                            hintText: _labels[10],
                                            border: const OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFF8B6508),
                                                width: 2.0,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFF8B6508),
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      IconButton(
                                        icon: Icon(
                                          _obscurePassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                        onPressed: () {
                                          setStateDialog(() {
                                            _obscurePassword =
                                                !_obscurePassword;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      // Collect values
                                      Map<String, String> values = {};
                                      for (int i = 0; i < 10; i++) {
                                        values[_labels[i]] =
                                            _controllers[i].text;
                                      }

                                      debugPrint(
                                        values.toString(),
                                      ); // check values
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 15,
                                      ),
                                      decoration: BoxDecoration(
                                        color: _isAgree
                                            ? const Color(
                                                0xFF8B6508,
                                              ) // enabled color
                                            : const Color(
                                                0xFF8B6508,
                                              ).withOpacity(
                                                0.5,
                                              ), // disabled color
                                        borderRadius: BorderRadius.circular(7),
                                      ),

                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 8.0,
                                          ),
                                          child: Text(
                                            'အကောင့်ဝင်ခြင်း',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'NotoSerifMyanmar',
                                              fontWeight: FontWeight.w800,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 20),

                                //navigat to signup page
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'NotoSerifMyanmar',
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF8B6508),
                                    ),
                                    children: [
                                      const TextSpan(
                                        text: "အကောင့်မဖွင့်ရသေးပါက ",
                                      ),
                                      TextSpan(
                                        text: "အကောင့်အသစ်ဖွင့်ရန်",
                                        style: const TextStyle(
                                          color: Colors
                                              .blue, // make it look like a link
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            _showPopupCard();
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime? lastBackPressed;

    // Responsive card size
    double cardWidth = MediaQuery.of(context).size.width * 0.9;
    double cardHeight = MediaQuery.of(context).size.height * 0.25;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    void showExitDialog() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Exit App'),
          content: const Text('Are you sure you want to exit the app?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Cancel
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop(); // ✅ Close app
              },
              child: const Text('Exit'),
            ),
          ],
        ),
      );
    }

    Future<void> handleBackButton() async {
      final now = DateTime.now();
      if (lastBackPressed == null ||
          now.difference(lastBackPressed!) > const Duration(seconds: 2)) {
        lastBackPressed = now;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Press back again to exit'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        showExitDialog();
      }
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          handleBackButton();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF9C0003),
            toolbarHeight: 100,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    "မြန်မာတို့ဧ။်",
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFFE3B900),
                      fontFamily: 'NotoSerifMyanmar',
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Text(
                  "ရွှေကုန်သည်",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFFE3b900),
                    fontFamily: 'NotoSerifMyanmar',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, top: 20),
                  child: Text(
                    "အပလီကေးရှင်း",
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFFE3b900),
                      fontFamily: 'NotoSerifMyanmar',
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.menu, color: Color(0xFFE3b900)),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Expandable animated menu
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: _isExpanded ? 220 : 0,
                child: SingleChildScrollView(
                  child: Container(
                    color: const Color(0xFF9C0003), // background color
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildMenuItem("အကောင့်ဝင်ရန်", () {
                          _showLoginPopupCard();
                        }),
                        _buildMenuItem("သူငယ်ချင်းရှာရန်", () {}),
                        _buildMenuItem("ဆက်သွယ်ရန်", () {}),
                        _buildMenuItem("မေးခွန်းကြည့်ရန်", () {}),
                      ],
                    ),
                  ),
                ),
              ),

              // Main content with wallpaper and glass card
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background image
                    Image.asset("assets/homeBg.jpg", fit: BoxFit.cover),

                    // Centered glass card
                    Center(
                      child: Container(
                        width: cardWidth,
                        height: cardHeight,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1), // glass effect
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 6),
                            ),
                          ],
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize
                                      .min, // ✅ only take content height
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacementNamed(
                                          context,
                                          '/',
                                        );
                                      },
                                      child: Text(
                                        '" ရွှေသည် အနာဂတ်အတွက် အကောင်းဆုံးရင်းနှီးမြှုပ်နှံမှုဖြစ်သည် "',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                            255,
                                            255,
                                            248,
                                            214,
                                          ),
                                          fontSize: 18,
                                          fontFamily: 'NotoSerifMyanmar',
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(height: 30),

                                    // Button
                                    InkWell(
                                      borderRadius: BorderRadius.circular(12),
                                      onTap: () {
                                        _showLoginPopupCard();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 40,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xFF9c0003),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 5,
                                          ),
                                          child: const Text(
                                            "အကောင့်ဝင်ရန်",
                                            style: TextStyle(
                                              color: Color(0xFFe3b900),
                                              fontFamily: 'NotoSerifMyanmar',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Footer at the bottom
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02, // 2% of screen height
                    horizontal: screenWidth * 0.04, // 4% of screen width
                  ),
                  color: Color(0xFF9c0003),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "© 2025 GoldTrade Inc.",
                        style: TextStyle(
                          color: Color(0xFFE3b900),
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              debugPrint("Viber icon pressed!");
                            },
                            icon: Image.asset(
                              "assets/viber.png",
                              width: 23,
                              height: 23,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.telegram),
                            color: Color(0xFFE3b900),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.facebook),
                            color: Color(0xFFE3b900),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.wechat),
                            color: Color(0xFFE3b900),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: const Color(0xFFE3B900),
          fontFamily: 'NotoSerifMyanmar',
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),

      onTap: () {
        onTap;
      },
    );
  }
}
