import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kumb_mela/constatns.dart';
import 'package:kumb_mela/custom_button/custom_button.dart';
import 'package:kumb_mela/custom_button/custom_button_register.dart';
import 'package:kumb_mela/theme/padding.dart';
import 'package:kumb_mela/utility/widgets/app_constant.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _formGlobalKey = GlobalKey<FormState>();
  bool _isProgress = false;
  String? _selectedCountryCode = '+91';
  String? _selectedLanguage;
  List<String> _languages = ['English', 'Hindi', 'Spanish', 'French', 'German'];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formGlobalKey,
      child: ListView(
        children: [
          kSizedBox(height: 5.0),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: kEdgeInsetsAll(2),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Center(
                      child: Image.asset(
                        Assets.logo,
                        height: 100,
                      ),
                    ),
                  ),
                ),
                kSizedBox(height: 2.0),
              ],
            ),
          ),
          Text(
            'Join our community by creating an account.\nIt\'s quick and secure.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.person_outline),
              labelText: 'First Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.person_outline),
              labelText: 'Last Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              Container(
                width: 80,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedCountryCode,
                  items: <String>['+91', '+1', '+44']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCountryCode = newValue;
                    });
                  },
                ),
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.phone),
                    labelText: 'Mobile Number',
                    border: OutlineInputBorder(),
                    // errorText:
                    //     'Incorrect Mobile number', // This can be conditionally shown
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.language),
              labelText: 'Language',
              border: OutlineInputBorder(),
            ),
            value: _selectedLanguage,
            items: _languages.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedLanguage = newValue;
              });
            },
          ),
          SizedBox(height: 10.0),
          TextFormField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.email_outlined),
              labelText: 'Email Address',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 10.0),
          TextFormField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.lock_outline),
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          SizedBox(height: 20.0),
          CustomButton1(
              title: AppConstant.RegisterButtonText,
              onPressed: () {
                if (_formGlobalKey.currentState!.validate()) {
                  Register();
                }
              }),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account? '),
              GestureDetector(
                onTap: () {
                  // Handle Register navigation
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void Register() async {
    var model = {
      "username": _firstnameController.text,
      "password": _lastnameController.text
    };
    setProgress(true);
    // try {
    //   final response = await KhumabMelaApis.Register(model);
    //   setProgress(false);
    //   if (response.statusCode == 200) {
    //     var map = jsonDecode(response.body);
    //     kPrint(map);
    //     if (map['status'] != 0) {
    //       // if (mounted) {
    //       await PreferenceService.setFcmToken(map['token'] ?? "");
    //       kNavigatorPushNamedRemoveUntil(
    //           context, AppRoutes.uploadInformationRoute);
    //       // }
    //     } else {
    //       ShowSnack.showErrorSnack("Invalid Username and Password..");
    //       // Navigator.pop(context);
    //     }
    //   } else {
    //     ShowSnack.showErrorSnack("Invalid Username and Password..");
    //   }
    // } catch (e) {
    //   ShowSnack.showErrorSnack('Something went wrong $e');
    // setProgress(false);
    // Navigator.pop(context);
    // throw Exception(e);
  }

  void setProgress(bool b) => setState(() => _isProgress = b);
}
