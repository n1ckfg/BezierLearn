void mouseMover(int q) {
  if(mousePressed&&hitTrigger==false&&hitDetect(bob.points[q][0],bob.points[q][1],range)) {
    hitTrigger=true;
    catchEm = q;
  }
  if(hitTrigger) {
    selector = catchEm;
    bob.points[catchEm][0]=mouseX;
    bob.points[catchEm][1]=mouseY;
    ellipseMode(CENTER);
    noFill();
    stroke(255,0,0,100);
    strokeWeight(1);
    ellipse(bob.points[catchEm][0],bob.points[catchEm][1],range,range);
  }
  //println("hitTrigger: " + hitTrigger);
}


void mouseReleased() {
  hitTrigger=false;
  writeAll();
}

void keyPressed() {
  for(int i=0;i<bob.points.length;i++) {
    if(selector==i) {
      if(keyPressed&&keyCode==UP) {
        bob.points[i][1]--;
      }
      if(keyPressed&&keyCode==DOWN) {
        bob.points[i][1]++;
      }
      if(keyPressed&&keyCode==LEFT) {
        bob.points[i][0]--;
      }
      if(keyPressed&&keyCode==RIGHT) {
        bob.points[i][0]++;
      }
    }
  }
  if(key==',') {
    selector--;
  } 
  if (key=='.') {
    selector++;
  }
  if(selector<selectorMin) {
    selector=selectorMax;
  } 
  if (selector>selectorMax) {
    selector=selectorMin;
  }
  //---
  if(key==' ') {
    curves.add(new Curve(false,bob.points[0][0],bob.points[0][1],bob.points[1][0],bob.points[1][1],bob.points[2][0],bob.points[2][1],bob.points[3][0],bob.points[3][1]));
    if(headAnchor){      
      anchorX = bob.points[0][0];
    anchorY = bob.points[0][1];
    } else if(!headAnchor){
      anchorX = bob.points[3][0];
    anchorY = bob.points[3][1];
    }
    bob.initPoints();
  }
}
