class BubbleSort {
  int[] list;
  int a;
  int max;
  boolean done = false;
  BubbleSort() {
    list = new int[96];
  }
  void fillArray() {
    for (int i=0; i < list.length; i++) {
      list[i] = Math.round(random(0, 53));
    }
    max = list.length-1;
  }
  void DisplayButton(){
    Return.update();
    Return.DisplayButton();
  }
  void bubbleSort() {
    if ( done ) { 
      return;
    }
    background(255);
    translate(1, 0);
    if (a>=max) {
      a=0;
      max--;
    }
    if (list[a]>list[a+1]) {
      int temp = list[a];
      list[a] = list[a+1];
      list[a+1] = temp;
    }
    a++;
    noStroke();//stroke(0);
    for (int i = 0; i<list.length; i++) {
      fill(196);
      if (i==a) { 
        fill(255, 0, 0);
      }
      if (i>max) { 
        fill(0, 255, 0);
      }  
      rect(i*20, height-(20*list[i]), 12, (20*list[i]) );
      fill(0);
      //delay(1);
      rect(i*20, height-(20*list[i]), 12, 12 );
    }
    if (max == -1) {
      done = true;
    }
    
  }
}
