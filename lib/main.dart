import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
 theme : ThemeData.dark(),
  home : const IgPostView(),
);
     }
}
 

 class IgPostView extends StatefulWidget {
  const  IgPostView({super.key});

  @override
  State<IgPostView> createState() => _IgPostViewState();
}

class _IgPostViewState extends State<IgPostView> {
     
final List<String> _postImages = [
  'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
  'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05',
'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
  'https://images.unsplash.com/photo-1511884642898-4c92249e20b6',
  'https://images.unsplash.com/photo-1433086966358-54859d0ed716',
];
  int _currentIndex = 0;
   final PageController _pageController = PageController();

   @override
   Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
child: SingleChildScrollView(
  child:Column(
    crossAxisAlignment: CrossAxisAlignment.start,
  children: [

//psot headear

    Padding(
      padding: const EdgeInsets.symmetric(horizontal:12.0,vertical:8.0), 
      child: Row(
        children: [
          const CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage("https://images.unsplash.com/photo-1535713875002-d1d0cf377fde"),
          ),
          const SizedBox(width: 10),
          

          //username or loc ek k neeche ek rkhne klye

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
  children: [
//bluetick or usename
      Row(
children: const[
  Text(
    "Shivmrajput_09",
    style: TextStyle(color: Colors.white,fontSize:14,fontWeight: FontWeight.bold),
    ),
  SizedBox(width:4),
  Icon(Icons.verified, color:Colors.blue,size:14),

],
      ),
// username k theek neeche 
const Text(
  "Vrindavan,Mathura",
  style: TextStyle(color: Colors.grey,fontSize: 10),
),
  ],
          

            ),
          ),

//right side pr 3 dots 
const Icon(Icons.more_vert,color:Colors.white),
        ],
      ),
          ),

//IMG SLIDER AND PAGE INDICATOR BADGE

Stack(
  children: [ 
    //horizontal or scrolling img k liye pageview builder
SizedBox(
  height: 380,
  child: PageView.builder(
    controller: _pageController,
    itemCount: _postImages.length,
    onPageChanged: (index){//user swipe krega,current index update ho jayga
  setState(() {
    
    _currentIndex = index;
  });

    },

    itemBuilder: (context,index){
      return Image.network(
_postImages[index],
fit: BoxFit.cover,
width: double.infinity,
);
    },
  ),
  
),
//top-right corner pr counder badge
Positioned(
  top: 15,
  right: 15,
  child:Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.7), //transparent background 
    ) ,


  child: Text(

  "${_currentIndex + 1}/${_postImages.length}", // Dynamic count (e.g., 1/5)
    style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        ),  ),
),
  ],
),

// Action button bar(like comment )

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical:4.0),
  child: Row(children: [
    IconButton(onPressed: (){}, icon:Icon(Icons.favorite_border,color: Colors.white)), //Like Icon
    IconButton(onPressed: (){}, icon:Icon(Icons.mode_comment_outlined,color: Colors.white)), //Like Icon
    IconButton(onPressed: (){}, icon:Icon(Icons.send_outlined,color: Colors.white)), //Like Icon

                    const Spacer(), // Spacer baaki saari jagah lekar bookmark icon ko right side bhej dega

  IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border, color: Colors.white)), // Bookmark icon

  ],),
),


// likes count caption comment 

//total like
const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "1,245 likes", 
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),

                         const SizedBox(height: 4),
   
//caption(RichText se user bold or caption normal)
 Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Shivam ", 
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      TextSpan(
                        text: "Beautiful evening view at  vrindavan! The sunset was incredible.", 
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
             
              const SizedBox(height: 4),
   
     // View all comments link text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "View all comments", 
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              const SizedBox(height: 10), // Bottom padding
              ],


  )
),
      ),
    );
   }


  }
 