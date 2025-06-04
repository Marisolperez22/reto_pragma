import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../providers/item_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.watch<ItemProvider>().items;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Listado de tarjetas',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body:
          items.isEmpty
              ? Center(child: Text('No hay tarjetas'))
              : Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Card(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          item.description,
                          style: TextStyle(fontSize: 16),
                        ),
                        onTap: () => context.push('/details/$index'),
                      ),
                    );
                  },
                ),
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/form'),
        child: Icon(Icons.add),
      ),
    );
  }
}
