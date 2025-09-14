import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gold_td/enumData/data.dart';

final List<TextEditingController> _controllers = List.generate(
  12,
  (index) => TextEditingController(),
);

// Labels for each input
final List<String> _SignUpLabels = [
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

void SignUpPopUpCard(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isAgree = false;

  int? _selectedGenderIndex;
  int? _selectedNRCTypeIndex;

  String? selectedTownship;
  String? selectedTown;
  List<String> townList = [];

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
                                    hintText: _SignUpLabels[0],
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
                                child: DropdownButtonFormField<int>(
                                  value: _selectedGenderIndex, // selected index
                                  decoration: InputDecoration(
                                    hintText: _SignUpLabels[1],
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
                                  items: List.generate(gender.length, (index) {
                                    return DropdownMenuItem<int>(
                                      value: index,
                                      child: Text(
                                        gender[index],
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                    );
                                  }),
                                  onChanged: (int? newIndex) {
                                    if (newIndex == null) return;

                                    setStateDialog(() {
                                      _selectedGenderIndex = newIndex;
                                      _controllers[1].text = newIndex
                                          .toString();
                                    });
                                  },
                                ),
                              ),

                              // nrcType
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: DropdownButtonFormField<int>(
                                  value: _selectedNRCTypeIndex,
                                  decoration: InputDecoration(
                                    hintText: _SignUpLabels[2],
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
                                  items: List.generate((nrc.length), (index) {
                                    return DropdownMenuItem<int>(
                                      value: index,
                                      child: Text(
                                        nrc[index],
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (int? newValue) {
                                    if (newValue == null) return;
                                    setStateDialog(() {
                                      _controllers[2].text = newValue
                                          .toString();
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
                                    hintText: _SignUpLabels[3],
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
                                            await FilePicker.platform.pickFiles(
                                              type: FileType.image,
                                            );

                                        if (result != null) {
                                          String fileName =
                                              result.files.single.name;
                                          setStateDialog(() {
                                            _controllers[4].text = fileName;
                                          });
                                        }
                                      },
                                      child: const Text(
                                        "Choose File",
                                        style: TextStyle(
                                          fontFamily: 'NotoSerifMyanmar',
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromARGB(255, 78, 57, 4),
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
                                    hintText: _SignUpLabels[4],
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
                                    hintText: _SignUpLabels[5],
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
                                    hintText: _SignUpLabels[6],
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
                                  value: selectedTownship, // no default value
                                  decoration: InputDecoration(
                                    hintText: _SignUpLabels[7],
                                    border: const OutlineInputBorder(),
                                    contentPadding: const EdgeInsets.symmetric(
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
                                  items: myanmarDataTransformed.map((e) {
                                    final townshipName =
                                        e["Township"] as String;
                                    return DropdownMenuItem<String>(
                                      value: townshipName,
                                      child: Text(townshipName),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setStateDialog(() {
                                      selectedTownship = value;
                                      selectedTown = null; // reset town
                                      // safely get towns list
                                      townList =
                                          ((myanmarDataTransformed.firstWhere(
                                                        (e) =>
                                                            e["Township"] ==
                                                            value,
                                                      )["Town"] ??
                                                      [])
                                                  as List)
                                              .map((e) => e.toString())
                                              .toList();
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
                                  value: selectedTown, // no default value
                                  decoration: InputDecoration(
                                    hintText: _SignUpLabels[8],
                                    border: const OutlineInputBorder(),
                                    contentPadding: const EdgeInsets.symmetric(
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
                                  items: townList.map((town) {
                                    return DropdownMenuItem<String>(
                                      value: town,
                                      child: Text(town),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    if (newValue == null) return;
                                    setStateDialog(() {
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
                                    hintText: _SignUpLabels[9],
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
                                          hintText: _SignUpLabels[10],
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
                                          _obscurePassword = !_obscurePassword;
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
                                          hintText: _SignUpLabels[11],
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
                                            values[_SignUpLabels[i]] =
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
                                          : const Color(0xFF8B6508).withOpacity(
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
