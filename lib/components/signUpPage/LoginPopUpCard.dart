import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gold_td/components/signUpPage/SignUpPopUpCard.dart';

final List<TextEditingController> _controllers = List.generate(
  2,
  (index) => TextEditingController(),
);

final List<String> _loginLabels = ["Email", "စကားဝှက်"];

void LoginPopUpCard(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  bool _obscurePassword = true;
  bool _isAgree = false;

  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenWidth * 0.9, // responsive width
            maxHeight: screenHeight * 0.9, // limit max height
          ),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.antiAlias,
            child: IntrinsicHeight(
              // <-- wrap with IntrinsicHeight
              child: SingleChildScrollView(
                reverse: true, // scroll content when keyboard appears
                child: Padding(
                  padding: const EdgeInsets.all(20), // remove viewInsets.bottom
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Header row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ရွှေကုန်သည် အကောင့်ဝင်ခြင်း",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'NotoSerifMyanmar',
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF8B6508),
                            ),
                          ),
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.close,
                              color: Color(0xFF8B6508),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // StatefulBuilder for form inputs
                      StatefulBuilder(
                        builder: (context, setStateDialog) {
                          return Column(
                            children: [
                              // Email input
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: TextField(
                                  controller: _controllers[0],
                                  decoration: InputDecoration(
                                    hintText: _loginLabels[0],
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

                              // Password input
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: _controllers[1],
                                        obscureText: _obscurePassword,
                                        decoration: InputDecoration(
                                          hintText: _loginLabels[1],
                                          border: const OutlineInputBorder(),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF8B6508),
                                                  width: 2.0,
                                                ),
                                              ),
                                          enabledBorder:
                                              const OutlineInputBorder(
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

                              // Login button
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Map<String, String> values = {
                                      _loginLabels[0]: _controllers[0].text,
                                      _loginLabels[1]: _controllers[1].text,
                                    };
                                    debugPrint(values.toString());
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
                                          ? const Color(0xFF8B6508)
                                          : const Color(
                                              0xFF8B6508,
                                            ).withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Center(
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

                              const SizedBox(height: 20),

                              // Navigate to SignUp
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
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          SignUpPopUpCard(context);
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
