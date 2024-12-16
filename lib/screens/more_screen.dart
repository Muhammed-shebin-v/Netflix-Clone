import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/coming_soon_movies.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {

   @override
 

  @override
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Text('New & hot',
        style: TextStyle(color: Colors.white),),
        actions: [
         
          const Padding(
padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.cast,color: Colors.white,),
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                height: 27,
                width: 27,
                color: Colors.blue,
              ),
            ),
            
        ],
      ),
      body:
        const SingleChildScrollView(
          child: Column(
          
            children: [
  ComingSoonMovies(
                imageUrl: 'https://i.pinimg.com/736x/0f/e6/d6/0fe6d6678b8a279647d2ada3dd35f840.jpg', 
                overview: 'jddsd jsdjsdsjdhsjhsd sjdhsjdhjsdhjshdjsh sdjshdsjhdjshjshds dsjdhsjdhjshdjsdhj sdjshdjshdhsdjs dsjhdsjhdsd h', 
                logoUrl: 'https://fabrikbrands.com/wp-content/uploads/Movie-studio-logo-23.png', 
                month: 'december', 
                day: '31'),
                  ComingSoonMovies(
                imageUrl: 'https://i.pinimg.com/736x/0f/e6/d6/0fe6d6678b8a279647d2ada3dd35f840.jpg', 
                overview: 'jddsd jsdjsdsjdhsjhsd sjdhsjdhjsdhjshdjsh sdjshdsjhdjshjshds dsjdhsjdhjshdjsdhj sdjshdjshdhsdjs dsjhdsjhdsd h', 
                logoUrl: 'https://fabrikbrands.com/wp-content/uploads/Movie-studio-logo-23.png', 
                month: 'december', 
                day: '31'),
  ComingSoonMovies(
                imageUrl: 'https://i.pinimg.com/736x/0f/e6/d6/0fe6d6678b8a279647d2ada3dd35f840.jpg', 
                overview: 'jddsd jsdjsdsjdhsjhsd sjdhsjdhjsdhjshdjsh sdjshdsjhdjshjshds dsjdhsjdhjshdjsdhj sdjshdjshdhsdjs dsjhdsjhdsd h', 
                logoUrl: 'https://fabrikbrands.com/wp-content/uploads/Movie-studio-logo-23.png', 
                month: 'december', 
                day: '31'),
                  ComingSoonMovies(
                imageUrl: 'https://i.pinimg.com/736x/0f/e6/d6/0fe6d6678b8a279647d2ada3dd35f840.jpg', 
                overview: 'jddsd jsdjsdsjdhsjhsd sjdhsjdhjsdhjshdjsh sdjshdsjhdjshjshds dsjdhsjdhjshdjsdhj sdjshdjshdhsdjs dsjhdsjhdsd h', 
                logoUrl: 'https://fabrikbrands.com/wp-content/uploads/Movie-studio-logo-23.png', 
                month: 'december', 
                day: '31'),
                
            ],
          ),
        )
       

    );
  }
}