import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:procuts_task/config/locale/app_localizations.dart';
import 'package:procuts_task/core/params/filter_params.dart';
import 'package:procuts_task/core/utils/svg_manager.dart';
import 'package:procuts_task/core/utils/values/text_styles.dart';
import 'package:procuts_task/core/widgets/error_text.dart';
import 'package:procuts_task/core/widgets/gaps.dart';
import 'package:procuts_task/core/widgets/my_default_button.dart';
import 'package:procuts_task/core/widgets/text_form_field.dart';
import 'package:procuts_task/features/products/domain/entities/sorting_entity.dart';
import 'package:procuts_task/features/products/presentation/bloc/auto_search_bloc/get_products_bloc.dart';
import 'package:procuts_task/features/products/presentation/widgets/product_widget.dart';
import 'package:procuts_task/injection_container.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ScrollController _scrollController = ScrollController();

  bool isFiltered = false;
  final List<dynamic> products = [];
  SortingEntity? _selectedOption;

  int? priceFrom;
  int? priceTo;
  String selectedFilter = '';

  final List<SortingEntity> options = const [
    SortingEntity(
        criteria: 'alphabetical', arrangement: 'DESC', title: 'أبجديًا'),
    SortingEntity(
        criteria: 'price', arrangement: 'ASC', title: 'السعر من الأقل للأكثر'),
    SortingEntity(
        criteria: 'price', arrangement: 'DESC', title: 'السعر من الأكثر للأقل'),
    SortingEntity(criteria: 'date', arrangement: 'DESC', title: 'الاحدث'),
  ];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _fetchProducts() {
    BlocProvider.of<GetProductsBloc>(context).add(
      GetProductsEventFetched(const FilterParams(
          page: 1, limit: 5, priceFrom: null, priceTo: null)),
    );
    products.clear();
    isFiltered = false;
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !BlocProvider.of<GetProductsBloc>(context).state.hasReachedMax) {
      final nextPage = (BlocProvider.of<GetProductsBloc>(context)
                  .state
                  .pagination
                  ?.currentPage ??
              0) +
          1;
      BlocProvider.of<GetProductsBloc>(context).add(GetProductsEventFetched(
        FilterParams(
          page: nextPage,
          limit: 5,
          priceFrom: isFiltered ? priceFrom : null,
          priceTo: isFiltered ? priceTo : null,
          criteria: isFiltered ? _selectedOption?.criteria : null,
          arrangement: isFiltered ? _selectedOption?.arrangement : null,
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: RefreshIndicator(
        onRefresh: () async => _fetchProducts(),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Stack(
            children: [
              Column(
                children: [
                  _buildHeader(),
                  Gaps.vGap16,
                  _buildFilterRow(),
                  Expanded(child: _buildProductList()),
                ],
              ),
              _buildFilterButton(context),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(80.h),
      child: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            border: BorderDirectional(
              bottom: BorderSide(width: 1, color: colors.main.withOpacity(.2)),
            ),
          ),
        ),
        title: Row(
          children: [
            SvgPicture.asset(SvgAssets.arrowBack),
            Gaps.hGap12,
            _buildLocationSelector(),
          ],
        ),
        actions: [_buildSearchButton()],
      ),
    );
  }

  Widget _buildLocationSelector() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: colors.upBackGround,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('توصيل الى',
              style: TextStyle(
                  fontSize: 11.sp,
                  color: colors.lightTextColor,
                  fontWeight: FontWeight.w700)),
          Row(children: [
            SvgPicture.asset(SvgAssets.location),
            Gaps.hGap4,
            Text('المنزل، التجمع الخامس',
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600)),
            Gaps.hGap10,
            SvgPicture.asset(SvgAssets.arrowDown),
          ]),
        ],
      ),
    );
  }

  Widget _buildSearchButton() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: colors.upBackGround,
      ),
      child: SvgPicture.asset(SvgAssets.searchIcon),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text('حلويات غربية', style: TextStyles.bold22()),
        Gaps.hGap10,
        SvgPicture.asset(SvgAssets.arrowDown, height: 12.h),
      ],
    );
  }

  Widget _buildFilterRow() {
    return Row(
      children: [
        _buildFilterItem(title: 'جميع الحلويات غربية', filter: 'all'),
        Gaps.hGap10,
        _buildFilterItem(title: 'تورت', filter: 'cake'),
        Gaps.hGap10,
        _buildFilterItem(title: 'جاتوه', filter: 'gateaux'),
      ],
    );
  }

  Widget _buildFilterItem({required String title, required String filter}) {
    bool isSelected = selectedFilter == filter;

    return InkWell(
      onTap: () {
        setState(() {
          selectedFilter = filter;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            color: colors.secondaryColor,
            border: Border.all(
                color: isSelected ? colors.main : Colors.transparent)),
        child: Text(title,
            style: TextStyles.semiBold14(
                color: isSelected ? colors.main : colors.textColor)),
      ),
    );
  }

  Widget _buildProductList() {
    return BlocBuilder<GetProductsBloc, GetProductsState>(
      builder: (context, state) {
        switch (state.status) {
          case GetProductsStatus.initial:
            return products.isEmpty
                ? ListView.separated(
                    itemCount: 5,
                    itemBuilder: (context, index) =>
                        const ProductWidgetShimmer(),
                    separatorBuilder: (context, index) => Gaps.vGap10,
                  )
                : _buildProductListView();
          case GetProductsStatus.success:
            products.addAll(state.products);
            return products.isEmpty
                ? Center(
                    child: ErrorText(
                        text: 'noData'.tr, width: 200.w, height: 200.h))
                : _buildProductListView();
          case GetProductsStatus.failure:
            return Center(child: Text(state.message ?? 'Error'));
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildProductListView() {
    return ListView.separated(
      controller: _scrollController,
      itemCount: products.length,
      itemBuilder: (context, index) => ProductWidget(product: products[index]),
      separatorBuilder: (context, index) => Gaps.vGap10,
    );
  }

  Widget _buildFilterButton(BuildContext context) {
    return Positioned(
      left: 0,
      top: MediaQuery.of(context).size.height / 2,
      child: InkWell(
        onTap: () => _showSortingModal(context),
        child: Container(
          padding: EdgeInsets.all(8.r),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: colors.secondColor),
          child: SvgPicture.asset(SvgAssets.filterButtonIcon),
        ),
      ),
    );
  }

  void _showSortingModal(BuildContext context) {
    final TextEditingController priceFromController = TextEditingController();
    final FocusNode priceFromFocus = FocusNode();
    final FocusNode priceToFocus = FocusNode();
    final TextEditingController priceToController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildModalHeader(setModalState),
                Gaps.vGap16,
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price From',
                            style: TextStyles.semiBold14(),
                          ),
                          Gaps.vGap8,
                          AppTextFormField(
                              controller: priceFromController,
                              focusNode: priceFromFocus,
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              backgroundColor: colors.backGround,
                              hintText: '0'),
                        ],
                      ),
                    ),
                    Gaps.hGap16,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price To',
                            style: TextStyles.semiBold14(),
                          ),
                          Gaps.vGap8,
                          AppTextFormField(
                              controller: priceToController,
                              focusNode: priceToFocus,
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.done,
                              backgroundColor: colors.backGround,
                              hintText: '10000'),
                        ],
                      ),
                    ),
                  ],
                ),
                Gaps.vGap16,
                ...options
                    .map((option) => _buildOptionTile(option, setModalState)),
                Gaps.vGap16,
                _buildConfirmButton(
                    context, priceFromController, priceToController),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildModalHeader(void Function(void Function()) setModalState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('ترتيب المنتجات',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        InkWell(
          onTap: () => setModalState(() => _selectedOption = null),
          child: Text('reset'.tr,
              style: TextStyles.semiBold14(color: colors.secondColor)),
        ),
      ],
    );
  }

  Widget _buildOptionTile(
      SortingEntity option, void Function(void Function()) setModalState) {
    return ListTile(
      title: Text(option.title!),
      leading: Radio<SortingEntity>(
        value: option,
        groupValue: _selectedOption,
        onChanged: (value) => setModalState(() {
          _selectedOption = option;
        }),
      ),
      onTap: () => setModalState(() {
        _selectedOption = option;
      }),
    );
  }

  Widget _buildConfirmButton(
      BuildContext context,
      TextEditingController priceFromController,
      TextEditingController priceToController) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 46.w),
      child: MyDefaultButton(
        onPressed: () {
          priceFrom = priceFromController.text.isNotEmpty
              ? int.parse(priceFromController.text)
              : null;
          priceTo = priceToController.text.isNotEmpty
              ? int.parse(priceToController.text)
              : null;

          if (_selectedOption != null || priceFrom != null || priceTo != null) {
            BlocProvider.of<GetProductsBloc>(context)
                .add(GetProductsEventFetched(
              FilterParams(
                criteria: _selectedOption?.criteria,
                arrangement: _selectedOption?.arrangement,
                page: 1,
                limit: 5,
                priceFrom: priceFrom,
                priceTo: priceTo,
              ),
            ));
            products.clear();

            isFiltered = true;
          } else {
            _fetchProducts();
            isFiltered = false;
          }
          Navigator.pop(context);
        },
        color: colors.secondColor,
        textColor: colors.upBackGround,
        btnText: 'confirm',
      ),
    );
  }
}
