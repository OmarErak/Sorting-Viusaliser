class QuickSort {

  float[] values;
  int [] states;
  QuickSort() {
    values = new float[96*4];
    states = new int[96*4];
  }


  void swap(float[] arr, int a, int b) {
    float temp = arr[a];
    arr[a] = arr[b];
    arr[b] = temp;
    try {
      Thread.sleep(10);
    }
    catch(Exception e) {
    }; //delay the thread operating this function
    redraw();
  }
  void DisplayButton() {
    Return.update();
    Return.DisplayButton();
  }

  int partition(float[] arr, int start, int end) {
    for (int i = start; i<end; i++) {
      states[i]=1;
    }
    int pivotIndex = start;
    float pivotValue = arr[end];
    states[pivotIndex]=0;
    for (int i =start; i < end; i++) {
      if (arr[i] < pivotValue) {
        swap(arr, i, pivotIndex);
        states[pivotIndex] = -1;
        pivotIndex++;
        states[pivotIndex] = 0;
      }
    }
    swap(arr, pivotIndex, end);
    for (int i = start; i < end; i++) {
      if (i != pivotIndex) {
        states[i] = -1;
      }
    }
    return pivotIndex;
  }
  void ThreadInterrupt(){
    t.suspend();
    
  }
  void threadRestart(){
    t.resume();
  }

  void quickSort(float[] arr, int start, int end) {
    if (start < end) {
      int index = partition(arr, start, end);
      states[index] = -1;
      quickSort(arr, start, index - 1);
      quickSort(arr, index + 1, end);
    }
  }

  //make a thread and override the run to perform the sort instead
  Thread t = new Thread() {
    public void run() {
      quickSort(values, 0, values.length - 1);
    }
  };
  void reset() {
    values = new float[96*4];
    states = new int[96*4];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(0, height);
      states[i] = -1;
    }
  }
  void ThreadStart() {
    t.start(); //start the thread after array is populated
  }

  void fillArray() {
    values = new float[96*4];
    states = new int[96*4];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(0, height);
      states[i] = -1;
    }
  }
  boolean isSorted(float[]arr) {
    for (int i = 0; i<arr.length-1; i++) {
      if (arr[i]>arr[i+1]) {
        return false;
      }
    }
    return true;
  }

  void visual() {
    background(255);
    for (int i = 0; i < values.length; i++) {
      noStroke();
      if (states[i] == 0) {
        fill(0, 0, 255);
      } else if (states[i] == 1) {
        fill(0, 0, 255);
      } else {
        fill(196);
      }
      if (isSorted(values)) {
        fill(0, 255, 0);
      }
      rect(i * 5, height - values[i], 4, values[i]);
      fill(0);
      rect(i*5, height-(values[i]), 4, 4 );
    }
  }
}
