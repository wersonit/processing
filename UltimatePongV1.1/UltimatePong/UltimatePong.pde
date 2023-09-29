final int ballD = 20; //<>//
final int ballR = ballD / 2;

int ballX;
int ballY;
int ballAccelX = (int) random(3, 6);
int ballAccelY = (int) random(3, 6);
int ballLaunchX;
int ballLaunchY;
int rndm = (int) random(1, 3);

final int paddlesGap = 20;
final int paddlesWidth = 10;
final int paddlesHalfWidth = paddlesWidth / 2;
final int paddlesHeight = 100;
final int paddlesHalfHeight = paddlesHeight / 2;

int startButtonX = 350;
int startButtonY = 250;
int startButtonWidth = 300;
int startButtonHeight = 100;

int repeatPrevent = 0;

int leftPaddleX, leftPaddleY;
int leftPaddleAccelY = 5;

int rightPaddleX, rightPaddleY;
int rightPaddleAccelY = 5;

int leftPlayerScore = 0;
int rightPlayerScore = 0;
int gameStart;

final int scoreGapX = 100;
final int scoreGapY = 100;
PFont font;

int startSecond = second();
int currentSecond;
int startMinute = minute();
int currentMinute;
int startHour = hour();
int currentHour;

void setup() {
  size(1000, 500);
  background(0);
  leftPaddleX = 0;
  leftPaddleY = height / 2 - paddlesHalfHeight;
  rightPaddleX = width - paddlesWidth;
  rightPaddleY = height / 2 - paddlesHalfHeight;
  ballX = width / 2;
  ballY = height / 2;
}

void draw() {
  background(0);
  noStroke();
  textSize(100);
  textAlign(CENTER, CENTER);
  font = createFont("unispace bd.ttf", 100);
  textFont(font);
  fill(255);
  text("Ultimate pong", 500, 100);
  fill(200);
  text("Ultimate pong", 497, 103);
  fill(0, 255, 0);
  rect(startButtonX, startButtonY, startButtonWidth, startButtonHeight);
  textSize(75);
  fill(0);
  textSize(100);
  text("START", width / 2, height / 2 + 45);
  if (mouseX >= startButtonX & mouseX <= startButtonX + startButtonWidth &&
      mouseY >= startButtonY & mouseY <= startButtonY + startButtonWidth &&
      mousePressed & (mouseButton == LEFT) || 
      gameStart == 1) {
  gameStart = 1;
  background(0);
  fill(255);
  rect(leftPaddleX + paddlesGap, leftPaddleY, paddlesWidth, paddlesHeight);    // Левая ракетка
  rect(rightPaddleX - paddlesGap, rightPaddleY, paddlesWidth, paddlesHeight);  // Правая ракетка
  if (keyPressed) {
    if (keyCode == UP) {
      rightPaddleY -= rightPaddleAccelY;
    } else if (keyCode == DOWN) {
      rightPaddleY += rightPaddleAccelY;
    } 
    if (key == 'W' || key == 'w' || key == 'Ц' || key == 'ц') {
      leftPaddleY -= leftPaddleAccelY;
    } else if (key == 'S' || key == 's' || key == 'Ы' || key == 'ы') {
      leftPaddleY += leftPaddleAccelY;
    }
  }  
  if (leftPaddleY < 0) {
    leftPaddleY = 0;
  }
  if (leftPaddleY >= height - paddlesHeight) {
    leftPaddleY = height - paddlesHeight - 1;
  }
  if (rightPaddleY < 0) {
    rightPaddleY = 0;
  }
  if (rightPaddleY >= height - paddlesHeight) {
    rightPaddleY = height - paddlesHeight - 1;
  }
  ellipse(ballX, ballY, ballD, ballD);
  fill(0);
  ellipse(ballX, ballY, ballD - 3, ballD - 3); // Шарик
  fill(255);
  if (rndm == 1) {
    ballX += ballAccelX;
    ballY += ballAccelY;
  } else if (rndm == 2) {
    ballX -= ballAccelX;
    ballY -= ballAccelY;
  }
  if (ballX < paddlesWidth + ballR + paddlesGap &&
      ballY > leftPaddleY - ballR &&
      ballY < leftPaddleY + paddlesHeight + ballR) {
        ballAccelX = -ballAccelX;
  }
  if (ballX > rightPaddleX - ballR - paddlesGap &&
      ballY > rightPaddleY - ballR &&
      ballY < rightPaddleY + paddlesHeight + ballR) {
        ballAccelX =- ballAccelX;
  }
  if (ballY <= ballR || 
    ballY >= height - ballR) {
    ballAccelY = -ballAccelY;
  }
  if (ballX < -ballR) {
    ++rightPlayerScore;
    ballAccelX = -ballAccelX;
    ballX = width / 2;
    ballY = height / 2;
  } 
  if (ballX > width + ballR) {
    ++leftPlayerScore;
    ballAccelX = -ballAccelX;
    ballX = width / 2;
    ballY = height / 2;
  }
  currentSecond = second();
  currentMinute = minute();
  currentHour = hour();
  if (currentSecond - startSecond >= 30 & currentMinute - startMinute == 0 & startHour - currentHour == 0 ||
      currentSecond + 60 - startSecond == 30 & currentMinute - startMinute == 1 & startHour - currentHour == 0 ||
      currentSecond + 60 - startSecond == 30 & currentMinute + 60 - startMinute == 1 & startHour - currentHour == 1 &&
      repeatPrevent == 0) {
        repeatPrevent = 1;
        if (ballAccelX > 0) {
        ++ballAccelX;
        } else if (ballAccelX < 0) {
        --ballAccelX;
        } if (ballAccelY > 0) {
        ++ballAccelY;
        } else if (ballAccelY < 0) {
        --ballAccelY;
        }
      }
  text(leftPlayerScore, scoreGapX, scoreGapY);
  text(rightPlayerScore, width - scoreGapX, scoreGapY);
  rect((width / 2) - 2, 0, 4, height);
}
}
