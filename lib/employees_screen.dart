import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sprints_flutter_task_6/employee.dart';
import 'package:http/http.dart' as http;

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  List<Employee> employees = [];
  bool isLoading = false;
  Future<void> getEmployees() async {
    setState(() {
      isLoading = true;
    });
    final url =
        Uri.parse("https://mocki.io/v1/283ba093-9bf9-42e4-8f28-d2538937f9ca");
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          employees = data.map((json) => Employee.fromJson(json)).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load employees');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employees"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(children: [
          ElevatedButton(
            onPressed: getEmployees,
            child: Text("Fetch Employees"),
          ),
          SizedBox(
            height: 30,
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: employees.length,
                      itemBuilder: (context, index) {
                        final employee = employees[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Card(
                            elevation: 5,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Text("${employee.id}"),
                                SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Full name: ${employee.firstName} ${employee.lastName}"),
                                      Text("Age: ${employee.age}"),
                                      Text("E-mail: \n${employee.email}"),
                                      Text(
                                          "Contact Number: ${employee.contactNumber}"),
                                      Text("Salary: ${employee.salary}5000"),
                                      Text("Date of Birth: ${employee.dob}"),
                                      Text("Address: ${employee.address}"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
        ]),
      ),
    );
  }
}
