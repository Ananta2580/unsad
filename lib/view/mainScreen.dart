import 'package:flutter/material.dart';
import '../controller/fetchMeme.dart';
import '../controller/saveData.dart'; // Replace with the actual path

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String memeImageUrl = "";
  int? memeNo;
  int targetMeme = 100;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // Instantiate FetchMeme and pass the callback function
    GetInitMemeNo();
    FetchMeme(onUpdateMemeImageUrl: _updateMemeImageUrl).fetchRandomMeme();
  }


  GetInitMemeNo() async{
    memeNo = await SaveMyData.fetchData() ?? 0;
    if(memeNo!>100){
      targetMeme = 500;
    }else if(memeNo! > 500){
      targetMeme  = 1000;
    }
    setState(() {

    });
  }

  // Callback function to update the UI
  void _updateMemeImageUrl(String imageUrl) {
    setState(() {
      memeImageUrl = imageUrl;
      isLoading = false;
    });
  }

  void _fetchNewMeme() {
    FetchMeme(onUpdateMemeImageUrl: _updateMemeImageUrl).fetchRandomMeme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Meme #${memeNo.toString()}', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(height: 10,),
              Text('Target #${targetMeme} Memes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 20,),
              //Image.network("https://raw.githubusercontent.com/codewithdhruv22/CodeWithDhruv/main/applogo.png"),
              //Image.network(memeImageUrl),

              memeImageUrl.startsWith('http') // Check if it's a network URL
                  ? Image.network(memeImageUrl)
                  : Image.network("https://raw.githubusercontent.com/codewithdhruv22/CodeWithDhruv/main/applogo.png"),

              SizedBox(height: 20,),// Display the fetched meme
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: ()async {
                  setState(() {
                    isLoading = true;
                  });
                  await SaveMyData.saveData(memeNo! + 1);
                  GetInitMemeNo();
                  _fetchNewMeme();
                },
                child: Container(
                  height: 50,
                  width: 80,
                  child: Center(child: Text("More Fun", style: TextStyle(fontSize: 18))),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
