import 'package:first_app/custom_button.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  final bool isLogin;

  const AuthPage({Key? key, required this.isLogin}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isLogin ? 'تسجيل الدخول' : 'إنشاء حساب'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                // شعار
                Icon(
                  Icons.shopping_bag,
                  size: 80,
                  color: Colors.blue,
                ),
                SizedBox(height: 20),
                Text(
                  widget.isLogin ? 'مرحباً بعودتك!' : 'أنشئ حسابك الجديد',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                
                if (!widget.isLogin)
                  CustomInputField(
                    label: 'الاسم الكامل',
                    prefixIcon: Icons.person,
                    controller: _nameController,
                  ),
                SizedBox(height: 15),
                
                CustomInputField(
                  label: 'البريد الإلكتروني',
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                ),
                SizedBox(height: 15),
                
                CustomInputField(
                  label: 'كلمة المرور',
                  isPassword: true,
                  prefixIcon: Icons.lock,
                  controller: _passwordController,
                ),
                SizedBox(height: 20),
                
                CustomButton(
                  text: widget.isLogin ? 'تسجيل الدخول' : 'إنشاء حساب',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // معالجة تسجيل الدخول أو إنشاء الحساب
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                  },
                ),
                SizedBox(height: 15),
                
                if (widget.isLogin) ...[
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot-password');
                    },
                    child: Text('نسيت كلمة المرور؟'),
                  ),
                  SizedBox(height: 10),
                ],
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.isLogin 
                          ? 'ليس لديك حساب؟ ' 
                          : 'لديك حساب بالفعل؟ ',
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context, 
                          widget.isLogin ? '/register' : '/login'
                        );
                      },
                      child: Text(
                        widget.isLogin ? 'إنشاء حساب' : 'تسجيل الدخول',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}