import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kiu_sqlite/db/database_helper.dart';
import 'package:kiu_sqlite/screens/student_list_screen.dart';

import '../models/student.dart';
import '../widgets/custom_tf.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  var nameC = TextEditingController();
  var courseC = TextEditingController();
  var mobileC = TextEditingController();
  var totalFeeC = TextEditingController();
  var feePaid = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Add Student',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CustomTF(
              controller: nameC,
              hintText: 'Name',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTF(
              controller: courseC,
              hintText: 'Course',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTF(
              controller: mobileC,
              hintText: 'Mobile',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTF(
              controller: totalFeeC,
              hintText: 'Total Fee',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTF(
              controller: feePaid,
              hintText: 'Fee Paid',
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
                onPressed: () async {
                  String name = nameC.text.trim();
                  String course = courseC.text.trim();
                  String mobile = mobileC.text.trim();
                  String tf = totalFeeC.text.trim();
                  String fp = feePaid.text.trim();

                  // Validation
                  // Front End
                  if (name.isEmpty) {
                    Fluttertoast.showToast(
                      msg: 'Please provide name',
                      backgroundColor: Colors.red,
                    );
                    return;
                  }
                  // Todo: do validations for fields

                  // Object creation
                  Student s = Student(
                    name: name,
                    course: course,
                    mobile: mobile,
                    totalFee: int.parse(tf),
                    feePaid: int.parse(fp),
                  );

                  int result = await DatabaseHelper.instance.saveStudent(s);

                  if (result > 0) {
                    Fluttertoast.showToast(
                        msg: 'Record Saved $result',
                        backgroundColor: Colors.green);
                  } else {
                    Fluttertoast.showToast(
                        msg: 'Something went wrong',
                        backgroundColor: Colors.red);
                  }
                },
                child: const Text('Save')),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const StudentListScreen();
                  }));
                },
                child: const Text('Show All')),
          ],
        ),
      ),
    );
  }
}
