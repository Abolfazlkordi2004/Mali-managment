import 'package:flutter/material.dart';
import 'package:mali/Views/report_view.dart';
import 'package:mali/Class/data.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';
import 'package:persian_fonts/persian_fonts.dart';

class Newpage extends StatefulWidget {
  const Newpage({super.key, required this.onsetdata});

  final void Function(Data) onsetdata;

  @override
  State<Newpage> createState() => _NewpageState();
}

final List<String> choose = ['درامد', 'هزینه'];
List<double> income = [];
List<double> cost = [];
List<double> balance = [];
List<String> selectedchooseList = [];
String? currentvalue;

class _NewpageState extends State<Newpage> {
  final _controlltitle = TextEditingController();
  final _controllamount = TextEditingController();
  final _controllfrom = TextEditingController();
  final _controlldate = TextEditingController();

  double calculateTotal(List<double> numbers) {
    double total = 0;

    for (double number in numbers) {
      total += number;
    }

    return total;
  }

  Widget setcalendar() {
    return Center(
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LinearDatePicker(
              startDate: '1390/01/01',
              endDate: "1410/01/1",
              initialDate: "1402/01/01",
              addLeadingZero: true,
              dateChangeListener: (String selectedDate) {
                setState(() {
                  _controlldate.text = selectedDate;
                });
              },
              showDay: true,
              labelStyle: TextStyle(
                fontFamily: PersianFonts.Vazir.fontFamily,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              selectedRowStyle: TextStyle(
                fontFamily: PersianFonts.Vazir.fontFamily,
                fontSize: 18.0,
                color: Colors.deepOrange,
              ),
              unselectedRowStyle: TextStyle(
                fontFamily: PersianFonts.Vazir.fontFamily,
                fontSize: 16.0,
                color: Colors.blueGrey,
              ),
              yearText: "سال ",
              monthText: "ماه ",
              dayText: "روز ",
              showLabels: true,
              columnWidth: 100,
              showMonthName: true,
              isJalaali: true,
            ),
          ],
        ),
      ),
    );
  }

  void input() {
    final parseamount = double.tryParse(_controllamount.text);
    if (_controlltitle.text.isEmpty ||
        _controllfrom.text.isEmpty ||
        _controllamount.text.isEmpty ||
        _controlldate.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text(
              'خطا',
              style: PersianFonts.Vazir,
            ),
            content: Text(
              'لطفا فیلد های خالی را تکمیل کنید ',
              style: TextStyle(
                  color: const Color.fromARGB(255, 66, 73, 152),
                  fontFamily: PersianFonts.Vazir.fontFamily),
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
    } else {
      widget.onsetdata(
        Data(
          title: _controlltitle.text,
          amount: parseamount!,
          date: _controlldate.text,
          from: _controllfrom.text,
          selectedchoose: selectedchooseList.last,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _controlltitle.dispose();
    _controllamount.dispose();
    _controllfrom.dispose();
    _controlldate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' ثبت اطلاعات ',
          style: PersianFonts.Vazir,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 66, 73, 152),
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  TextFormField(
                    controller: _controlltitle,
                    decoration: const InputDecoration(
                      labelText: 'عنوان',
                      labelStyle: PersianFonts.Vazir,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 66, 73, 152),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _controllfrom,
                    decoration: const InputDecoration(
                      labelText: ' بابت ',
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
                    height: 15,
                  ),
                  TextFormField(
                    controller: _controllamount,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: ' مبلغ',
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
                    height: 15,
                  ),
                  TextFormField(
                    controller: _controlldate,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return setcalendar();
                        },
                      );
                    },
                    decoration: const InputDecoration(
                      labelText: ' تاریخ',
                      labelStyle: PersianFonts.Vazir,
                      suffixIcon: Icon(Icons.calendar_today),
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
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ' نوع تراکنش :',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: PersianFonts.Vazir.fontFamily),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      DropdownButton(
                        value: currentvalue,
                        items: choose.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: PersianFonts.Vazir,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          currentvalue = value;
                          selectedchooseList.add(value!);
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 65,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 66, 73, 152),
                          fixedSize: const Size(120, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          'خروج',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: PersianFonts.Vazir.fontFamily),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          input();
                          incomeReport.add(calculateTotal(income));
                          costReport.add(calculateTotal(cost));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 66, 73, 152),
                          fixedSize: const Size(120, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          'ثبت',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: PersianFonts.Vazir.fontFamily,
                          ),
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
