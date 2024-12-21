import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:procuts_task/core/utils/image_manager.dart';
import 'package:procuts_task/core/utils/svg_manager.dart';
import 'package:procuts_task/core/utils/values/text_styles.dart';
import 'package:procuts_task/core/widgets/diff_img.dart';
import 'package:procuts_task/core/widgets/gaps.dart';
import 'package:procuts_task/features/products/domain/entities/product_entity.dart';
import 'package:procuts_task/injection_container.dart';
import 'package:shimmer/shimmer.dart';

class ProductWidget extends StatefulWidget {
  final ProductEntity product;
  const ProductWidget({super.key, required this.product});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 160.h,
                width: 160.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: colors.backGround),
                child: DiffImage(
                  height: 160.r,
                  width: 160.r,
                  fitType: BoxFit.cover,
                  borderRadius: BorderRadius.circular(6.r),
                  image: widget.product.mainImg?.src ?? '',
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: _buildFavoriteContainer(),
              ),
            ],
          ),
          Gaps.hGap12,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product.arName ?? '',
                style: TextStyles.bold15(),
              ),
              Gaps.vGap8,
              Text(
                '250 جم',
                style: TextStyles.semiBold14(color: colors.lightTextColor),
              ),
              Row(
                children: [
                  Text(
                    '8-7 أفراد',
                    style: TextStyles.bold16(color: colors.lightTextColor),
                  ),
                  Gaps.hGap2,
                  SvgPicture.asset(SvgAssets.userGroup)
                ],
              ),
              Gaps.vGap35,
              Row(
                children: [
                  Text('EGP ${widget.product.price}',
                      style: TextStyles.bold26(color: colors.main)),
                  Gaps.hGap10,
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: colors.successColor.withOpacity(.15)),
                    child: Row(
                      children: [
                        SvgPicture.asset(SvgAssets.stars),
                        Gaps.hGap4,
                        Text(
                          '50 نقطة',
                          style: TextStyles.bold12(color: colors.successColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildFavoriteContainer() {
    return InkWell(
      onTap: () {
        setState(() {
          _isFavorited = !_isFavorited;
        });
      },
      child: Container(
        height: 38.h,
        width: 38.w,
        padding: EdgeInsets.all(6.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: colors.upBackGround,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              offset: const Offset(0, 4),
              blurRadius: 6,
              spreadRadius: 0,
            ),
          ],
        ),
        child: _isFavorited
            ? Image.asset(
                ImgAssets.favoriteIcon,
              )
            : SvgPicture.asset(
                SvgAssets.favorite,
              ),
      ),
    );
  }
}

class ProductWidgetShimmer extends StatelessWidget {
  const ProductWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[200]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 160.h,
              width: 160.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: Colors.grey,
              ),
            ),
          ),
          Gaps.hGap12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[200]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 20.h,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                ),
                Gaps.vGap8,
                Shimmer.fromColors(
                  baseColor: Colors.grey[200]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 16.h,
                    width: 100.w,
                    color: Colors.grey,
                  ),
                ),
                Gaps.vGap35,
                Shimmer.fromColors(
                  baseColor: Colors.grey[200]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 26.h,
                    width: 80.w,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
