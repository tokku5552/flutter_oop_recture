import 'package:flutter/material.dart';
import 'package:flutter_oop_recture/common/util.dart';
import 'package:flutter_oop_recture/presentation/UI/counter_model.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterModel>(
      create: (_) => CounterModel()..init(),
      child: Consumer<CounterModel>(
        builder: (BuildContext context, CounterModel model, Widget child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(appTitle),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${model.count}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                model.increment();
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
