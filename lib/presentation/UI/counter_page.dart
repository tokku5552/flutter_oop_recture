import 'package:flutter/material.dart';
import 'package:flutter_oop_recture/common/util.dart';
import 'package:flutter_oop_recture/presentation/UI/counter_model.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: ChangeNotifierProvider<CounterModel>(
        create: (_) => CounterModel(),
        child: Consumer<CounterModel>(
          builder: (BuildContext context, CounterModel model, Widget child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${model.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('pushed!');
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
