import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:news__app/modules/webView.dart';

Widget articleItem(article, context) => InkWell(
      onTap: () {

        navigateTo(context, WebViewScreen(article['url']));

      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );


Widget myDivider()=>Padding(padding: EdgeInsets.all(5),
child: Container(
  width: double.infinity,
  height:1,
  color: Colors.grey,
));

Widget articles(list,context,{isSearch=false})=>ConditionalBuilder(builder: (context) {
  
  return ListView.separated(
  itemBuilder: (context,index){
    return articleItem(list[index], context);
  },
   separatorBuilder: (context,index)=>myDivider(),
    itemCount: list.length);
},

condition: list.length>0,
fallback:isSearch? (context){
  return Container();
  
}:(context) {
  return Center(child: CircularProgressIndicator());
  
}

);


void navigateTo(context,widget)
{
  Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
}

    


