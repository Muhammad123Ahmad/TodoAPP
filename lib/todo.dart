import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/todo_provider.dart';

class Notes_Screen extends StatelessWidget {
  const Notes_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text('TODO APP',
                  style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 22))),
          backgroundColor: Colors.yellow,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            myDialog(context, provider);
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: provider.titiles.length,
            itemBuilder: (context, index) {
              return Card(
                child: Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        provider.titiles[index],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade800),
                      ),
                      Text(
                        provider.description[index],
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.shade700),
                      )
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        provider.deleteNote(index);
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.grey.shade800,
                      )),
                ]),
              );
            }),
      );
    });
  }
}

Future<void> myDialog(BuildContext context, NotesProvider provider) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          backgroundColor: Colors.yellow.shade100,
          title: Text('Add Note'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancle')),
            TextButton(
                onPressed: () {
                  provider.addNote();
                  Navigator.pop(context);
                  provider.titileController.clear();
                  provider.descriptionController.clear();
                },
                child: Text('Add')),
          ],
          content: Column(
            children: [
              TextFormField(
                controller: provider.titileController,
                decoration: const InputDecoration(hintText: 'Title '),
              ),
              TextFormField(
                controller: provider.descriptionController,
                maxLines: null,
                decoration: const InputDecoration(hintText: 'Desrciption '),
              ),
            ],
          ),
        );
      });
}
