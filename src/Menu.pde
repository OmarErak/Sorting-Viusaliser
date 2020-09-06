class Menu {
  boolean selected;
  PFont welcome;
  PFont welcome2;
 

  void DisplayMenu() {
    welcome = createFont("fonts/welcome.ttf", 60);
    textFont(welcome);
    textAlign(CENTER);
    fill(83,84,139);
    text("Welcome to the Sorting Visualizer", width/2,100);
    welcome2 = createFont("fonts/welcome.ttf", 40);
    textFont(welcome2);
    textAlign(RIGHT);
    fill(96,120,150);
    text("Please Select the Algorithm You Wish to Visualize: ",960, 180);
    BubbleSort.update();
    BubbleSort.DisplayButton();
    QuickSort.update();
    QuickSort.DisplayButton();
    MergeSort.update();
    MergeSort.DisplayButton();
    SelectionSort.update();
    SelectionSort.DisplayButton();
    QuitButton.update();
    QuitButton.DisplayButtonQ();
  }
}
