import "dart:async";

class CounterStreamService{
  final StreamController<int> _controller = StreamController<int>();
  int _count =0;
  CounterStreamService(){
    _startCounting();
  }
  void _startCounting(){
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _count++;
      print('Count: $_count');
      _controller.add(_count);
    });
  }
  Stream<int> get stream => _controller.stream;
  void dispose(){
    _controller.close();
  }
}