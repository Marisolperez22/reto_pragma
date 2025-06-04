import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../providers/item_provider.dart';

class DetailsScreen extends StatelessWidget {
  final int index;

  const DetailsScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final item = context.watch<ItemProvider>().items[index];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalle del Item',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 1.2),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'Título:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    item.title,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Descripción:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    item.description,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: Icon(Icons.edit, size: 25,),
                    label: Text('Editar', style: TextStyle(fontSize: 18),),
                    onPressed: () => context.push('/form/$index'),
                  ),
                  ElevatedButton.icon(
                    icon: Icon(Icons.delete, color: Colors.white, size: 25,),
                    label: Text(
                      'Eliminar',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      context.read<ItemProvider>().deleteItem(index);
                      context.pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
