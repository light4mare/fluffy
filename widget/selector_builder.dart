import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

// https://blog.csdn.net/u013894711/article/details/102785532

class SelectorBuilder<DATA, VM> extends StatefulWidget {
  const SelectorBuilder({this.builder, this.selector});

  // 这个地方返回具体的值，对应builder中的data
  final DATA Function(BuildContext, VM) selector;
  final ValueWidgetBuilder<DATA> builder;

  @override
  State<StatefulWidget> createState() => _SelectorState();
}

class _SelectorState<DATA, VM> extends State<SelectorBuilder<DATA, VM>> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: null,
      child: Selector<VM, DATA>(
        selector: widget.selector,
        builder: widget.builder,
      ),
    );
    ;
  }
}

class Message {
  var name = '';
  var age = 0;
}

class ViewModel extends ChangeNotifier {
  void onCallback(){

  }

  String getName(){
    return "";
  }

  Message getMessage(){
    return Message();
  }
}

void testSelector() {
  SelectorBuilder<Message, ViewModel>(
    builder: (context, data, child) {
      return Text(data.name);
    },
    selector: (context, viewModel) {
      return viewModel.getMessage();
    },
  );
}
