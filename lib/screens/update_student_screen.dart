

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kiu_sqlite/db/database_helper.dart';

import '../models/student.dart';
import '../widgets/custom_tf.dart';

class UpdateStudentScreen extends StatefulWidget {
  final Map<String, dynamic> student;
  const UpdateStudentScreen({super.key, required this.student});

  @override
  State<UpdateStudentScreen> createState() => _UpdateStudentScreenState();
}

class _UpdateStudentScreenState extends State<UpdateStudentScreen> {

  var nameC = TextEditingController();
  var courseC = TextEditingController();
  var mobileC = TextEditingController();
  var totalFeeC = TextEditingController();
  var feePaidC = TextEditingController();

  @override
  void initState() {

    nameC.text = widget.student['name'];
    courseC.text = widget.student['course'];
    mobileC.text = widget.student['mobile'];
    totalFeeC.text = widget.student['totalFee'].toString();
    feePaidC.text = widget.student['feePaid'].toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Update Student'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CustomTF(controller: nameC, hintText: 'Name',),

            const SizedBox(height: 16,),
            CustomTF(controller: courseC, hintText: 'Course',),
            const SizedBox(height: 16,),

            CustomTF(controller: mobileC, hintText: 'Mobile',),

            const SizedBox(height: 16,),
            CustomTF(controller: totalFeeC, hintText: 'Total Fee',),
            const SizedBox(height: 16,),

            CustomTF(controller: feePaidC, hintText: 'Fee Paid',),

            const SizedBox(height: 16,),
            ElevatedButton(onPressed: () async {

              String name = nameC.text.trim();
              String course = courseC.text.trim();
              String mobile = mobileC.text.trim();
              String tf = totalFeeC.text.trim();
              String fp = feePaidC.text.trim();

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
                id: widget.student['id'],
                name: name,
                course: course,
                mobile: mobile,
                totalFee: int.parse(tf),
                feePaid: int.parse(fp),
              );


              int result = await DatabaseHelper.instance.updateStudent(s);

              if (result > 0) {
                Fluttertoast.showToast(
                    msg: 'Record Updated $result',
                    backgroundColor: Colors.green);

                Navigator.of(context).pop(true);

              } else {
                Fluttertoast.showToast(
                    msg: 'Something went wrong',
                    backgroundColor: Colors.red);
              }

            }, child: const Text('Update')),
            const SizedBox(height: 16,),


          ],
        ),
      ),

    );
  }
}
