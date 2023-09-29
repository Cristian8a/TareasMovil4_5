import 'package:app_forage/inpts_otlnd.dart';
import 'package:app_forage/inputs_provider.dart';
import 'package:app_forage/list_f.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final inputsProvider = context.watch<InputsProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Forage'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TextInputs()),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: inputsProvider.savedData.length,
        itemBuilder: (context, index) {
          final data = inputsProvider.savedData[index];
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ListForage(data: data),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(
                    '${data.name}',
                    style: TextStyle(fontSize: 25),
                  ),
                  subtitle: Text(
                    '${data.location}',
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Checkbox(
                    value: data.isChecked,
                    onChanged: null,
                  ),
                ),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
