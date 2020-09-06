class MergeSort {
  int [] values;
  int counter; 
  int [] colors;
  MergeSort() {
    values = new int[96*4];
    colors = new int[96*4];
  }
  void ThreadInterrupt(){
    t.suspend();
    
  }
  void threadRestart(){
    t.resume();
  }
  void DisplayButton() {
    Return.update();
    Return.DisplayButton();
  }
  void reset() {
    for (int i = 0; i < values.length; i++) {
      values[i] = (int)random(0, height);
    }
  }
  void visual() {
    QuitButton.update();
    QuitButton.DisplayButton();
    background(255);
    for (int i = 0; i < values.length; i++) {
      fill(colors[i]);
      noStroke();
      if (isSorted(values)) {
        fill(0, 255, 0);
      }
      rect(i * 5, height - values[i], 4, values[i]);
      fill(0);
      rect(i*5, height-(values[i]), 4, 4 );
    }
  }

  void fillArray() {
    for (int i = 0; i < values.length; i++) {
      values[i] = (int)random(0, height);
    }
  }
  void ThreadStart() {
    t.start();
  }

  void swap(int[] arr, int a, int b) {
    int temp = arr[a];
    arr[a] = arr[b];
    arr[b] = temp;
  }

  void merge(int arr[], int[]colors, int start, int middle, int end) 
  { 
    int i = start;
    int j = middle + 1;

    while (i <= middle && j <= end) {
      colors[i] = color(255, 0, 0);
      colors[j] = color(255, 0, 0);
      colors[i] = color(255,0,0);
      colors[j] = color(255,0,0);
      if (arr[i] > arr[j]) {
        for (int k = i; k <= j; ++k) {
          swap(arr, k, j);
          swap(colors, k, j);
        }

        ++j;
        ++middle;
      }
      ++i;
      try {
        Thread.sleep(20);
      }
      catch(Exception e) {
      };
    }//delay the thread operating this function
    redraw();
  }

  void mergesort(int arr[], int colors[], int l, int r) 
  { 
    if (l < r) 
    { 
      int m = (l+r)/2; 
      counter = m;
      mergesort(arr, colors, l, m); 
      mergesort(arr, colors, m+1, r); 
      merge(arr, colors, l, m, r);
    }
  } 

  Thread t = new Thread() {
    public void run() {
      mergesort(values, colors, 0, values.length - 1);
    }
  };
  boolean isSorted(int[]arr) {
    for (int i = 0; i<arr.length-1; i++) {
      if (arr[i]>arr[i+1]) {
        return false;
      }
    }
    return true;
  }
}
