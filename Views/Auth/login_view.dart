import 'package:flutter/material.dart';
import 'package:mali/Views/home_view.dart';
import 'package:mali/Views/Auth/register_view.dart';
import 'package:persian_fonts/persian_fonts.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _textemail = TextEditingController();
  final _textpass = TextEditingController();

  void controllfiled() {
    if (_textemail.text.isEmpty || _textpass.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text(
              'خطا',
              style: TextStyle(
                fontFamily: PersianFonts.Vazir.fontFamily,
              ),
            ),
            content: const Text(
              'لطفا فیلد های خالی را تکمیل کنید ',
              style: PersianFonts.Vazir,
            ),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'تمام',
                    style: TextStyle(
                      fontFamily: PersianFonts.Vazir.fontFamily,
                      color: const Color.fromARGB(255, 66, 73, 152),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else if (!_textemail.toString().contains("@")) {
      showDialog(
        context: context,
        builder: (context) => Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text(
              'ورودی اشتباه است ',
              style: TextStyle(fontFamily: PersianFonts.Vazir.fontFamily),
            ),
            content: const Text(
              'لطفا مقادیر را درست وارد نمایید',
              style: PersianFonts.Vazir,
            ),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'تمام',
                    style: PersianFonts.Vazir,
                  ),
                ),
              )
            ],
          ),
        ),
      );
      return;
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomeView();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 350,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " خوش امدید",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: PersianFonts.Vazir.fontFamily),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    ' لطفا وارد حساب کاربری خود شوید ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: PersianFonts.Vazir.fontFamily),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  TextFormField(
                    controller: _textemail,
                    decoration: const InputDecoration(
                      labelText: 'ایمیل ',
                      labelStyle: PersianFonts.Vazir,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 7, 25, 216),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _textpass,
                    decoration: const InputDecoration(
                      labelText: 'رمز عبور',
                      labelStyle: PersianFonts.Vazir,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                    onPressed: controllfiled,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 66, 73, 152),
                      fixedSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'ورود',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: PersianFonts.Vazir.fontFamily),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "ایا حساب کاربری ندارید؟",
                        style: PersianFonts.Vazir,
                      ),
                      TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (content) {
                              return const RegisterView();
                            },
                          ),
                        ),
                        child: Text(
                          'ثبت نام ',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 66, 73, 152),
                              fontFamily: PersianFonts.Vazir.fontFamily),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
