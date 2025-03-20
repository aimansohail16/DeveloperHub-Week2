import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Task",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 8, right: 8),
        child: Column(
          children: [
            TextFormField(
              controller: taskController,
              decoration: InputDecoration(
                label: Text(
                  "To Do Task",
                  style: TextStyle(fontSize: 25, color: Colors.black54),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              height: 70,
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shadowColor: Colors.black87,
                  elevation: 10,
                ),
                onPressed: () {
                  if (taskController.text.isNotEmpty) {
                    Navigator.pop(context, taskController.text);
                  }
                },
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
