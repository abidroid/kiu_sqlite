
import 'package:flutter/material.dart';
import 'package:kiu_sqlite/screens/student_list_screen.dart';

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
        title: const Text('Add Student'),),

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

            CustomTF(controller: feePaid, hintText: 'Fee Paid',),

            const SizedBox(height: 16,),
            ElevatedButton(onPressed: (){}, child: const Text('Save')),
            const SizedBox(height: 16,),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return const StudentListScreen();
              }));
            }, child: const Text('Show All')),

          ],
        ),
      ),
    );
  }
}

