import 'package:flutter/material.dart';
import 'package:mali/Class/data.dart';
import 'package:mali/Widget/calender_widget.dart';
import 'package:persian_fonts/persian_fonts.dart';
import '../Widget/newpage.dart';

class EditView extends StatefulWidget {
  const EditView({super.key, required this.data, required this.dataApp});
  final Data data;
  final Function(Data) dataApp;

  @override
  State<EditView> createState() => _EditpageState();
}

class _EditpageState extends State<EditView> {
  final TextEditingController _controllamount = TextEditingController();
  final TextEditingController _controlltitle = TextEditingController();
  final TextEditingController _controllfrom = TextEditingController();
  final TextEditingController _controller = TextEditingController();

  void insertitem(newvalue) {
    selectedchooseList.add(newvalue);

    setState(() {});
  }

  void onsetediteddata(Data newData) {
    widget.data.title = newData.title;
    widget.data.amount = newData.amount;
    widget.data.from = newData.from;
    widget.data.date = newData.date;
    widget.data.selectedchoose = newData.selectedchoose;

    widget.dataApp(widget.data);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controllamount.text = widget.data.amount.toString();
    _controlltitle.text = widget.data.title;
    _controllfrom.text = widget.data.from;
    _controller.text = widget.data.date;
  }

  @override
  void dispose() {
    super.dispose();
    _controlltitle.dispose();
    _controllfrom.dispose();
    _controllamount.dispose();
    _controller.dispose();
  }

  void updateData() {
    final parseamount = double.tryParse(_controllamount.text);
    if (_controllfrom.text.isEmpty ||
        _controlltitle.text.isEmpty ||
        _controllamount.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('خطا', style: PersianFonts.Vazir),
          content: const Text(
            'لطفا تمام مقادیر خالی را پر کنید',
            style: PersianFonts.Vazir,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'تمام',
                style: PersianFonts.Vazir,
              ),
            ),
          ],
        ),
      );
    } else {
      final newData = Data(
        title: _controlltitle.text,
        amount: parseamount!,
        date: _controller.text,
        from: _controllfrom.text,
        selectedchoose: selectedchooseList.last,
      );
      onsetediteddata(newData);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ویرایش ',
          style: PersianFonts.Vazir,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 66, 73, 152),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: SizedBox(
            width: 350,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    'لطفا تمام مقادیر را پر کنید ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: PersianFonts.Vazir.fontFamily,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _controlltitle,
                    decoration: const InputDecoration(
                      labelText: 'عنوان',
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
                    controller: _controller,
                    onTap: () async {
                      String? newData = await showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const CalenderWidget();
                        },
                      ).then((value) => value);

                      if (newData != null) {
                        _controller.text = newData;
                      }
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DropdownButton(
                        value: selectedchooseList.isNotEmpty
                            ? selectedchooseList.last
                            : null,
                        items: choose.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e, style: PersianFonts.Vazir),
                          );
                        }).toList(),
                        onChanged: insertitem,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        ": نوع تراکنش",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            fontFamily: PersianFonts.Vazir.fontFamily),
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
                        onPressed: updateData,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 66, 73, 152),
                          fixedSize: const Size(120, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          'ذخیره',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
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
