import 'package:mali/Views/home_view.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../Widget/newpage.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

List costReport = [];
List incomeReport = [];

class _ReportState extends State<Report> {
  String? selectedTab;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 66, 73, 152),
        centerTitle: true,
        title: Text(
          'گزارش',
          style: TextStyle(
            fontFamily: PersianFonts.Vazir.fontFamily,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 400,
              height: 45,
              margin: const EdgeInsets.fromLTRB(10, 15, 10, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            selectedTab = 'هزینه';
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedTab == 'هزینه'
                              ? const Color.fromARGB(255, 165, 171, 237)
                              : null,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                        width: 100,
                        child: Center(
                          child: Text(
                            'هزینه',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: PersianFonts.Vazir.fontFamily,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            selectedTab = 'درامد';
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedTab == 'درامد'
                              ? const Color.fromARGB(255, 165, 171, 237)
                              : null,
                        ),
                        width: 100,
                        child: Center(
                          child: Text(
                            'درامد',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: PersianFonts.Vazir.fontFamily,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedTab = 'همه';
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedTab == 'همه'
                              ? const Color.fromARGB(255, 165, 171, 237)
                              : null,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        width: 100,
                        child: Center(
                          child: Text(
                            'همه',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: PersianFonts.Vazir.fontFamily,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (selectedTab == 'همه')
              registeritem.isEmpty
                  ? Center(
                      child: Text(
                        'هنوز اطلاعاتی ثبت نشده است',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: PersianFonts.Vazir.fontFamily,
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: registeritem.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.fromLTRB(10, 20, 10, 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 90, 100, 211),
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'عنوان: ${registeritem[index].title}',
                                  style: PersianFonts.Vazir,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'درامد: ${income[index].toString().toPersianDigit().seRagham()} ریال',
                                  style: PersianFonts.Vazir,
                                ),
                                Text(
                                  'هزینه: ${cost[index].toString().toPersianDigit().seRagham()} ریال',
                                  style: PersianFonts.Vazir,
                                ),
                                Text(
                                  'مانده: ${balance[index].toString().toPersianDigit().seRagham()} ریال',
                                  style: PersianFonts.Vazir,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            if (selectedTab == 'درامد')
              registeritem.isEmpty
                  ? Center(
                      child: Text(
                        'هنوز اطلاعاتی ثبت نشده است',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: PersianFonts.Vazir.fontFamily,
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: registeritem.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.fromLTRB(10, 20, 10, 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 90, 100, 211),
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'عنوان: ${registeritem[index].title}',
                                      style: PersianFonts.Vazir,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'مجموع: ${incomeReport[index].toString().toPersianDigit().seRagham()} ریال',
                                          style: PersianFonts.Vazir,
                                        ),
                                        Text(
                                          'درامد: ${income[index].toString().toPersianDigit().seRagham()} ریال',
                                          style: PersianFonts.Vazir,
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            if (selectedTab == 'هزینه')
              registeritem.isEmpty
                  ? Center(
                      child: Text(
                        'هنوز اطلاعاتی ثبت نشده است',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: PersianFonts.Vazir.fontFamily,
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: registeritem.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.fromLTRB(10, 20, 10, 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 90, 100, 211),
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'عنوان: ${registeritem[index].title}',
                                      style: PersianFonts.Vazir,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'مجموع: ${costReport[index].toString().toPersianDigit().seRagham()} ریال',
                                          style: PersianFonts.Vazir,
                                        ),
                                        Text(
                                          'هزینه:${cost[index].toString().toPersianDigit().seRagham()} ریال',
                                          style: PersianFonts.Vazir,
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
          ],
        ),
      ),
    );
  }
}
