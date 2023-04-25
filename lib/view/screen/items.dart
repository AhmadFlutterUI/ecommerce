import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/widget/customappbar.dart';
import 'package:ecommerce/view/widget/items/customlistitems.dart';
import 'package:ecommerce/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteControllerImp controllerFav = Get.put(FavoriteControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
                onPressedIconFavotite: () {
                  Get.toNamed(AppRoute.myFavorite);
                },
                titleappbar: "56".tr,
                // onPressedIcon: () {},
                onPressedSearch: () {}),
            const SizedBox(
              height: 20,
            ),
            const ListCategoriesItems(),
            GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.6),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  itemBuilder: ((context, index) {
                    controllerFav
                            .isFavorite[controller.data[index]['items_id']] =
                        controller.data[index]['favorite'];

                    return CustomListItems(
                      itemsModel: ItemsModel.fromJson(controller.data[index]),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
