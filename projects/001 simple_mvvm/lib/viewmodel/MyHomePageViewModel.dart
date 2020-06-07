import 'package:simple_mvvm/viewmodel/baseModel.dart';

class MyHomePageViewModel extends BaseModel{
  int _counter = 0; // rivate variable
  int get getCounter => _counter;


// Increasing the counter
  void incrementCounter() {
      _counter++;
    notifyListeners();
  }

  //Decresing the counter
   void decrementCounter() {
      _counter--;
    notifyListeners();
  }

}