import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/model/meal.dart';

class DetailsPage extends StatefulWidget {
  Meal meal;
  int index;
  DetailsPage({super.key,required this.meal,required this.index});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          body: DraggableBottomSheet(
            minExtent: MediaQuery.of(context).size.height * 0.6,
            useSafeArea: false,
            curve: Curves.easeIn,
            previewWidget: _previewWidget(),
            expandedWidget: _expandedWidget(),
            backgroundWidget: _backgroundWidget(),
            maxExtent: MediaQuery.of(context).size.height * 0.62,
            onDragging: (pos) {},
          ),
        );
      }),
    );
  }

  Widget _backgroundWidget() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: Image.asset(widget.meal.imageMeal!),
      ),
    );
  }

  Widget _previewWidget() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: _dragUi(),
    );
  }

  Widget _dragUi() {
    return Column(
      children: <Widget>[
        Container(
          width: 40,
          height: 5,
          decoration: BoxDecoration(
            color: const Color(0xffD0DBEA),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 23),
        const Row(
          children: [
            Text("Cacao Maca Walnut Milk",style:
            TextStyle(fontSize: 17,fontWeight: FontWeight.w700,color: Color(0xff3E5481)),)
          ],
        ),
        const SizedBox(height: 8,),
        Row(
          children: [
            const Text("Food",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xff9FA5C0)),),
            const SizedBox(width: 4,),
            Image.asset("assets/icons/nuqta.png"),
            const SizedBox(width: 4,),
            Text("${widget.meal.time}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xff9FA5C0)),)
          ],
        ),
        const SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(widget.meal.imagePerson!),
                const SizedBox(width: 8,),
                Text(widget.meal.byPerson!,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Color(0xff3E5481)),)
              ],
            ),
            const Row(
              children: [
                Icon(Icons.favorite_border,color: Colors.green,),
                SizedBox(width: 8,),
                Text("123 Likes",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Color(0xff3E5481))),
              ],
            )
          ],
        ),
        const SizedBox(height: 16,),
        Container(
          width: double.infinity,height: 1, color: Color(0xffD0DBEA),
        ),
        const SizedBox(height: 16,),
        const Row(
          children: [
            Text("Description",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700,color: Color(0xff3E5481)),)
          ],
        ),
        const SizedBox(height: 16,),
        Row(
          children: [
            Expanded(
                child: Text("${widget.meal.description}",style:
                const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,height: 1.5,letterSpacing: 1.1,
                  color: Color(0xff9FA5C0),),maxLines: 3,
                )
            )
          ],
        ),
        const SizedBox(height: 16,),
        Container(
          width: double.infinity,height: 1, color: Color(0xffD0DBEA),
        ),
        const SizedBox(height: 16,),
        const Row(
          children: [
            Text("Ingredients",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700,color: Color(0xff3E5481)),)
          ],
        ),
        const SizedBox(height: 16,),
        _ingredients("4 Eggs"),
        const SizedBox(height: 16,),
        _ingredients("1/2 Butter"),
        const SizedBox(height: 16,),
        _ingredients("1/2 Butter"),
      ],
    );
  }

  Widget _ingredients(String str) {
    return Row(
      children: [
        Image.asset("assets/icons/circle.png"),
        const SizedBox(width: 8,),
        Text(str,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xff2E3E5C)),),
      ],
    );
  }

  Widget _expandedWidget() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: _dragUi(),
    );
  }
}



