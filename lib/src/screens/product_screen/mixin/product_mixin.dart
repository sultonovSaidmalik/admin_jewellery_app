part of '../product_screen.dart';

mixin ProductMixin on State<ProductScreen> {
  void listener(BuildContext context, ProductMainState state) {
    if (state.status == ProductStatus.errorData) {
      AppUtils.msg(context, state.message ?? "", color: Colors.red);
    }
    if (state.status == ProductStatus.errorDelete) {
      AppUtils.msg(context, state.message ?? "", color: Colors.red);
    }
    if (state.status == ProductStatus.errorCreate) {
      AppUtils.msg(context, state.message ?? "", color: Colors.red);
    }
    if (state.status == ProductStatus.errorUpdate) {
      AppUtils.msg(context, state.message ?? "", color: Colors.red);
    }
    if (state.status == ProductStatus.successDelete) {
      AppUtils.msg(context, "Product O'chirildi");
      context.read<ProductBloc>().add(const ProductGetDataEvent());
    }
    if (state.status == ProductStatus.successCreate) {
      AppUtils.msg(context, "Product Qo'shildi");
      context.read<ProductBloc>().add(const ProductGetDataEvent());
    }
    if (state.status == ProductStatus.successUpdate) {
      AppUtils.msg(context, "Product Yangilandi");
      context.read<ProductBloc>().add(const ProductGetDataEvent());
    }
  }
}
