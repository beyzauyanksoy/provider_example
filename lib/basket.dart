import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/product_,item.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Basket extends StatefulWidget {
  const Basket({super.key});

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ProductItem item, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Sepetinizde ${item.basket!.length} tane ürün bulunmaktadır  !',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          body: Stack(
            children: [
              item.basket!.isEmpty
                  ? const Center(
                      child: Text(
                      'Sepetinizde Ürün Bulunmamaktadır.',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ))
                  : Padding(
                      padding: const EdgeInsets.only(top: 8, left: 5, right: 5),
                      child: ListView.builder(
                        itemCount: item.basket!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 100.w,
                            height: 8.h,
                            margin: EdgeInsets.only(bottom: 1.h),
                            padding: EdgeInsets.only(right: 3.w, left: 3.w),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.shade400,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(4.w),
                                        child: SizedBox(
                                          width: 7.h,
                                          height: 7.h,
                                          child: Image.network(
                                              "${item.basket![index]["image"]}"),
                                        )),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${item.basket![index]["title"]}",
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            "${item.basket![index]["description"]}",
                                            style: TextStyle(
                                                color: Colors.grey.shade300),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    item.removeBasket(index);
                                  },
                                  child: Container(
                                    width: 4.h,
                                    height: 4.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(.7.h)),
                                    child: const Icon(Icons.close),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
              Positioned(
                bottom: 2.h,
                child: Container(
                  width: 92.w,
                  height: 8.h,
                  padding: EdgeInsets.only(left: 4.w),
                  child: Row(
                    children: [
                      Text(
                        "Ürün Fiyat Toplamı : ${item.price()}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp),
                      )
                    ],
                  ),
                  margin: EdgeInsets.only(left: 4.w, right: 4.w),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(2.w)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
