import 'package:counter_bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key});

  int count=0;

  @override
  Widget build(BuildContext context) {
    final counter=context.read<CounterBloc>();
    return Scaffold(
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
    
          if(state is CounterInitial)
          {
            return Center(child: Text("0"),);
          }
        else if(state is IncreamentState)
        {
          return Center(child: Text(state.count.toString()),);
        }
        else 
        {
          return Center(child: Text(""),);
        }
       
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()
      {
        counter.add(IncreamentEvent(count: ++count));

      },
      
      child: Icon(Icons.add),),
    );
  }
}
