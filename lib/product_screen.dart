import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/basket.dart';
import 'package:provider_project/product_,item.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, ProductItem item, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Sepetteki Ürün | ${item.basket!.length} |'),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Basket()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.w),
                      color: Colors.white
                      ),
                  margin: EdgeInsets.only(
                      top: 2.w, bottom: 2.w, left: 3.w, right: 3.w),
                  width: 5.h,
                  child: const Icon(
                    Icons.shopping_bag,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: 80.h,
                width: 100.w,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8,left: 5,right: 5),
                  child: ListView.builder(
                    itemCount: item.products!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100.w,
                        height: 8.h,
                        margin: EdgeInsets.only(bottom: 1.h),
                        padding: EdgeInsets.only(right: 3.w, left: 3.w),
                        // ignore: sort_child_properties_last
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  
                                    borderRadius: BorderRadius.circular(3.w),
                                    child: SizedBox(
                                    
                                      width: 7.h,
                                      height: 7.h,
                                      child: Image.network(
                                          "${item.products![index]["image"]}"),
                                    )),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${item.products![index]["title"]}",
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text(' ${item.products![index]["description"]}',style: TextStyle(color: Colors.grey.shade300),),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                item.addBasket(item.products![index]);
                              },
                              child: Container(
                                width: 4.h,
                                height: 4.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(.7.h)),
                                child: const Icon(Icons.add_shopping_cart_rounded),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade400,
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
