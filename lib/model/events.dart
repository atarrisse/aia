import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class WatsonSelectedOption {
  var option;

  WatsonSelectedOption(this.option);
}

class WatsonReceiveMessage {
  var message;

  WatsonReceiveMessage(this.message);
}
