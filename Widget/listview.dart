import 'package:flutter/material.dart';
import 'package:mali/Views/report_view.dart';
import 'package:mali/Class/data.dart';
import 'package:mali/Views/edit_view.dart';
import 'package:mali/Widget/newpage.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ListViewWidget extends StatefulWidget {
  final List<Data> data;
  final Function(Data) onUpdate;

  const ListViewWidget({
    Key? key,
    required this.data,
    required this.onUpdate,
  }) : super(key: key);

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  double previousincome = 0;
  double previouscost = 0;
  String? previous;

  double totalnewincome(int mount) {
    double totalincome = 0;
    for (int i = 0; i <= mount; i++) {
      if (widget.data[i].selectedchoose == choose[0]) {
        totalincome += widget.data[i].amount;
      }
    }
    return totalincome;
  }

  double totalnewcost(int mount) {
    double totalcost = 0;
    for (int i = 0; i <= mount; i++) {
      if (widget.data[i].selectedchoose == choose[1]) {
        totalcost += widget.data[i].amount;
      }
    }
    return totalcost;
  }

  void removeData(Data data) {
    final index = widget.data.indexWhere((element) => element == data);
    if (index != -1) {
      widget.data.remove(data);
      income.removeAt(index);
      cost.removeAt(index);
      balance.removeAt(index);

      for (int i = 0; i < balance.length; i++) {
        balance[i] = totalnewincome(i) - totalnewcost(i);
      }
    }
    setState(() {});
  }

  void update(Data newdata) {
    final index = widget.data.indexWhere((element) => element == newdata);
    if (index != -1) {
      widget.data[index] = newdata;
      if (newdata.selectedchoose == choose[1]) {
        income.removeAt(index);
        income.insert(index, 0);
        cost[index] = widget.data[index].amount;
      } else if (newdata.selectedchoose == choose[0]) {
        cost.removeAt(index);
        cost.insert(index, 0);
        income[index] = widget.data[index].amount;
      } else {
        if (newdata.selectedchoose == choose[0]) {
          income[index] = newdata.amount;
        } else if (newdata.selectedchoose == choose[1]) {
          cost[index] = newdata.amount;
        }
      }

      for (int i = 0; i < balance.length; i++) {
        balance[i] = totalnewincome(i) - totalnewcost(i);
        costReport[i] = totalnewcost(i);
        incomeReport[i] = totalnewincome(i);
      }
    }
    setState(() {});
  }

  // NEW METHOD for Edit functionality
  void editData(Data data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditView(
          data: data,
          dataApp: (newData) {
            update(newData);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.data.length,
      itemBuilder: (context, index) {
        final data = widget.data[index];
        return Card(
          margin: const EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              color: Color.fromARGB(255, 90, 100, 211),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      data.title.toUpperCase(),
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: PersianFonts.Vazir.fontFamily,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    Text(
                      data.selectedchoose,
                      style:
                          TextStyle(fontFamily: PersianFonts.Vazir.fontFamily),
                    ),
                    Icon(
                      data.selectedchoose == choose[0]
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                      color: data.selectedchoose == choose[0]
                          ? Colors.green
                          : Colors.red,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  data.from,
                  style: TextStyle(
                      fontFamily: PersianFonts.Vazir.fontFamily, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'ریال',
                      style:
                          TextStyle(fontFamily: PersianFonts.Vazir.fontFamily),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      data.amount.toString().toPersianDigit().seRagham(),
                      style: TextStyle(
                        fontFamily: PersianFonts.Vazir.fontFamily,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      data.date.toPersianDigit(),
                      style:
                          TextStyle(fontFamily: PersianFonts.Vazir.fontFamily),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        removeData(data);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 90, 100, 211),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        editData(
                          data,
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Color.fromARGB(255, 90, 100, 211),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
