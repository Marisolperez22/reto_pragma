import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'providers/item_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => ItemProvider(), child: MyApp()));
}
