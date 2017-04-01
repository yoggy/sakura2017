//
// sakura2017.pde
//
// github:
//     https://github.com/yoggy/sakura2017
//
// license:
//     Copyright (c) 2017 yoggy <yoggy0@gmail.com>
//     Released under the MIT license
//     http://opensource.org/licenses/mit-license.php;
//
import java.util.*;

List<SakuraParticle> sakuras;

void setup() {
  size(640, 480);

  sakuras = new ArrayList<SakuraParticle>();
}

void emit() {
  if (frameCount % 20 != 0) return;

  SakuraParticle p = new SakuraParticle();
  p.pos.x = width + 30;
  p.pos.y = random(0, height);
  p.scale = random(0.1, 0.3);
  p.v.x = random(-0.2, -0.1) * (p.scale*10);
  p.v.y = random(-0.1, 0.1);
  p.d_th = random(-0.005, 0.005);
  sakuras.add(p);
}

void draw() {
  emit();

  background(#5dbb75);

  for (SakuraParticle p : sakuras) {
    p.update();
  }

  for (SakuraParticle p : sakuras) {
    p.draw();
  }
}

class SakuraParticle {
  PVector pos = new PVector();
  PVector v   = new PVector();

  float th = 0.0f;
  float d_th = 0.005f;

  float scale = 1.0f;

  void update() {
    pos.x = pos.x + v.x;
    pos.y = pos.y + v.y;
    th = th + d_th;
  }

  void draw() {
    pushMatrix();

    translate(pos.x, pos.y);
    rotate(th);
    scale(this.scale);

    drawSakura();

    popMatrix();
  }
}

void drawSakura() {
  pushMatrix();
  for (int i = 0; i < 5; ++i) {
    rotate((PI * 2) / 5);

    fill(#f3e5e5);
    noStroke();
    drawSakuraPetal();
  }
  popMatrix();

  pushMatrix();
  for (int i = 0; i < 5; ++i) {
    rotate((PI * 2) / 5);

    noFill();
    stroke(#dcc2c6);
    strokeWeight(3);
    drawSakuraStamen();
  }
  popMatrix();
}

void drawSakuraPetal() {
  drawSakuraPetalHalf();
  scale(-1, 1);
  drawSakuraPetalHalf();
  scale(-1, 1);
}

void drawSakuraPetalHalf() {
  beginShape();
  vertex(0, -10);
  bezierVertex(-17, -15, -106, -131, -11, -180 );
  vertex(0, -160);
  vertex(0, -10);
  endShape();
}

void drawSakuraStamen() {
  line(0, 0, 0, -40);
  ellipse(0, -53, 20, 20);
}