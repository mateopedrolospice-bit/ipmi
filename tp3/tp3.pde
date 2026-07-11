//https://youtu.be/7ydO5Gk56FA?si=w7B2jsaC8YDig3Kz
PImage referencia;

int estadoBlancos = 0;
int estadoNegros = 0;

float escala = 0.5;
float anguloExtra = 0;

void setup() {
  size(800, 400);
  smooth(8);
  rectMode(CENTER);
  noStroke();

  referencia = loadImage("35.png");
}

void draw() {
  background(230);

  image(referencia, 0, 0, 400, 400);

  pushMatrix();
  translate(600, 200);
  scale(escala);
  rotate(anguloExtra);

  dibujarObra(700, 70, 6, 0.93);

  popMatrix();
}

void dibujarObra(float ladoInicial, int numCuadrados, float angulo, float reduccion) {
  float lado = ladoInicial;

  for (int i = 0; i < numCuadrados; i++) {

    for (int j = 0; j < 1; j++) {

      pushMatrix();
      rotate(radians(i * angulo));

      if (i % 2 == 0) {
        fill(obtenerColor(estadoBlancos, true));
      } else {
        fill(obtenerColor(estadoNegros, false));
      }

      rect(0, 0, lado, lado);

      popMatrix();
    }

    lado *= reduccion;
  }
}

color obtenerColor(int estado, boolean blanco) {

  if (blanco) {

    if (estado == 0) {
      return color(255);
    } else if (estado == 1) {
      return color(0, 180, 255);
    } else if (estado == 2) {
      return color(0, 255, 120);
    } else {
      return color(255, 240, 0);
    }

  } else {

    if (estado == 0) {
      return color(0);
    } else if (estado == 1) {
      return color(255, 80, 80);
    } else if (estado == 2) {
      return color(255, 140, 0);
    } else {
      return color(160, 0, 255);
    }

  }
}

void mousePressed() {
  if (mouseX > 400) {

    if (mouseButton == LEFT) {
      estadoBlancos++;

      if (estadoBlancos > 3) {
        estadoBlancos = 0;
      }
    }

    if (mouseButton == RIGHT) {
      estadoNegros++;

      if (estadoNegros > 3) {
        estadoNegros = 0;
      }
    }
  }
}

void mouseMoved() {
  anguloExtra = map(mouseX, 400, 800, -0.08, 0.08);
}

void keyPressed() {

  if (key == ' ') {
    escala = random(0.42, 0.58);
  }

  if (key == 'r' || key == 'R') {
    reiniciar();
  }
}

void reiniciar() {
  estadoBlancos = 0;
  estadoNegros = 0;
  escala = 0.5;
  anguloExtra = 0;
}
