import 'dart:convert';

List<EmployeeStatus> employeeStatusFromJson(String str) =>
    List<EmployeeStatus>.from(
        json.decode(str).map((x) => EmployeeStatus.fromJson(x)));

class EmployeeStatus {
  int? id;
  int? bidscheduleid;
  int? managerid;
  dynamic supervisorid;
  int? empid;
  dynamic caregiverid;
  int? seniorityRank;
  String? empFirstName;
  String? empLastName;
  String? empinitials;
  dynamic caregiverFirstName;
  dynamic caregiverLastName;
  dynamic caregiverinitials;
  int? phone;
  int? areaid;
  int? locationid;
  int? year;
  DateTime? date;
  int? time;
  int? duration;
  dynamic rdoDayOff;
  bool? notesPresent;
  int? shiftMoveCount;
  bool? pendingLeaveRequests;
  bool? employeeStatus;
  int? overtimeCount;
  double? overtimeDuration;
  int? overtimeStarttime;
  dynamic leaveType;
  double? leaveDuration;
  dynamic leaveStatus;

  EmployeeStatus({
    this.id,
    this.bidscheduleid,
    this.managerid,
    this.supervisorid,
    this.empid,
    this.caregiverid,
    this.seniorityRank,
    this.empFirstName,
    this.empLastName,
    this.empinitials,
    this.caregiverFirstName,
    this.caregiverLastName,
    this.caregiverinitials,
    this.phone,
    this.areaid,
    this.locationid,
    this.year,
    this.date,
    this.time,
    this.duration,
    this.rdoDayOff,
    this.notesPresent,
    this.shiftMoveCount,
    this.pendingLeaveRequests,
    this.employeeStatus,
    this.overtimeCount,
    this.overtimeDuration,
    this.overtimeStarttime,
    this.leaveType,
    this.leaveDuration,
    this.leaveStatus,
  });

  factory EmployeeStatus.fromJson(Map<String, dynamic> json) => EmployeeStatus(
        id: json["id"],
        bidscheduleid: json["bidscheduleid"],
        managerid: json["managerid"],
        supervisorid: json["supervisorid"],
        empid: json["empid"],
        caregiverid: json["caregiverid"],
        seniorityRank: json["seniorityRank"],
        empFirstName: json["empFirstName"],
        empLastName: json["empLastName"],
        empinitials: json["empinitials"],
        caregiverFirstName: json["caregiverFirstName"],
        caregiverLastName: json["caregiverLastName"],
        caregiverinitials: json["caregiverinitials"],
        phone: json["phone"],
        areaid: json["areaid"],
        locationid: json["locationid"],
        year: json["year"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"],
        duration: json["duration"],
        rdoDayOff: json["rdoDayOff"],
        notesPresent: json["notesPresent"],
        shiftMoveCount: json["shiftMoveCount"],
        pendingLeaveRequests: json["pendingLeaveRequests"],
        employeeStatus: json["employeeStatus"],
        overtimeCount: json["overtimeCount"],
        overtimeDuration: json["overtimeDuration"],
        overtimeStarttime: json["overtimeStarttime"],
        leaveType: json["leaveType"],
        leaveDuration: json["leaveDuration"],
        leaveStatus: json["leaveStatus"],
      );
}
