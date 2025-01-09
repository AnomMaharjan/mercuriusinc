import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:mercuriusinc/model/employee_status.dart';
import 'package:mercuriusinc/widgets/calendar.dart';
import 'package:mercuriusinc/widgets/custom_appbar.dart';
import 'package:mercuriusinc/widgets/time_card.dart';
import 'package:http/http.dart' as http;
import '../widgets/schedule_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DateTime _selectedDate = DateTime.now();
  EmployeeStatus? employeeStatus;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<EmployeeStatus> _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      var data = await http.get(Uri.parse(dotenv.env["BASE_URL"]!));
      if (data.statusCode == 200) {
        employeeStatus = EmployeeStatus.fromJson(jsonDecode(data.body)[0]);
      }
      return employeeStatus!;
    } catch (e) {
      throw Exception(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light),
      sized: false,
      child: SafeArea(
        child: Stack(
          children: [
            Scaffold(
              appBar: CustomAppbar(
                initials:
                    _isLoading ? "" : "(${employeeStatus!.empinitials ?? ""})",
                name: _isLoading
                    ? ""
                    : "${employeeStatus?.empFirstName ?? ""} ${employeeStatus?.empLastName ?? ""}",
              ),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 30,
                      children: [
                        ScheduleCard(
                          color: Colors.green,
                          title: "Schedule",
                          textColor: Colors.white,
                          decorationColor: Colors.white,
                        ),
                        ScheduleCard(
                          color: Colors.grey,
                          title: "Dashboard",
                          textColor: Colors.black,
                          decorationColor: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ScheduleCard(
                          color: Colors.green,
                          title: "Daily Schedule",
                          fontSize: 20,
                          textColor: Colors.black,
                          decorationColor: Colors.black,
                        ),
                        ScheduleCard(
                          color: Colors.grey,
                          title: "Weekly Schedule",
                          fontSize: 20,
                          textColor: Colors.black,
                          decorationColor: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Calendar(),
                    Row(
                      spacing: 4,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${DateFormat('MM/dd/yyyy').format(_selectedDate)},",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(DateFormat('EEEE').format(_selectedDate),
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TimeCard()
                  ],
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                    vertical: 8.0), // Add padding around the navbar
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors
                        .white, // Background color of the Bottom Navigation Bar
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: 0,
                    onTap: (index) {},
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.date_range),
                        label: 'Schedule',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.note),
                        label: 'Submit\nRequest',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.schedule),
                        label: 'Time Tracking',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.note_add_outlined),
                        label: 'Submit\nTimesheet',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (_isLoading)
              Positioned.fill(
                child: Container(
                  color: Colors.black54, // Background color for overlay
                  child: Center(
                    child: CircularProgressIndicator(), // Loader
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
