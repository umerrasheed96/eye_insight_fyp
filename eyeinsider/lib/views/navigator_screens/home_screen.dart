import 'package:eyeinsider/constants/color_constant.dart';
import 'package:eyeinsider/theme/custom_text_style_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List pages = [
      'Home' , 'Camera' , 'Blogs' , 'Profile'
  ] ;
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          pages[currentTabIndex] , style: context.headlineLarge?.copyWith(color: ColorConstant.primary),
        ),

      ),
      
        bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(25.0), // Adjust the radius as needed
    topRight: Radius.circular(25.0),
  ),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed, 
            currentIndex:  currentTabIndex,
                onTap: (index){
          setState(() {
            currentTabIndex = index;        });
                },  
          backgroundColor: const Color.fromARGB(255, 10, 43, 70),
            unselectedItemColor: Colors.white,
            selectedItemColor: ColorConstant.primary,
          
            items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home) , label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.camera) , label: 'Upload'),
            BottomNavigationBarItem(icon: Icon(Icons.book) , label: 'Blogs'),
            BottomNavigationBarItem(icon: Icon(Icons.person) ,  label: 'Profile'),
          
          ]),
        ),
    );
  }
}