import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodapp/model/meal.dart';
import 'package:foodapp/view/navBarPages/home.dart';
import 'package:foodapp/view_model/mainProvider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  String? foodName;
  String? foodAbout;
  TextEditingController controlFoodName = TextEditingController();
  TextEditingController controlFoodAbout = TextEditingController();

  File? _selectImage;

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider = Provider.of<MainProvider>(context,listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 46,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text("Cancel",style:  TextStyle(fontWeight: FontWeight.w700,fontSize: 17,color: Color(0xffFF6464)),),),
                  const Text("1/2",style:  TextStyle(fontWeight: FontWeight.w700,fontSize: 17,color: Color(0xff9FA5C0)),),
                ],
              ),
              const SizedBox(height: 32,),
              Container(
                child: InkWell(
                  onTap:  () {
                    _imageUpload();
                  },
                  child:_selectImage != null ? Image.file(_selectImage!,width: 327,height: 161,) : Image.asset("assets/images/cover.png"),
                ),
              ),
             // _selectImage != null ? Image.file(_selectImage!) : Image.asset("assets/images/cover.png"),
              const SizedBox(height: 24,),
              const Text("Food Name",style:  TextStyle(fontWeight: FontWeight.w700,fontSize: 17,color: Color(0xff3E5481)),),
              const SizedBox(height: 10,),
              TextField(
                onChanged: (text) {
                  mainProvider.setName(text);
                },
                decoration: InputDecoration(
                  hintText: "Enter food namme",
                  hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xff9FA5C0)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(color: Color(0xffD0DBEA), width: 1.0),
                  ),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffD0DBEA)),
                      borderRadius: BorderRadius.circular(32)
                  ),
                ),
                controller: controlFoodName,
              ),
              const SizedBox(height: 20,),
              const Text("Description",style:  TextStyle(fontWeight: FontWeight.w700,fontSize: 17,color: Color(0xff3E5481)),),
              const SizedBox(height: 10,),
              SizedBox(
                height: 80,width: double.infinity,
                child: TextField(
                  onChanged: (text) {
                    mainProvider.setDesc(text);
                  },
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Tell a little about your food",
                    hintStyle: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xff9FA5C0),letterSpacing: 1.2),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xffD0DBEA), width: 1.0),
                    ),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffD0DBEA)),
                        borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                  controller: controlFoodAbout,
                ),
              ),
              const SizedBox(height: 24,),
              const Row(
                children: [
                  Text("Cooking Duration",style:  TextStyle(fontWeight: FontWeight.w700,fontSize: 17,color: Color(0xff3E5481)),),
                  //const SizedBox(height: 10,),
                  Text(" (in minutes)",style:  TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color: Color(0xff9FA5C0)),),
                ],
              ),
              const SizedBox(height: 64,),
              InkWell(
                onTap: () async {
                  foodName = await mainProvider.getName();
                  foodAbout = await mainProvider.getDesc();
                  Meal newMeal = Meal(name: foodName,description: foodAbout, time: "60 min",
                      byPerson: "Calum Lewis",imagePerson: "assets/images/calum.png",imageMeal: "assets/images/salad2.png"
                  );
                  if(newMeal.name != null && newMeal.description != null){
                    Meal.MealList.add(newMeal);
                  }
                },
                child:  Image.asset("assets/images/next.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future _imageUpload() async{
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _selectImage = File(returnImage!.path);
    });
  }
}
