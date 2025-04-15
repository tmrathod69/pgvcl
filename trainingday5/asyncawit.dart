import 'dartasync';

void main() {
  print(Start);

 
  fetchData();

  print(End);
}


Futurevoid fetchData() async {
  print(Fetching data...);


  await Future.delayed(Duration(seconds 3));


  print(Data fetched successfully!);
}