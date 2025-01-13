String[][] strs = new String[1][2];
PFont font;

void setup() {
  size(1920, 1080);
  font = createFont("HelveticaNeue-48.vlw", 48);
  textFont(font);
  frameRate(30);
  textAlign(CENTER);
  textSize(40);
  background(255);
  fill(0);

  // Only store "Hello there" in the strs array
  strs[0][0] = "Hello there";
  strs[0][1] = "";
}

int i = 0;
boolean delete = false;
int s = 0;
int offset = 50;
int mainFontSize = 60;
int secondaryFontSize = 40;

void draw() {
  background(255);

  if (s < strs.length) {
    if (strs[s][0].length() >= i && !delete) {
      // Display the current portion of the string
      textSize(mainFontSize);
      text(strs[s][0].substring(0, i), width / 2, height / 2 - offset);
      i++;
    } else {
      if (!delete) {
        delay(1500);  // Delay before starting to delete
      }
      delete = true;
    }

    if (delete) {
      if (i > 0) {
        // Gradually delete the text
        textSize(mainFontSize);
        text(strs[s][0].substring(0, i - 1), width / 2, height / 2 - offset);
        i--;
      } else {
        delete = false;
        s++;  // Loop back to the first element
        if (s == strs.length) {
          s = 0;  // Reset to start after finishing the loop
        }
      }
    }
  }
}
