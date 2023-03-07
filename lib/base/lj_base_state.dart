
import 'package:flutter/material.dart';

abstract class LJBaseState<T extends StatefulWidget> extends State<T> with WidgetsBindingObserver, LJBaseStateLifeCycleMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stateWillLoad();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      stateDidLoad();
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    stateDidChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    stateDidDispose();
    super.dispose();
  }

}

mixin LJBaseStateLifeCycleMixin {
  @protected
  stateWillLoad() {

  }
  @protected
  stateDidLoad() {

  }
  @protected
  stateDidChangeDependencies() {

  }
  @protected
  stateDidDispose() {

  }
}