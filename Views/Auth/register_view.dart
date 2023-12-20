import 'package:flutter/material.dart';
import 'package:mali/Views/Auth/login_view.dart';
import 'package:persian_fonts/persian_fonts.dart';
import '../home_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

List<String> dataRegister = [];

class _RegisterViewState extends State<RegisterView> {
  final _textemail = TextEditingController();
  final _textpass = TextEditingController();
  final _textpassconfirm = TextEditingController();

  void controllfieldregister() {
    if (_textemail.text.isEmpty ||
        _textpass.text.isEmpty ||
        _textpassconfirm.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('خطا', style: PersianFonts.Vazir),
            content: const Text(
              'لطفا مقادیر خالی را پر کنید',
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
                        color: const Color.fromARGB(255, 66, 73, 152),
                        fontFamily: PersianFonts.Vazir.fontFamily),
                  ),
                ),
              )
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
            title: const Text(
              'ورودی اشتباه است ',
              style: PersianFonts.Vazir,
            ),
            content: const Text(
              'لطفا مقادیر درست را وارد کنید ',
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
                        color: const Color.fromARGB(255, 66, 73, 152),
                        fontFamily: PersianFonts.Vazir.fontFamily),
                  ),
                ),
              )
            ],
          ),
        ),
      );
      return;
    } else if (!(_textpass.text == _textpassconfirm.text)) {
      showDialog(
        context: context,
        builder: (context) => Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text(
              'خطا',
              style: PersianFonts.Vazir,
            ),
            content: const Text(
              'رمز عبور شما با تکرار رمز عبور یکسان نمی باشد',
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
                        color: const Color.fromARGB(255, 66, 73, 152),
                        fontFamily: PersianFonts.Vazir.fontFamily),
                  ),
                ),
              )
            ],
          ),
        ),
      );
      return;
    } else {
      dataRegister.add(_textemail.text);
      dataRegister.add(_textpass.text);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomeView();
          },
        ),
      );
      setState(() {});
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
                    "شروع کن ",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: PersianFonts.Vazir.fontFamily),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'ساخت حساب کاربری',
                    style: PersianFonts.Vazir,
                  ),
                  const SizedBox(
                    height: 40,
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
                    height: 12,
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
                    height: 12,
                  ),
                  TextFormField(
                    controller: _textpassconfirm,
                    decoration: const InputDecoration(
                      labelText: 'تکرار رمز عبور',
                      labelStyle: PersianFonts.Vazir,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 90, 100, 211)),
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
                    onPressed: controllfieldregister,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 66, 73, 152),
                      fixedSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      "ثبت نام",
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
                        "ایا حساب کاربری دارید؟",
                        style: PersianFonts.Vazir,
                      ),
                      TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (content) {
                              return const LoginView();
                            },
                          ),
                        ),
                        child: Text(
                          "اینجا وارد شوید ",
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
