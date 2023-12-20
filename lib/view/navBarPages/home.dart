import 'package:flutter/material.dart';
import 'package:foodapp/model/meal.dart';
import 'package:foodapp/view/details.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 140, width: double.infinity,
          color: Colors.white,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.arrow_back_ios_sharp),
                  Container(
                    height: 56, width: 230,
                    decoration: BoxDecoration(color: const Color(0xfff4f5f7),borderRadius: BorderRadius.circular(32)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.search),
                        Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: SizedBox(
                              width: 80.0,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            )
                        ),
                        Icon(Icons.backspace)
                      ],
                    ),
                  ),
                  Image.asset("assets/images/Filter.png",width: 24,height: 24,)
                ],
              )
            ],
          ),
        ),
        Container(height: 8, color: const Color(0xffF4F5F7),),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: GridView.builder(
                  itemCount: Meal.MealList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 264,
                      crossAxisCount: 2,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 20
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return menu(Meal.MealList[index],index);
                  }
              ),
            )
        ),
      ],
    );
  }
  Widget menu(Meal meal,int index) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(meal: meal, index: index)),);
      },
      child: Container(
        height: 264, width: 151, color: Color(0xffFFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(meal.imagePerson!,height: 31,width: 31,),
                const SizedBox(width: 8,),
                Text(meal.byPerson!,style: const TextStyle(fontSize: 12),),
              ],
            ),
            const SizedBox(height: 16,),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(meal.imageMeal!,height: 151,width: 151,),
            ),
            const SizedBox(height: 16,),
            Text(meal.name!,style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 17,color: Color(0xff3E5481)),),
            const SizedBox(height: 4,),
            Text(meal.time!,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xff9FA5C0)),),
          ],
        ),
      ),
    );
  }
}


