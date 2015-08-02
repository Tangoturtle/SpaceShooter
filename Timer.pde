

class Timer {
 
  int savedtime; // When Timer started
  int totaltime; // How long Timer will last
  
  Timer(int tempTotalTime) {
    totaltime = tempTotalTime;

  }
  
  // Starting the timer
  void start() {
    // When the timer starts it goes through in milliseconds.
    savedtime = millis(); 
  }
  
  // The function isFinished() returns true if the "totalTime" has passed. 
 
  boolean isFinished() { 
    // Check how much time has passed
    int passedtime = millis()- savedtime;// time -saved time = the passed time
    if (passedtime > totaltime) {
      return true;  // if the passed time is greater than the total time
    } else {
      return false;
    }
  }
}
