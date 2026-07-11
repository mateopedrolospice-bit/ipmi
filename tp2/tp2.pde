PImage imgPortada, imgFinal, imgSally, imgDoc, imgCopa, imgMcQueen;
int pantalla = -1;
int tiempoCambio;
PFont fuente;

float offsetX;

void setup() {
  size(640, 480);
  fuente = createFont("Arial", 32);
  textFont(fuente);
  
  imgPortada = loadImage("portada.jpg");
  imgFinal = loadImage("final.jpg");
  imgSally = loadImage("sally.jpg");
  imgDoc = loadImage("doc.jpg");
  imgCopa = loadImage("copa.jpg");
  imgMcQueen = loadImage("mcqueen.jpg");
  
  tiempoCambio = millis();
  offsetX = -width;
}

void draw() {
  background(0);
  
  if (pantalla == -1) {
    mostrarPortada();
  } else if (pantalla == 0) {
    mostrarPantalla1();
  } else if (pantalla == 1) {
    mostrarPantalla2();
  } else if (pantalla == 2) {
    mostrarPantalla3();
  } else if (pantalla == 3) {
    mostrarPantalla4();
  } else if (pantalla == 4) {
    mostrarPantalla5();
  } else if (pantalla >= 5) {
    mostrarReinicio();
  }
  
  if (pantalla >= 0 && pantalla < 5 && millis() - tiempoCambio > 5000) {
    pantalla++;
    tiempoCambio = millis();
    offsetX = -width;
  }
}

void textoConBordeAnimado(String contenido, float x, float y, int tam) {
  textAlign(CENTER);
  textSize(tam);
  
  float alpha = map(sin(frameCount * 0.05), -1, 1, 80, 255);
  
  fill(0, alpha);
  text(contenido, x+1, y+1);
  text(contenido, x-1, y-1);
  text(contenido, x+1, y-1);
  text(contenido, x-1, y+1);
  
  fill(255, alpha);
  text(contenido, x, y);
}

void mostrarImagenAnimada(PImage img) {
  offsetX = lerp(offsetX, 0, 0.1);
  image(img, offsetX, 0, width, height);
}

void mostrarPortada() {
  image(imgPortada, 0, 0, width, height);
  textoConBordeAnimado("PLAY", width/2, height - 80, 28);
}

void mostrarPantalla1() {
  mostrarImagenAnimada(imgFinal);
  textoConBordeAnimado("Los Amigos", width/2, 50, 26);
  
  float y = height/2 + 120;
  textoConBordeAnimado("McQueen y Mater viajan por el mundo en una aventura de carreras internacionales y espionaje.\nSu amistad se pone a prueba en medio de misiones secretas y desafíos inesperados.", width/2, y, 13);
}

void mostrarPantalla2() {
  mostrarImagenAnimada(imgSally);
  textoConBordeAnimado("Cars", width/2, 50, 26);
  
  float y = height/2 + 120;
  textoConBordeAnimado("En Radiator Springs, McQueen descubre que ganar no lo es todo.\nAprende sobre la importancia de la amistad, el trabajo en equipo y el valor de la comunidad.", width/2, y, 13);
}

void mostrarPantalla3() {
  mostrarImagenAnimada(imgDoc);
  textoConBordeAnimado("Doc Hudson", width/2, 50, 26);
  
  float y = height/2 + 120;
  textoConBordeAnimado("El legendario Hudson Hornet, retirado de las pistas, se convierte en mentor de McQueen.\nSu historia inspira al joven corredor a encontrar su verdadero camino.", width/2, y, 13);
}

void mostrarPantalla4() {
  mostrarImagenAnimada(imgCopa);
  textoConBordeAnimado("La gran carrera", width/2, 50, 26);
  
  float y = height/2 + 120;
  textoConBordeAnimado("La Piston Cup enfrenta a McQueen contra Chick Hicks y The King.\nLa carrera muestra que la integridad y el respeto valen más que un trofeo.", width/2, y, 13);
}

void mostrarPantalla5() {
  mostrarImagenAnimada(imgMcQueen);
  textoConBordeAnimado("La Nueva Generacion", width/2, 50, 26);
  
  float y = height/2 + 120;
  textoConBordeAnimado("McQueen se enfrenta a la nueva generación de corredores liderada por Jackson Storm.\nDescubre que compartir su experiencia puede ser su mayor victoria.", width/2, y, 13);
}

void mostrarReinicio() {
  textoConBordeAnimado("Reiniciar", width/2, height - 50, 24);
}

void mouseClicked() {
  if (pantalla == -1) {
    pantalla = 0;
    tiempoCambio = millis();
    offsetX = -width;
  } else if (pantalla >= 5) {
    pantalla = -1;
    tiempoCambio = millis();
    offsetX = -width;
  }
}
