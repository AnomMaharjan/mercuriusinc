import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Icon(
                  Icons.calendar_month_rounded,
                  color: Colors.blue,
                ),
              )),
          SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 10,
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  "Date",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('EEE, MMMM d, yyyy').format(DateTime.now()),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_drop_up)
                    ],
                  ),
                ),
                // Embedded Calendar
                TableCalendar(
                  rowHeight: 40,
                  focusedDay: _focusedDate,
                  firstDay: DateTime(2000),
                  lastDay: DateTime(2100),
                  calendarFormat: CalendarFormat.month,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDate, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDate = selectedDay;
                      _focusedDate = focusedDay;
                    });
                  },
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Cancel Button
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedDate = DateTime.now(); // Reset to today
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Selection Canceled')),
                        );
                      },
                      child: Text(
                        'CANCEL',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    // OK Button
                    TextButton(
                      onPressed: () {
                        // Perform an action with the selected date
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                            'Date Confirmed: ${_selectedDate.toLocal()}',
                          )),
                        );
                      },
                      child: Text('OK', style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
