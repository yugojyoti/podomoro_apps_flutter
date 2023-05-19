import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:podomoro_apps/provider_service/timer_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Podomoro Timer",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const Icon(Icons.menu),
        actions: [const Icon(Icons.more_vert)],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Consumer<TimerProvider>(builder: (context, provider, child) {
              return provider.isBreak
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red,
                      ),
                      child: const Text("Break Time",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.deepPurple,
                      ),
                      child: const Text(
                        "Work Time",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
            }),
          ),
          const SizedBox(
            height: 100,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Consumer<TimerProvider>(builder: (context, provider, child) {
                return Center(
                  child: CircularPercentIndicator(
                    radius: 100,
                    lineWidth: 20,
                    percent: provider.barValue,
                    progressColor:
                        provider.isBreak ? Colors.red : Colors.deepPurple,
                    backgroundColor: provider.isBreak
                        ? Colors.red.shade100
                        : Colors.deepPurple.shade100,
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                );
              }),
              Consumer<TimerProvider>(builder: (context, provider, child) {
                return Text(
                  provider.start.toString().padLeft(2, '0') +
                      " : " +
                      provider.startSec.toString().padLeft(2, '0'),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                );
              }),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ElevatedButton(
                  onPressed: () {
                    provider.setStart(5);
                  },
                  child: const Text(
                    "5",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    provider.setStart(10);
                  },
                  child: const Text(
                    "10",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    provider.setStart(20);
                  },
                  child: const Text(
                    "20",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    provider.setStart(30);
                  },
                  child: const Text(
                    "30",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    provider.setStart(40);
                  },
                  child: const Text(
                    "40",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                    onPressed: () {
                      provider.setStart(50);
                    },
                    child: const Text(
                      "50",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple)),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    provider.setStart(60);
                  },
                  child:
                      const Text("60", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  provider.resetTimer();
                },
                child: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  provider.startTimer();
                },
                child: const Icon(
                  Icons.pause,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  provider.stopTimer();
                },
                child: const Icon(
                  Icons.stop,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple),
              )
            ],
          )
        ],
      ),
    );
  }
}
