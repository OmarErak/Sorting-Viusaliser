class SelectionSort {
  int[] list;
  int [] colors;
  int a;
  int max;
  boolean done = false;
  SelectionSort() {
    list = new int[96];
  }
  void fillArray() {
    for (int i=0; i < list.length; i++) {
      list[i] = Math.round(random(0, 53));
    }
    max = list.length-1;
    a=0;
  }
  void swap(int[] arr, int a, int b) {
    int temp = arr[a];
    arr[a] = arr[b];
    arr[b] = temp;
  }
  void DisplayButton() {
    Return.update();
    Return.DisplayButton();
  }

  void selectionSort() {
    if (done) {
      return;
    }
    background(255);
    translate(1, 0);
    if (a>max) {
      a=0;
      --max;
    }
    int index = max;
    //colors[a] = color(255,0,0);
    //colors[index] = color(0,255,0);

    if (list[a] > list[index]) {
      index = a;
    }
    ++a;

    if (index != max) {
      swap(list, max, index);
    }
    noStroke();//stroke(0);
    for (int i = 0; i<list.length; i++) {
      fill(196);
      if (i==a) { 
        fill(255, 0, 0);
      }
      if(i == index){
        fill(0,0,255);
      }
      if (i>max) { 
        fill(0, 255, 0);
      }  
      rect(i*20, height-(20*list[i]), 12, (20*list[i]) );
      fill(0);
      //delay(1);
      rect(i*20, height-(20*list[i]), 12, 12 );
    }
    if (max ==0) {
      done = true;
    }
  }
}
