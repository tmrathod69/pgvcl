import 'dart:async';

// Simulating a Future that fetches weather data
Future<String> fetchWeatherData() async 
{
  print('Fetching weather data...');
  await Future.delayed(Duration(seconds: 2)); // Simulate network delay
  return 'Sunny, 25°C';
}

// Simulating a Stream that provides weather updates every 3 seconds
Stream<String> weatherUpdates() async* 
{
  List<String> weatherConditions =
    ['Sunny, 25°C', 'Cloudy, 22°C', 'Rainy, 18°C'];
  int index = 0;

  while (true) {
    await Future.delayed(Duration(seconds: 3));
    yield weatherConditions[index % weatherConditions.length];
    index++;
  }
}

Future<void> main() async 
{
  // Using Future with async and await
  String weather = await fetchWeatherData();
  print('Initial Weather: $weather');

  // Using Stream to listen to weather updates
  Stream<String> weatherStream = weatherUpdates();
  await for (var update in weatherStream.take(5)) {
    print('Weather Update: $update');
  }
}