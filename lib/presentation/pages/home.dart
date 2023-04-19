import 'dart:math';
import 'package:datamellon_recruitment_test/app/shared/widget/filter_button.dart';
import 'package:datamellon_recruitment_test/data/model/stack_pie_chart_model.dart';
import 'package:datamellon_recruitment_test/data/model/time_series_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:datamellon_recruitment_test/app/shared/widget/empty_screen.dart';
import 'package:datamellon_recruitment_test/app/shared/widget/error_screen.dart';
import 'package:datamellon_recruitment_test/core/state/view_state.dart';
import 'package:datamellon_recruitment_test/presentation/controller/home_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = Get.put(HomeController());

  /// Truncates string length and leaves the last four characters
  String truncateString(String value){
    return value.substring((value.length - 4).clamp(0, value.length));
  }
  /// Initialize tooltip behaviour
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  ///Builds widgets based on widget states after the api call
  Widget buildRestaurant(HomeController controller){
    switch (controller.viewState.state){
      case ResponseState.LOADING:
        return const Center(child: CupertinoActivityIndicator());
      case ResponseState.ERROR:
        return const ErrorScreen();
      case ResponseState.EMPTY:
        return const EmptyScreen();
      case ResponseState.COMPLETE:
        List<ExpenseData> getChartData() {
          final List<ExpenseData> chartData = [
            ExpenseData('2014', _controller.viewState.data!.where((element) =>
            truncateString(element.orderDate!) == "2014").map((e) => e.quantity).length, _controller.viewState.data!.where((element) =>
            truncateString(element.orderDate!) == "2014").map((e) => e.profit).length, _controller.viewState.data!.where((element) =>
            truncateString(element.orderDate!) == "2014").map((e) => e.discount).length),
            ExpenseData('2015', _controller.viewState.data!.where((element) =>
            truncateString(element.orderDate!) == "2015").map((e) => e.quantity).length, _controller.viewState.data!.where((element) =>
            truncateString(element.orderDate!) == "2015").map((e) => e.profit).length, _controller.viewState.data!.where((element) =>
            truncateString(element.orderDate!) == "2015").map((e) => e.discount).length),
            ExpenseData('2016', _controller.viewState.data!.where((element) =>
            truncateString(element.orderDate!) == "2016").map((e) => e.quantity).length, _controller.viewState.data!.where((element) =>
            truncateString(element.orderDate!) == "2016").map((e) => e.profit).length, _controller.viewState.data!.where((element) =>
            truncateString(element.orderDate!) == "2016").map((e) => e.discount).length),
            ExpenseData('2017', _controller.viewState.data!.where((element) =>
            truncateString(element.orderDate!) == "2017").map((e) => e.quantity).length, _controller.viewState.data!.where((element) =>
            truncateString(element.orderDate!) == "2017").map((e) => e.profit).length, _controller.viewState.data!.where((element) =>
            truncateString(element.orderDate!) == "2017").map((e) => e.discount).length),
          ];
          return chartData;
        }
        List<ChartSampleData> chartData = <ChartSampleData>[
          ChartSampleData(year: DateTime(2014), sales: _controller.viewState.data?.where((element) => truncateString(element.orderDate!) == "2014").map((e) => e.sales).length),
          ChartSampleData(year: DateTime(2015), sales: _controller.viewState.data?.where((element) => truncateString(element.orderDate!) == "2015").map((e) => e.sales).length),
          ChartSampleData(year: DateTime(2016), sales: _controller.viewState.data?.where((element) => truncateString(element.orderDate!) == "2016").map((e) => e.sales).length),
          ChartSampleData(year: DateTime(2017), sales: _controller.viewState.data?.where((element) => truncateString(element.orderDate!) == "2017").map((e) => e.sales).length),
        ];
        return ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 30,),
            PopupMenuButton(
                color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: const FilterButton(),
                itemBuilder: (BuildContext context)=>controller.filterOptions),
            Align(alignment: Alignment.center,
              child: Text("Pie chart representation of over \nfour years sales data", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),),
            ),
            const SizedBox(height: 10,),
            SizedBox(height: 400,
              child: PieChart(PieChartData(
                  centerSpaceRadius: 30,
                  borderData: FlBorderData(show: false),
                  sections: [
                    PieChartSectionData(
                      titleStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                        value: double.parse(controller.viewState.data!.where((element) =>
                    truncateString(element.orderDate!) == "2014").length.toString()),
                        color: Colors.primaries[Random().nextInt(Colors.primaries.length)], radius: 130),
                    PieChartSectionData(
                        titleStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                        value: double.parse(controller.viewState.data!.where((element) =>
                    truncateString(element.orderDate!) == "2015").length.toString()),
                        color: Colors.primaries[Random().nextInt(Colors.primaries.length)], radius: 130),
                    PieChartSectionData(
                        titleStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                        value: double.parse(controller.viewState.data!.where((element) =>
                    truncateString(element.orderDate!) == "2016").length.toString()),
                        color: Colors.primaries[Random().nextInt(Colors.primaries.length)], radius: 130),
                    PieChartSectionData(
                        titleStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                        value: double.parse(controller.viewState.data!.where((element) =>
                    truncateString(element.orderDate!) == "2017").length.toString()),
                        color: Colors.primaries[Random().nextInt(Colors.primaries.length)], radius: 130),
                    PieChartSectionData(
                        titleStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                        value: double.parse(controller.viewState.data!.where((element) =>
                    truncateString(element.orderDate!) == "2018").length.toString()),
                        color: Colors.primaries[Random().nextInt(Colors.primaries.length)], radius: 130),
                    PieChartSectionData(
                        titleStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                        value: double.parse(controller.viewState.data!.where((element) =>
                    truncateString(element.orderDate!) == "2019").length.toString()),
                        color: Colors.primaries[Random().nextInt(Colors.primaries.length)], radius: 130)
                  ])),
            ),
            const Divider(),
            const SizedBox(height: 30,),
            PopupMenuButton(
                color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: const FilterButton(),
                itemBuilder: (BuildContext context)=>controller.filterOptions),
            Align(alignment: Alignment.center,
              child: Text("Bar chart representation of over \nfour years sales data", textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),),
            ),
            const SizedBox(height: 10,),
            SizedBox(height: 600,
              child: BarChart(BarChartData(
                  borderData: FlBorderData(border: const Border(top: BorderSide.none, right: BorderSide.none, left: BorderSide(width: 1),
                        bottom: BorderSide(width: 1),)),
                  groupsSpace: 10,
                  barGroups: [
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(toY: double.parse(controller.viewState.data!.where((element) =>
                      truncateString(element.orderDate!) == "2014").length.toString()), width: 20, color: Colors.redAccent),
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(toY: double.parse(controller.viewState.data!.where((element) =>
                      truncateString(element.orderDate!) == "2015").length.toString()), width: 20, color: Colors.amber),
                    ]),
                    BarChartGroupData(x: 3, barRods: [
                      BarChartRodData(toY: double.parse(controller.viewState.data!.where((element) =>
                      truncateString(element.orderDate!) == "2016").length.toString()), width: 20, color: Colors.purpleAccent),
                    ]),
                    BarChartGroupData(x: 4, barRods: [
                      BarChartRodData(toY: double.parse(controller.viewState.data!.where((element) =>
                      truncateString(element.orderDate!) == "2017").length.toString()), width: 20, color: Colors.blueAccent),
                    ]),
                  ])),
            ),
            const Divider(),
            const SizedBox(height: 30,),
            PopupMenuButton(
                color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: const FilterButton(),
                itemBuilder: (BuildContext context)=>controller.filterOptions),
            Align(alignment: Alignment.center,
              child: Text("Time series representation of over \nfour years sales data", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),),
            ),
            const SizedBox(height: 10,),
            SizedBox(height: 500, width: 320, child: SfCartesianChart(
                backgroundColor: Colors.white,
                primaryXAxis: DateTimeAxis(majorGridLines: const MajorGridLines(width: 0), edgeLabelPlacement: EdgeLabelPlacement.shift, intervalType: DateTimeIntervalType.years),
                series: <ChartSeries<ChartSampleData, DateTime>>[
                  LineSeries<ChartSampleData, DateTime>(
                    dataSource: chartData,
                    xValueMapper: (ChartSampleData sales, _) => sales.year,
                    yValueMapper: (ChartSampleData sales, _) => sales.sales,
                    name: 'Sales',
                  )
                ]
            )),
            const Divider(),
            const SizedBox(height: 30,),
            PopupMenuButton(
                color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: const FilterButton(),
                itemBuilder: (BuildContext context)=>controller.filterOptions),
            SizedBox(height: 600,
              child: SfCartesianChart(
                title: ChartTitle(text: 'Composite bar chart representation of \nover four years sales data',
                textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 10)),
                legend: Legend(isVisible: true),
                tooltipBehavior: _tooltipBehavior,
                series: <ChartSeries>[
                  StackedColumnSeries<ExpenseData, String>(
                      dataSource: getChartData(),
                      xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
                      yValueMapper: (ExpenseData exp, _) => exp.quantity,
                      name: 'Quantity',
                      markerSettings: const MarkerSettings(
                        isVisible: true,
                      )),
                  StackedColumnSeries<ExpenseData, String>(
                      dataSource: getChartData(),
                      xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
                      yValueMapper: (ExpenseData exp, _) => exp.profit,
                      name: 'Profit',
                      markerSettings: const MarkerSettings(
                        isVisible: true,
                      )),
                  StackedColumnSeries<ExpenseData, String>(
                      dataSource: getChartData(),
                      xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
                      yValueMapper: (ExpenseData exp, _) => exp.discount,
                      name: 'Discount',
                      markerSettings: const MarkerSettings(
                        isVisible: true,
                      )),
                ],
                primaryXAxis: CategoryAxis(),
              ),
            ),
            const Divider(),
            const SizedBox(height: 50,),
          ],
        );
    }
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
        builder: (controller){
      return SafeArea(top: false, bottom: false,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: Text("Sale Data", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black, fontSize: 20), ),
            ),
            body: buildRestaurant(controller),
          )
      );
    });
  }
}


