import 'dart:async';

// Simulating an asynchronous function that fetches user data
Future<String> fetchUserData() async {
  print('Fetching user data...');
  await Future.delayed(Duration(seconds: 3)); // Simulate a network delay
  return 'User: John Doe, Age: 30';
}

// Simulating another asynchronous task (like processing data)
Future<String> processData(String data) async {
  print('Processing data...');
  await Future.delayed(Duration(seconds: 2)); // Simulate processing time
  return 'Processed Data: $data (Uppercase)';
}

Future<void> main() async {
  // Using async/await to fetch and process data sequentially
  String userData = await fetchUserData();
  print('Fetched Data: $userData');

  String processedData = await processData(userData);
  print(processedData);
}

