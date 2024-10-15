import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/Category_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required String title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModels> category = [];

  @override
  void initState() {
    super.initState();
    _getAllCategories(); 
  }

  void _getAllCategories() {
    category = CategoryModels.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchFiles(),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Category',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal, 
                  separatorBuilder: (context, index) => const SizedBox(width: 25,),
                  itemCount: category.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 125,
                      height: 50,
                      decoration: BoxDecoration(                        
                        color: category[index].boxColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 5), 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              
                            ),
                              child: SvgPicture.asset(
                              category[index].iconPath,
                              width: 50, 
                              height: 50,
                            ),
                          
                          ),
                          const SizedBox(height: 5), 
                          Text(
                            category[index].name,
                            style: const TextStyle(color: Colors.white), 
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  Container _searchFiles() {
    return Container(
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            filled: true,
            hintText: 'Rechercher ici...',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 247, 247, 248),
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'BreakFast',
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {
          print('Tu viens de me tappoter');
        },
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xffF7F8F8),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          margin: const EdgeInsets.all(15),
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: GestureDetector(
            onTap: () {
              print('Tu viens de me tappoter5');
            },
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xffF7F8F8),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              margin: const EdgeInsets.all(15),
              child: SvgPicture.asset(
                'assets/icons/dots.svg',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
