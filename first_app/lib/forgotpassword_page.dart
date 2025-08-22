
import 'package:first_app/custom_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('استعادة كلمة المرور'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Icon(
              Icons.lock_reset,
              size: 60,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              'نسيت كلمة المرور؟',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'أدخل بريدك الإلكتروني وسنرسل لك رابطاً لإعادة تعيين كلمة المرور',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 30),
            CustomInputField(
              label: 'البريد الإلكتروني',
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'إرسال رابط الاستعادة',
              onPressed: () {
                // إرسال رابط استعادة كلمة المرور
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('تم إرسال رابط الاستعادة إلى بريدك الإلكتروني')),
                );
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 15),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('العودة إلى تسجيل الدخول'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}