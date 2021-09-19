import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      //color: Colors.red,
      height: screenSize.height,
      width: screenSize.width,
      child: Card(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CachedNetworkImage(
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                height: screenSize.height,
                width: screenSize.width,
                fit: BoxFit.cover,
                imageUrl:
                    "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
              ),
              SizedBox(
                height: 50,
              ),
              CachedNetworkImage(
                  height: screenSize.height,
                  width: screenSize.width,
                  fit: BoxFit.cover,
                  imageUrl:
                      "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80"),
              SizedBox(height: 50,),
              CachedNetworkImage(
                  height: screenSize.height,
                  width: screenSize.width,
                  fit: BoxFit.cover,
                  imageUrl:
                      "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80"),
            ],
          ),
        ),
      ),
    );
  }
}
