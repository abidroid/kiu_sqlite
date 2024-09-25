import 'package:flutter/material.dart';
import 'package:kiu_sqlite/db/database_helper.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Student List'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
          future: DatabaseHelper.instance.getAllStudents(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Map<String, dynamic>> students = snapshot.data;

              return ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> student = students[index];

                    return Card(
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 100, child: Text('ID')),
                                Text(student['id'].toString()),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 100, child: Text('Name')),
                                Text(student['name']),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 100, child: Text('Course')),
                                Text(student['course']),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 100, child: Text('Mobile')),
                                Text(student['mobile']),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 100, child: Text('Total Fee')),
                                Text(student['totalFee'].toString()),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 100, child: Text('Fee Paid')),
                                Text(student['feePaid'].toString()),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                    ),
                                      onPressed: () {},
                                      child: const Text('Delete')),
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('Update')),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });

              //Map<String, dynamic> student = students[index]
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
