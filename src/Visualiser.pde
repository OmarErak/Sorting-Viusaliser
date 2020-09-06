Menu main;
Button BubbleSort;
Button QuickSort;
Button QuitButton;
Button MergeSort;
Button SelectionSort;
Button SelectionSortMin;
Button Return;
PFont menu;
PFont welcome;
BubbleSort a;
MergeSort b;
QuickSort c;
SelectionSort d;
boolean Bselect=false;;
boolean Mselect=false;
boolean Qselect;
boolean Sselect;
PImage img;
int counter = 0;
int counter1 = 0;
void setup() {
  fullScreen();
  menu = createFont("fonts/menu.TTF", 28);
  main = new Menu();
  welcome = createFont("fonts/welcome.ttf", 60);
  BubbleSort = new Button(30, 200, 300, 100, "BubbleSort", menu);
  QuickSort = new Button(30, 400, 300, 100, "QuickSort", menu );
  MergeSort = new Button(30, 600, 300, 100, "MergeSort", menu );
  SelectionSort = new Button(30, 800, 300, 100, "SelectionSort", menu);
  QuitButton = new Button(width-300, 950, 300, 100, "Quit", menu);
  Return = new Button(0, 0, 200, 50, "return", menu);
  a = new BubbleSort();
  a.fillArray();
  b = new MergeSort();
  b.fillArray();
  c = new QuickSort();
  c.fillArray();
  d = new SelectionSort();
  d.fillArray();
  img = loadImage("fonts/SortBg.jpg");
  img.resize(width, height);
}
void draw() {
  if (!main.selected) {
    frameRate(144);
    background(img);
    main.DisplayMenu();
  } else if (Bselect) {
    a.bubbleSort();
    a.DisplayButton();
  } else if (Mselect) {
    b.visual();
    b.DisplayButton();
  } else if (Qselect) {
    c.visual();
    c.DisplayButton();
  } else if (Sselect) {
    d.selectionSort();
    d.DisplayButton();
  }
}

void mousePressed() {
  if (QuitButton.pressed) {
    exit();
  }

  if (BubbleSort.pressed) {
    BubbleSort.pressed = false;
    main.selected= true;
    Bselect = true;
  }
  if (MergeSort.pressed && counter ==0) {
    MergeSort.pressed = false;
    main.selected= true;
    Mselect = true;
    b.ThreadStart();
    counter++;
  }
   if (MergeSort.pressed && counter >0) {
    MergeSort.pressed = false;
    main.selected= true;
    Mselect = true;
    b.threadRestart();
  }
  if (QuickSort.pressed && counter1==0) {
    QuickSort.pressed = false;
    main.selected= true;
    Qselect = true;
    c.ThreadStart();
    counter1++;
  }
  if (QuickSort.pressed&& counter1>0) {
    QuickSort.pressed = false;
    main.selected= true;
    Qselect = true;
    c.threadRestart();
  }
  if (SelectionSort.pressed) {
    SelectionSort.pressed = false;
    main.selected= true;
    Sselect = true;
  }
  if (Return.pressed) {
    main.selected = false;
    Return.pressed = false;
    a.fillArray();
    d.fillArray();
    b.ThreadInterrupt();
    c.ThreadInterrupt();
    Bselect = false;
    Qselect = false;
    Mselect = false;
  }
}
