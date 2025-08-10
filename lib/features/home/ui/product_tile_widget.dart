import 'package:bloc_pro/features/home/model/home_product_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  const ProductTileWidget({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                  image: NetworkImage(productDataModel.imageUrl)),
            ),
          ),
          SizedBox(height: 20,),
          Text(productDataModel.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Text(productDataModel.description),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$" + productDataModel.price.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
             Row(
               children: [
                 IconButton(
                   onPressed: () {
                     //homeBloc.add(HomeWishlistButtonNavigateEvent());
                   },
                   icon: Icon(Icons.favorite_border),
                 ),
                 IconButton(
                   onPressed: () {
                     // homeBloc.add(HomeCartButtonNavigateEvent());
                   },
                   icon: Icon(Icons.shopping_cart),
                 ),
               ],
             )
            ],
          ),
        ],
      ),
    );
  }
}
