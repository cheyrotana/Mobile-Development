abstract class Observer {
  void update();
}

class Subject {
  final List<Observer> _observers = [];

  void addObserver(Observer observer) {
    _observers.add(observer);
  }

  void removeObserver(Observer observer) {
    _observers.remove(observer);
  }

  void notifyObservers() {
    for (var observer in _observers) {
      observer.update();
    }
  }
}

class CounterModel extends Subject {
  int _redTaps = 0;
  int _blueTaps = 0;

  int get redTaps => _redTaps;
  int get blueTaps => _blueTaps;

  void incrementRed() {
    _redTaps++;
    notifyObservers();
  }

  void incrementBlue() {
    _blueTaps++;
    notifyObservers();
  }
}
