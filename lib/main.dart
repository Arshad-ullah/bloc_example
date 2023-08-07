import 'dart:async';

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
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => CounterBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  int count = 0;

  @override
  Widget build(BuildContext context) {
    final counter = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Name list"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondScreen()));
              },
              icon: Icon(Icons.next_plan))
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) 
            {
              if(state is SearchState)
              {
                return Column(
                  children: [

                    TextField(
                      onChanged: (value){
                        counter.add(SearchEvent(name: value));

                      },
                    ),
                    SizedBox(height: 20,),
                    Text(state.name.toString())

                  ],
                );
                
              }
              else 
              {
                return Text("");
              }

            }
              
          ),
        
        
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (counter.nameController.text.trim().isNotEmpty) {
            counter.add(NameEvent(name: counter.nameController.text.trim()));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Empty"),
              ),
            );
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.read<CounterBloc>();

    return Scaffold(
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if (state is NameState) {
                  return ListView.builder(
                    itemCount: state.nameList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Text(state.nameList[index]),
                          trailing: IconButton(
                            onPressed: () {
                              counter.add(NameDeleteEvent(
                                  name: counter.nameList[index]));
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ),
                      );
                    },
                  );
                }

                else 
                {
                  return Container();
                }
        
        },
      ),
    );
  }
}

class TimerCount extends StatefulWidget {
  const TimerCount({super.key});

  @override
  State<TimerCount> createState() => _TimerCountState();
}

class _TimerCountState extends State<TimerCount> {
  int seconds = 0;
  Timer? timer;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        seconds++;
      });
    });
  }

  String formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds ~/ 60) % 60;
    int remainingSeconds = seconds % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Timer Example'),
      ),
      body: Center(
        child: Text(
          formatTime(seconds),
          style: TextStyle(fontSize: 36),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startTimer();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
