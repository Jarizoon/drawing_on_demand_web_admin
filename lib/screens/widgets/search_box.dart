import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);
  @override
  Widget build (BuildContext context){
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            const Expanded(
              flex: 3,
              child: TextField(decoration: InputDecoration(hintText: 'Search'),),
              ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
                child: IconButton(onPressed: (){}, icon: Image.asset(searchIcon, fit: BoxFit.cover,)),
            )
          ],
        ),
      )
    );
  }
}