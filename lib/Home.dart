import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController expense = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  List<String> names = [];
  String result = '';

  void addName() {
    setState(() {
      if (nameController.text.isNotEmpty) {
        names.add(nameController.text);
        nameController.clear();
      }
    });
  }

  void split() {
    double a = double.tryParse(expense.text) ?? 0;
    int b = names.length;

    if (b != 0) {
      double _result = a / b;
      setState(() {
        result = _result.toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          'Expense Splitting App',
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey[200]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Name',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey[200]),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        fillColor: Colors.blueGrey,
                        filled: true,
                        hintText: 'Enter name',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blueGrey.shade300, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        border: const OutlineInputBorder()),
                  ),
                ),
                IconButton(
                  onPressed: addName,
                  icon: Icon(
                    Icons.add_circle_outline_outlined,
                    color: Colors.blueGrey[200],
                    size: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Expense',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey[200]),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: expense,
              decoration: InputDecoration(
                  fillColor: Colors.blueGrey,
                  filled: true,
                  hintText: 'Enter Expense',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueGrey.shade300, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  border: const OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  split();
                },
                child: Container(
                  width: 150,
                  height: 45,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0.0, 5.0)),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey[800]),
                  child: Center(
                    child: Text(
                      'Split',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.blueGrey[400]),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: names.length,
              itemBuilder: (context, index) {
                return Text(
                  "${names[index]} : $result",
                  style: TextStyle(color: Colors.blueGrey[200], fontSize: 18),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
