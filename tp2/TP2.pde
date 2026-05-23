PImage fondo;
PImage radiator;
PImage portada;
PImage mcqueen;
PImage mate;
PImage copa;
PImage doc;
PImage sally;
PImage finalimg;

PFont fuente;

float offsetX = 0;

// escena 1
int posX = -230;
int posY = 120;
int textoRadiator = 950;

// escena 2
int mcqueenX = 950;
int textoMcqueenX = -700;

// escena 3
int mateX = -500;
int textoMateX = 1000;

// escena 4
int copaX = -350;
int textoCopaX = 220;
int textoCopaY = 650;

// escena 5
int docX = -500;
int textoDocX = 1000;

// escena 6
int sallyX = 950;
int textoSallyX = -900;

// tiempos
int demoraRadiator = 0;
int demoraMcqueen = 0;
int demoraMate = 0;
int demoraCopa = 0;
int demoraDoc = 0;
int demoraSally = 0;

// cambios
boolean empezar = false;

boolean cambiarRadiator = false;
boolean cambiarMcqueen = false;
boolean cambiarMate = false;
boolean cambiarCopa = false;
boolean cambiarDoc = false;
boolean cambiarSally = false;

int escena = 1;

void setup() {

  size(640, 480);

  fondo = loadImage("radiator.jpg");

  radiator = loadImage("radiator.jpg");
  portada = loadImage("portada.jpg");

  mcqueen = loadImage("mcqueen.jpg");
  mate = loadImage("mate.jpg");
  copa = loadImage("copa.jpg");
  doc = loadImage("doc.jpg");
  sally = loadImage("sally.jpg");

  finalimg = loadImage("final.jpg");

  fuente = createFont("Arial Bold", 24);
  textFont(fuente);
}

void draw() {

  background(0);

  offsetX -= 1.5;

  // inicio
  if (empezar == false) {

    image(portada, 0, 0, width, height);

    fill(180, 0, 0);
    rect(220, 330, 200, 60, 20);

    fill(255);
    textSize(28);
    text("EMPEZAR", 248, 368);

    return;
  }

  // fondo animado
  if (offsetX <= -fondo.width) {
    offsetX = 0;
  }

  for (int x = int(offsetX) - fondo.width; x < width; x += fondo.width) {

    tint(255, 35);
    image(fondo, x, 0, fondo.width, height);
  }

  noTint();

  fill(0, 90);
  rect(0, 0, width, height);

  // ESCENA 1
  if (escena == 1) {

    image(radiator, posX, posY, 260, 180);

    fill(255, 180, 0);

    textSize(28);
    text("Radiator Springs", textoRadiator, 140);

    fill(255);

    textSize(15);

    text("Un pequeno pueblo ubicado en la Ruta 66,", textoRadiator, 200);
    text("conocido por su tranquilidad.", textoRadiator, 225);
    text("Aqui McQueen descubre que la vida", textoRadiator, 250);
    text("es mucho mas que solo competir.", textoRadiator, 275);

    if (textoRadiator > 320 && cambiarRadiator == false) {
      textoRadiator -= 6;
    }

    if (posX < 15 && cambiarRadiator == false) {
      posX += 4;
    }

    demoraRadiator++;

    if (demoraRadiator > 240) {
      cambiarRadiator = true;
    }

    if (cambiarRadiator == true) {

      posX -= 8;
      textoRadiator += 8;

      if (posX < -500) {
        escena = 2;
      }
    }
  }

  // ESCENA 2
  if (escena == 2) {

    image(mcqueen, mcqueenX, 110, 270, 180);

    fill(255, 0, 0);

    textSize(28);
    text("Rayo McQueen", textoMcqueenX, 135);

    fill(255);

    textSize(15);

    text("Rayo McQueen es un joven corredor", textoMcqueenX, 190);
    text("obsesionado con ganar la Copa Piston.", textoMcqueenX, 215);
    text("Su enorme ego lo lleva a pensar", textoMcqueenX, 240);
    text("solo en la fama y la velocidad.", textoMcqueenX, 265);

    if (cambiarMcqueen == false) {

      if (mcqueenX > 340) {
        mcqueenX -= 6;
      }

      if (textoMcqueenX < 35) {
        textoMcqueenX += 8;
      }

      demoraMcqueen++;

      if (demoraMcqueen > 300) {
        cambiarMcqueen = true;
      }
    }

    else {

      mcqueenX += 10;
      textoMcqueenX -= 10;

      if (mcqueenX > width + 300) {
        escena = 3;
      }
    }
  }

  // ESCENA 3
  if (escena == 3) {

    image(mate, mateX, 120, 240, 190);

    fill(200, 150, 80);

    textSize(28);
    text("Mate", textoMateX, 140);

    fill(255);

    textSize(15);

    text("Mate es el mejor amigo de McQueen.", textoMateX, 200);
    text("Aunque parece torpe y desordenado,", textoMateX, 225);
    text("siempre demuestra lealtad y amistad.", textoMateX, 250);

    if (cambiarMate == false) {

      if (mateX < 20) {
        mateX += 5;
      }

      if (textoMateX > 280) {
        textoMateX -= 6;
      }

      demoraMate++;

      if (demoraMate > 280) {
        cambiarMate = true;
      }
    }

    else {

      mateX -= 10;
      textoMateX += 10;

      if (mateX < -500) {
        escena = 4;
      }
    }
  }

  // ESCENA 4
  if (escena == 4) {

    image(copa, copaX, 120, 250, 160);

    fill(0, 180, 255);

    textSize(24);
    text("La Copa Piston", textoCopaX, textoCopaY);

    fill(255);

    textSize(13);

    text("La carrera final enfrenta a", textoCopaX, textoCopaY + 30);
    text("los mejores corredores.", textoCopaX, textoCopaY + 50);
    text("McQueen comprende que ayudar", textoCopaX, textoCopaY + 70);
    text("vale mas que ganar un trofeo.", textoCopaX, textoCopaY + 90);

    if (cambiarCopa == false) {

      if (copaX < 20) {
        copaX += 5;
      }

      // MAS A LA DERECHA
      if (textoCopaX < 330) {
        textoCopaX += 4;
      }

      if (textoCopaY > 170) {
        textoCopaY -= 4;
      }

      demoraCopa++;

      if (demoraCopa > 320) {
        cambiarCopa = true;
      }
    }

    else {

      copaX -= 10;
      textoCopaX += 8;
      textoCopaY += 8;

      if (copaX < -500) {
        escena = 5;
      }
    }
  }

  // ESCENA 5
  if (escena == 5) {

    image(doc, docX, 110, 260, 190);

    fill(100, 180, 255);

    textSize(28);
    text("Doc Hudson", textoDocX, 135);

    fill(255);

    textSize(14);

    text("Doc Hudson fue un famoso corredor", textoDocX, 190);
    text("antes de convertirse en mentor.", textoDocX, 215);
    text("Gracias a el, McQueen aprende", textoDocX, 240);
    text("el valor del trabajo en equipo.", textoDocX, 265);

    if (cambiarDoc == false) {

      if (docX < 20) {
        docX += 5;
      }

      if (textoDocX > 290 ) {
        textoDocX -= 7;
      }

      demoraDoc++;

      if (demoraDoc > 300) {
        cambiarDoc = true;
      }
    }

    else {

      docX -= 8;
      textoDocX += 8;

      if (docX < -500) {
        escena = 6;
      }
    }
  }

  // ESCENA 6
  if (escena == 6) {

    image(sally, sallyX, 110, 260, 180);

    fill(120, 200, 255);

    textSize(28);
    text("Sally Carrera", textoSallyX, 135);

    fill(255);

    textSize(14);

    text("Sally ayuda a McQueen a apreciar", textoSallyX, 190);
    text("la tranquilidad de Radiator Springs.", textoSallyX, 215);
    text("Junto a ella descubre una nueva", textoSallyX, 240);
    text("forma de ver la vida.", textoSallyX, 265);

    if (cambiarSally == false) {

      if (sallyX > 340) {
        sallyX -= 5;
      }

      if (textoSallyX < 35) {
        textoSallyX += 8;
      }

      demoraSally++;

      if (demoraSally > 320) {
        cambiarSally = true;
      }
    }

    else {

      sallyX += 10;
      textoSallyX -= 8;

      if (sallyX > width + 300) {
        escena = 7;
      }
    }
  }

  // FINAL
  if (escena == 7) {

    background(0);

    image(finalimg, 0, 0, width, height);

    fill(0, 170);
    rect(0, 0, width, height);

    fill(255);

    textSize(24);

    text("No se trata solo de ganar,", 165, 180);
    text("sino de disfrutar el camino.", 125, 220);

    stroke(255, 0, 0);
    strokeWeight(3);

    line(120, 260, 520, 260);

    noStroke();

    textSize(16);

    text("Presentacion realizada en Processing", 150, 320);
    text("sobre la pelicula Cars.", 220, 345);

    fill(180, 0, 0);
    rect(width/2 - 120, 380, 240, 60, 20);

    fill(255);

    textSize(22);

    text("VER NUEVAMENTE", width/2 - 92, 418);
  }
}

void mousePressed() {

  // empezar
  if (empezar == false &&
      mouseX > 220 && mouseX < 420 &&
      mouseY > 330 && mouseY < 390) {

    empezar = true;
  }

  // reiniciar
  if (escena == 7 &&
      mouseX > width/2 - 120 &&
      mouseX < width/2 + 120 &&
      mouseY > 380 &&
      mouseY < 440) {

    escena = 1;

    posX = -230;
    textoRadiator = 950;

    mcqueenX = 950;
    textoMcqueenX = -700;

    mateX = -500;
    textoMateX = 1000;

    copaX = -350;
    textoCopaY = 650;

    docX = -500;
    textoDocX = 1000;

    sallyX = 950;
    textoSallyX = -900;

    demoraRadiator = 0;
    demoraMcqueen = 0;
    demoraMate = 0;
    demoraCopa = 0;
    demoraDoc = 0;
    demoraSally = 0;

    cambiarRadiator = false;
    cambiarMcqueen = false;
    cambiarMate = false;
    cambiarCopa = false;
    cambiarDoc = false;
    cambiarSally = false;

    offsetX = 0;
  }
}
