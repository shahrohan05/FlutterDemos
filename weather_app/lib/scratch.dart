/*
 * Some sample code to understand future, async and await in dart.
 * */

main() {
  task1();
  completeTask2And3Sync();
  task4();
}

void completeTask2And3Sync() async {
  String task2Results = await task2();
  task3(task2Results);
}

void task1() {
  var data = "task 1 data";
  print("Task 1 is complete");
}

Future<String> task2() async {
  String result;
  Duration fiveSeconds = Duration(seconds: 5);
  await Future.delayed(fiveSeconds, () {
    result = '"Task 2 Results"';
    print("Task 2 is complete");
  });
  return result;
}

void task3(String task2Data) {
  print("Task 3 is complete with $task2Data");
}

void task4() {
  print("Task 4 is complete.");
}
