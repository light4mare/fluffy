import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

// https://blog.csdn.net/u013894711/article/details/102785532

class SelectorBuilder<DATA, VM extends ChangeNotifier> extends StatefulWidget {
  const SelectorBuilder({this.builder, this.selector, this.value});

  // 这个地方返回具体的值，对应builder中的data
  final DATA Function(BuildContext, VM) selector;
  final ValueWidgetBuilder<DATA> builder;
  final VM value;

  @override
  State<StatefulWidget> createState() => _SelectorState();
}

class _SelectorState<DATA, VM extends ChangeNotifier>
    extends State<SelectorBuilder<DATA, VM>> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VM>.value(
      value: Provider.of<VM>(context),
      child: Selector<VM, DATA>(
        selector: widget.selector,
        builder: widget.builder,
      ),
    );
  }
}

class Animal {
  var name = '';
  var age = 0;
}

class ViewModel extends ChangeNotifier {
  void onCallback() {

  }

  String getName() {
    return "";
  }

  Animal getAnimal() {
    return Animal();
  }
}

void testSelector(BuildContext context) {
  SelectorBuilder<String, ViewModel>(
    builder: (context, data, child) => Text(data),
    selector: (context, viewModel) => viewModel.getAnimal().name,
    // value: Provider.of<ViewModel>(context),
  );
}
