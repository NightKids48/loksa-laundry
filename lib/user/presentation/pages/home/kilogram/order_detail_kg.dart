part of '../../../screens.dart';

class OrderDetailkg extends StatefulWidget {
  const OrderDetailkg({super.key});

  @override
  State<OrderDetailkg> createState() => _OrderDetailkgState();
}

class _OrderDetailkgState extends State<OrderDetailkg> {
  final OrderController orderController = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorName.rightone,
      appBar: AppBar(
        backgroundColor: colorName.background,
        elevation: 0,
        title: "Detail Pesanan"
            .text
            .color(colorName.button)
            .fontFamily('nunitoexb')
            .size(18)
            .makeCentered(),
        actions: [],
      ),
      bottomNavigationBar: ColoredBox(
        color: colorName.background,
        child: VStack([
          ButtonWidget(
            text: 'Kembali Ke Halaman Utama',
            onPressed: () {
              context.goNamed('home');
            },
          ).pOnly(left: 20, right: 20, bottom: 20, top: 10),
        ]),
      ),
      body: SafeArea(
        child: VStack([
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorName.background,
              border: Border.all(color: colorName.greys),
            ),
            child: VStack([
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Order kamu di terima!"
                      .text
                      .size(18)
                      .fontFamily('nunitoexb')
                      .color(colorName.button)
                      .make()
                      .p(10),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Jangan lupa siapkan jumlah uang pada "
                      .text
                      .size(14)
                      .fontFamily('nunito')
                      .color(colorName.button)
                      .make()
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "informasi di bawah"
                      .text
                      .size(14)
                      .fontFamily('nunito')
                      .color(colorName.button)
                      .make()
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: colorName.scndprimary,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colorName.primary),
                    ),
                    child: BlocBuilder<LocationCubit, LocationState>(
                      builder: (context, state) {
                        if (state is LocationIsError) {
                          return CircularProgressIndicator();
                        } else if (state is LocationIsSuccess) {
                          var ongkosKirim = Commons().ongkosKirim(
                            totalKilo: int.parse(
                              orderController.totalData!.totalKilogram,
                            ),
                            jarak: state.distance,
                          );
                          return VStack([
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [],
                            ).pOnly(left: 10, right: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "IDR ${int.parse(orderController.totalData!.totalPrice) + ongkosKirim}"
                                    .text
                                    .size(14)
                                    .bold
                                    .fontFamily('nunito')
                                    .color(colorName.primary)
                                    .make(),
                              ],
                            ).p(10)
                          ]);
                        }
                        return Text('0');
                      },
                    ),
                  )
                ],
              ).p(10),
            ]),
          ).p(20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorName.background,
              border: Border.all(color: colorName.greys),
            ),
            child: VStack([
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Status"
                      .text
                      .size(14)
                      .bold
                      .fontFamily('nunitoexb')
                      .color(colorName.silver)
                      .make()
                      .pOnly(left: 10, right: 10, top: 10),
                  "Di jemput kurir"
                      .text
                      .size(14)
                      .bold
                      .fontFamily('nunito')
                      .color(colorName.secondary)
                      .make()
                      .pOnly(left: 10, right: 10, top: 10),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Nomor order"
                      .text
                      .size(14)
                      .bold
                      .fontFamily('nunitoexb')
                      .color(colorName.silver)
                      .make()
                      .pOnly(left: 10, right: 10, top: 5),
                  "#1"
                      .text
                      .size(14)
                      .bold
                      .fontFamily('nunito')
                      .color(colorName.button)
                      .make()
                      .pOnly(left: 10, right: 10, top: 5),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Date"
                      .text
                      .size(14)
                      .bold
                      .fontFamily('nunitoexb')
                      .color(colorName.silver)
                      .make()
                      .pOnly(left: 10, right: 10, top: 5, bottom: 10),
                  "13 March 2023. 11.15 WIB"
                      .text
                      .size(14)
                      .bold
                      .fontFamily('nunito')
                      .color(colorName.grey)
                      .make()
                      .pOnly(left: 10, right: 10, top: 5, bottom: 10),
                ],
              ),
            ]),
          ).pOnly(left: 20, right: 20, bottom: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorName.background,
              border: Border.all(color: colorName.greys),
            ),
            child: VStack([
              HStack([
                SvgPicture.network('${orderController.layananData?.image}')
                    .p(10),
                VStack([
                  "${orderController.layananData?.name}"
                      .text
                      .size(16)
                      .fontFamily('nunitoexb')
                      .color(colorName.primary)
                      .bold
                      .make(),
                  "${orderController.layananData?.price} / Kg"
                      .text
                      .fontFamily('nunito')
                      .size(13)
                      .bold
                      .make(),
                ]).pOnly(left: 20),
              ]),
            ]),
          ).pOnly(left: 20, right: 20).wFull(context),
          10.heightBox,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorName.background,
              border: Border.all(color: colorName.greys),
            ),
            child: VStack([
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Total Kilogram"
                      .text
                      .size(16)
                      .fontFamily('nunitoexb')
                      .color(colorName.primary)
                      .bold
                      .make(),
                  "${orderController.totalData?.totalKilogram} KG"
                      .text
                      .color(colorName.black)
                      .bold
                      .make(),
                ],
              ),
            ]).p(15),
          ).pOnly(left: 20, right: 20).wFull(context),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 10,
            ),
            child: "Detail pengiriman"
                .text
                .size(18)
                .bold
                .fontFamily('nunitoexb')
                .color(colorName.button)
                .make(),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorName.background,
              border: Border.all(color: colorName.greys),
            ),
            child: VStack([
              Row(
                children: [
                  "Lestari Delivery"
                      .text
                      .size(16)
                      .bold
                      .fontFamily('nunitoexb')
                      .color(colorName.primary)
                      .make()
                      .p(10),
                ],
              ),
              Row(
                children: [
                  "Lokasi lebih dari 2 KM akan di kenakan IDR 3.000/KG"
                      .text
                      .size(14)
                      .bold
                      .fontFamily('nunito')
                      .color(colorName.grey)
                      .make()
                      .pOnly(left: 10, right: 10, bottom: 10),
                ],
              ),
            ]),
          ).pOnly(left: 20, right: 20, bottom: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorName.background,
              border: Border.all(color: colorName.greys),
            ),
            child: VStack([
              HStack([
                "Name : "
                    .text
                    .size(16)
                    .bold
                    .fontFamily('nunitoexb')
                    .color(colorName.button)
                    .make(),
                "${orderController.detailPenerima?.name}"
                    .text
                    .size(14)
                    .bold
                    .fontFamily('nunito')
                    .color(colorName.primary)
                    .make(),
              ]),
              VxDivider().pOnly(top: 5, bottom: 5),
              HStack([
                "Phone Number : "
                    .text
                    .size(16)
                    .bold
                    .fontFamily('nunitoexb')
                    .color(colorName.button)
                    .make(),
                "${orderController.detailPenerima?.phoneNumber}"
                    .text
                    .size(14)
                    .bold
                    .fontFamily('nunito')
                    .color(colorName.primary)
                    .make(),
              ]),
              VxDivider().pOnly(top: 5, bottom: 5),
              HStack([
                "Adress : "
                    .text
                    .size(16)
                    .bold
                    .fontFamily('nunitoexb')
                    .color(colorName.button)
                    .make(),
                "${orderController.detailPenerima?.address}"
                    .text
                    .size(14)
                    .bold
                    .fontFamily('nunito')
                    .color(colorName.primary)
                    .make(),
              ]),
            ]).pOnly(left: 10, right: 10, top: 20, bottom: 20),
          ).pOnly(left: 20, right: 20).wFull(context),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 10,
            ),
            child: "Ringkasan pembayaran"
                .text
                .size(18)
                .fontFamily('nunitoexb')
                .color(colorName.button)
                .make(),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorName.background,
              border: Border.all(color: colorName.greys),
            ),
            child: BlocBuilder<LocationCubit, LocationState>(
              builder: (context, state) {
                if (state is LocationIsError) {
                  return CircularProgressIndicator();
                } else if (state is LocationIsSuccess) {
                  var ongkosKirim = Commons().ongkosKirim(
                    totalKilo: int.parse(
                      orderController.totalData!.totalKilogram,
                    ),
                    jarak: state.distance,
                  );
                  return VStack([
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "${orderController.layananData?.name}"
                            .text
                            .size(16)
                            .bold
                            .fontFamily('nunitoexb')
                            .color(colorName.button)
                            .make(),
                        "${Commons().setPrice(double.parse(orderController.totalData?.totalPrice ?? '0'))}"
                            .text
                            .size(14)
                            .bold
                            .fontFamily('nunito')
                            .color(colorName.button)
                            .make(),
                      ],
                    ).pOnly(left: 10, right: 10, top: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Ongkos kirim"
                            .text
                            .size(16)
                            .bold
                            .fontFamily('nunitoexb')
                            .color(colorName.button)
                            .make(),
                        "${Commons().setPrice(ongkosKirim.toDouble())}"
                            .text
                            .size(14)
                            .fontFamily('nunito')
                            .bold
                            .color(colorName.button)
                            .make()
                      ],
                    ).pOnly(left: 10, right: 10, top: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        "* "
                            .text
                            .size(12)
                            .bold
                            .fontFamily('nunito')
                            .color(colorName.maroon)
                            .make()
                            .pOnly(top: 5, bottom: 5),
                        "${state.distance.toInt()} Km"
                            .text
                            .size(12)
                            .bold
                            .fontFamily('nunito')
                            .color(colorName.grey)
                            .make()
                            .pOnly(top: 5, bottom: 5)
                      ],
                    ).pOnly(left: 10, right: 10),
                    VxDivider().pOnly(left: 10, right: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Total Pembayaran"
                            .text
                            .size(16)
                            .color(colorName.primary)
                            .bold
                            .fontFamily('nunitoexb')
                            .make(),
                        "IDR ${int.parse(orderController.totalData!.totalPrice) + ongkosKirim}"
                            .text
                            .size(14)
                            .bold
                            .fontFamily('nunito')
                            .color(colorName.primary)
                            .make(),
                      ],
                    ).pOnly(left: 10, right: 10, bottom: 10, top: 10),
                  ]);
                }
                return Text('0');
              },
            ),
          ).pOnly(left: 20, right: 20, bottom: 20).wFull(context),
        ]),
      ).scrollVertical(),
    );
  }
}
