import 'package:flutter/material.dart';
import 'inputs_provider.dart'; 

class ListForage extends StatelessWidget {
  final ForageData data;

  ListForage({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de Forage'),
      ),
            floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${data.name}',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.location_on, size: 20),
                SizedBox(width: 8),
                Text('${data.location}'),
              ],
            ),
            Divider(height: 25),
            Row(
              children: [
                Icon(Icons.note, size: 20),
                SizedBox(width: 8),
                Text('${data.notes}'),
              ],
            ),
            Divider(height: 25),
            Row(
              children: [
                Icon(Icons.check, size: 20),
                SizedBox(width: 8),
                Text('Estado: ${data.isChecked ? 'Activo' : 'Inactivo'}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
