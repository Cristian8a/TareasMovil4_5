import 'package:app_forage/inputs_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextInputs extends StatelessWidget {
  TextInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forage'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Forage inputs',
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(height: 15.0,),
            TextField(
              controller: context.watch<InputsProvider>().nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Name'),
                prefixIcon: Icon(Icons.person_2_rounded),
              ),
            ),
            SizedBox(height: 24),
            TextField(
              controller: context.watch<InputsProvider>().locationController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Location'),
                prefixIcon: Icon(Icons.location_city),
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Checkbox(
                  value: context.watch<InputsProvider>().isChecked,
                  onChanged: (value) {
                    context.read<InputsProvider>().toggleCheckbox();
                  },
                  activeColor: Colors.green,
                ),
                Text('Currently in season'),
              ],
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: context.watch<InputsProvider>().notesController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Notes'),
                prefixIcon: Icon(Icons.note_add),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  color: Colors.purple,
                  onPressed: () {
                    context.read<InputsProvider>().saveData();
                    ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text("Datos guardados!!"),
                      ),
                    );
                  },
                ),
                SizedBox(width: 16), 
                MaterialButton(
                  child: Text(
                    "Delete",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  color: Colors.purple, 
                  onPressed: () {
                    context.read<InputsProvider>().resetAllControllers();
                    ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text("Datos eliminados correctamente"),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}