import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../models/item.dart';
import '../providers/item_provider.dart';

class FormScreen extends StatefulWidget {
  final int? index; 

  const FormScreen({super.key, this.index});

  @override
  FormScreenState createState() => FormScreenState();
}

class FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      final item = context.read<ItemProvider>().items[widget.index!];
      _titleController.text = item.title;
      _descController.text = item.description;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final item = Item(
        title: _titleController.text,
        description: _descController.text,
      );
      final provider = context.read<ItemProvider>();

      if (widget.index == null) {
        provider.addItem(item);
      } else {
        provider.updateItem(widget.index!, item);
      }
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.index != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Editar Item' : 'Agregar Item')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Título'),
                validator: (value) =>
                    value!.isEmpty ? 'Campo requerido' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descController,
                decoration: InputDecoration(labelText: 'Descripción'),
                validator: (value) =>
                    value!.isEmpty ? 'Campo requerido' : null,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _submit,
                child: Text(isEditing ? 'Actualizar' : 'Agregar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
