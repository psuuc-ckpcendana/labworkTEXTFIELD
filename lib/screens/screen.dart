import 'package:flutter/material.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});
  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}
class _TextFieldScreenState extends State<TextFieldScreen> {

  var item = TextEditingController();
  List<String> todoItems = [];

  void deleteItem(int index){
setState(() {
      todoItems.removeAt(index);
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextField"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: item,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('To Do Items'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            todoItems.add(item.text);
                          });
                        },
                        child: const Text('Add')),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          todoItems.clear();
                        });
                      },
                      child: const Text("RESET"),),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: todoItems.length,
                  itemBuilder: (context, index) => TodoItem(index + 1, todoItems[index], deleteItem: () => deleteItem(index)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TodoItem extends StatelessWidget {
  TodoItem(this.index, this.item, {required this.deleteItem, super.key});

  String item;
  int index;
  final VoidCallback deleteItem;

  @override
  Widget build(BuildContext context) {

 final cardBG = index % 2 == 0 ? Colors.red.shade100 : Colors.blue.shade100;

    return Card(
      elevation: 15,
        child: ListTile(
          tileColor: cardBG,
          title: Text(
            item,
            style: const TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          leading: CircleAvatar(
            child: Text('$index'),
          ),
          trailing: IconButton(
              onPressed: deleteItem,
              icon: const Icon(
                Icons.delete_forever_outlined,
                color: Colors.red,
              )),
        ),
      );
  }
}
