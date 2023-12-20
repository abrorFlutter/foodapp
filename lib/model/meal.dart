class Meal {
  String? name;
  String? description;
  String? imageMeal;
  String? imagePerson;
  String? byPerson;
  String? time;

  Meal({this.name,this.description,this.imageMeal,this.imagePerson,this.byPerson,this.time,});

  static List<Meal> MealList = [
    Meal(name: "Pancake",description: "Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your",imageMeal: "assets/images/pancake1.png", imagePerson: "assets/images/calum.png",byPerson: "Calum Lewis",time: "60 min"),
    Meal(name: "Salad",description: "Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your",imageMeal: "assets/images/salad1.png", imagePerson: "assets/images/elif.png",byPerson: "Eilif Sonas",time: "60 min"),
    Meal(name: "Pancake",description: "Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your",imageMeal: "assets/images/pancake2.png", imagePerson: "assets/images/elena.png",byPerson: "Elena Shelby",time: "60 min"),
    Meal(name: "Salad",description: "Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your",imageMeal: "assets/images/salad2.png", imagePerson: "assets/images/john.png",byPerson: "John Priyadi",time: "60 min"),
  ];

}