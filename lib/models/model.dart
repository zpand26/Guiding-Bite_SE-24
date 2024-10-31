import 'dart:collection';


class AppModel {
  //sample method to fetch or proccess data
  Future<String> fetchData() async {
    //simulating a data fetch or api call
    await Future.delayed(Duration(seconds: 2));
    return "Hello from Model!";

  }

  List<int> _solidCalories = [];
  List<int> _liquidCalories = [];

  //add solid calories to the list
  void addSolidCalories(int calorie){
    _solidCalories.add(calorie);
  }

  //add liquid calories to the list
  void addLiquidCalories(int calorie){
    _liquidCalories.add(calorie);
  }

  //get total solid calories
  int getTotalSolidCalories(){
    return _solidCalories.fold(0, (total,current) => total + current);
  }

  //get total liquid calories
  int getTotalLiquidCalories(){
    return _liquidCalories.fold(0, (total,current) => total + current);
  }

  //get the total calorie count
  int getTotalCalories(){
    return (getTotalLiquidCalories() + getTotalSolidCalories());
  }

  List<int> monCalories = [];
  List<int> tueCalories = [];
  List<int> wedCalories = [];
  List<int> thuCalories = [];
  List<int> friCalories = [];
  List<int> satCalories = [];
  List<int> sunCalories = [];

  //add calories to the list
  void addDailyCalories(int calorie, String day) {
    switch (day) {
      case 'mon':
        monCalories.add(calorie);
      case 'tue':
        tueCalories.add(calorie);
      case 'wed':
        wedCalories.add(calorie);
      case 'thu':
        thuCalories.add(calorie);
      case 'fri':
        friCalories.add(calorie);
      case 'sat':
        satCalories.add(calorie);
      case 'sun':
        sunCalories.add(calorie);
        break;
    }
  }


    List<int> getDailyCalories() {
    List<int> tempList = [];
    tempList.add(monCalories.fold(0, (total,current) => total + current));
    tempList.add(tueCalories.fold(0, (total,current) => total + current));
    tempList.add(wedCalories.fold(0, (total,current) => total + current));
    tempList.add(thuCalories.fold(0, (total,current) => total + current));
    tempList.add(friCalories.fold(0, (total,current) => total + current));
    tempList.add(satCalories.fold(0, (total,current) => total + current));
    tempList.add(sunCalories.fold(0, (total,current) => total + current));

     return tempList;

  }

  //get the list of all calorie entries
  /*List<int> getAllCalorieEntries(){
    return _calories;
  }*/

/* List<int> _monCalories = [];
  List<int> _tueCalories = [];
  List<int> _wedCalories = [];
  List<int> _thuCalories = [];
  List<int> _friCalories = [];
  List<int> _satCalories = [];
  List<int> _sunCalories = [];


  void addCaloriesForDay(String day, int dayCalorie) {
    switch (day) {
      case
  }


  getSpecificDay() {} */


}