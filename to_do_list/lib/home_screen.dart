import 'package:flutter/material.dart';
import 'package:to_do_list/add_task.dart';
import 'package:to_do_list/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> task = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    task = await TaskStorage.getValue();
    setState(() {});
  }

  Future<void> _navigateToAddTask() async {
    final String? newTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTask()),
    );

    if (newTask != null) {
      setState(() {
        task.add(newTask);
      });
      await TaskStorage.saveValue(task);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To-Do-List",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: task.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(task[index]));
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddTask,
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
