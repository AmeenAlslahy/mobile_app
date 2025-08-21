import 'dart:ffi';

import 'package:flutter/material.dart';

class CreateCountScreen extends StatefulWidget {
  const CreateCountScreen({super.key});
  @override
  State<CreateCountScreen> createState() => _CreateCountScreenState();
}

// class _CreateCountScreenState extends State<CreateCountScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class _CreateCountScreenState extends State<CreateCountScreen> {
  final _formKey =
      GlobalKey<FormState>(); // مفتاح للتحكم في حالة النموذج والتحقق من صحته
  String fullName = "";
  String userName = "";
  String email = '';
  String phone = '';
  String pass = '';
  String pass2 = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("صفحة إنشاء حساب"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                _BuildTextField(
                  "full name",
                  Icons.person,
                  TextInputType.text,
                  fullName,
                ),
                SizedBox(height: 20),
                _BuildTextField(
                  "User name",
                  Icons.person_add,
                  TextInputType.text,
                  userName,
                ),
                SizedBox(height: 20),
                _BuildTextField(
                  "Email",
                  Icons.email,
                  TextInputType.emailAddress,
                  this.email,
                ),
                SizedBox(height: 20),
                _BuildTextField(
                  "Phone",
                  Icons.phone,
                  TextInputType.phone,
                  phone,
                ),
                SizedBox(height: 20),
                _BuildTextField(
                  "password",
                  Icons.lock,
                  TextInputType.visiblePassword,
                  pass,
                ),
                SizedBox(height: 20),
                _BuildTextField(
                  "password",
                  Icons.lock,
                  TextInputType.visiblePassword,
                  pass2,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // إذا كانت جميع الحقول صحيحة
                        _formKey.currentState!.save(); // حفظ قيم الحقول
                        CreateAccounting(); // استدعاء دالة إنشاء الحساب
                      }
                    },
                    child: Text('create account'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void CreateAccounting() {
    print("name " + fullName);
    print(userName);
    print(email);
    print(phone);
  }

  Widget _BuildTextField(
    String place,
    IconData icon,
    TextInputType type,
    String outValue,
  ) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: place,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(),
      ),
      keyboardType: type,
      validator: (value) {
        if (value == null || value.isEmpty) return "يرجى عدم ترك الحقل فارغ";
        return null;
      },
      onSaved: (value) => outValue = value!,
    );
  }
}


