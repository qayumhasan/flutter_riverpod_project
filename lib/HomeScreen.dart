import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterapp/dataprovider/data_provider.dart';
import 'package:flutterapp/models/user_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
        ),
        body: Container(
          child: _data.when(
              data: ((data) => Container(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 0,
                          child: ListTile(
                            title: Text(data[index].title.toString()),
                            subtitle: Text(data[index].completed.toString()),
                          ),
                        );
                      },
                    ),
                  )),
              error: (err, s) => Text(err.toString()),
              loading: () => Center(
                    child: CircularProgressIndicator(),
                  )),
        ));
  }
}
