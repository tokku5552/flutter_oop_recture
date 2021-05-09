import 'package:flutter/material.dart';
import 'package:flutter_oop_recture/domain/storage_repository_base.dart';
import 'package:flutter_oop_recture/infrastracture/storage_repository.dart';
import 'package:flutter_oop_recture/presentation/UI/counter_model.dart';
import 'package:flutter_oop_recture/presentation/UI/counter_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<StorageRepositoryBase>(
          create: (BuildContext context) => StorageRepository(),
        ),
        ChangeNotifierProvider<CounterModel>(
          create: (BuildContext context) => CounterModel(
              storageRepository: context.read<StorageRepositoryBase>())
            ..init(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CounterPage(),
    );
  }
}
