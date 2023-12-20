import 'package:flutter/material.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';
import 'package:persian_fonts/persian_fonts.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({super.key});

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LinearDatePicker(
              startDate: "1390/1/1",
              endDate: "1410/01/14",
              initialDate: "1402/05/05",
              addLeadingZero: true,
              dateChangeListener: (String selectedDate) {
                Navigator.of(context).pop(selectedDate);
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
}
