import 'package:flutter/material.dart';
import 'package:mali/Views/Auth/login_view.dart';
import 'package:mali/Class/data.dart';
import 'package:mali/Widget/listview.dart';
import 'package:mali/Widget/newpage.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'report_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

final List<Data> registeritem = [];

class _HomeViewState extends State<HomeView> {
  double calincome() {
    double totalIncome = 0;

    for (var i in income) {
      totalIncome += i;
    }
    return totalIncome;
  }

  double calcost() {
    double totalCost = 0;

    for (var i in cost) {
      totalCost += i;
    }
    return totalCost;
  }

  void insertData(Data data) {
    if (selectedchooseList.last == choose[0]) {
      income.add(data.amount);
      cost.add(0);
    } else {
      cost.add(data.amount);
      income.add(0);
    }
    registeritem.add(data);
    balance.add(calincome() - calcost());
    setState(() {});
  }

  void popMenu(value) {
    if (value == 'خروج') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const LoginView();
          },
        ),
      );
    }
  }

  void updateData(Data newData) {
    final index = registeritem.indexWhere((data) => data == newData);
    if (index != -1) {
      registeritem[index] = newData;
    }
    setState(() {});
  }

  int selectedtab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 66, 73, 152),
        centerTitle: true,
        title: const Text('مدیریت مالی', style: PersianFonts.Vazir),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListViewWidget(data: registeritem, onUpdate: updateData),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 66, 73, 152),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        unselectedLabelStyle: PersianFonts.Vazir,
        selectedLabelStyle: PersianFonts.Vazir,
        iconSize: 25,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: selectedtab,
        onTap: (value) {
          setState(() {
            selectedtab = value;
          });

          if (value == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const LoginView();
                },
              ),
            );
          }
          if (value == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Newpage(onsetdata: insertData);
                },
              ),
            );
          }
          if (value == 2) {
            selectedtab = value;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const Report();
                },
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'خروج',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'ثبت اطلاعات ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: 'گزارشات ',
          ),
        ],
      ),
    );
  }
}
