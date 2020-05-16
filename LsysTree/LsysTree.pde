import peasy.*;
LSystem lsys;
Turtle turtle;
PeasyCam cm;
Cam cam;
void setup() 
{
  cam = new Cam();
  cm = new PeasyCam(this, 600);
  size(1000, 720,P3D);

  Rule[] ruleset = new Rule[1];
  //ruleset[0] = new Rule('F', "FF[-FF-F][+FF+F][*FF*F][/FF/F]");//25 degrees,200
  //ruleset[1] = new Rule('Y', "-FX-Y");//10000
  //ruleset[0] = new Rule('X', "X+YF+");
  
  //ruleset[0] = new Rule('F', "F+G-F-G+F");//10000
  //ruleset[1] = new Rule('G', "GG");
  
  //ruleset[0] = new Rule('F', "G-F-G");//10000
  //ruleset[1] = new Rule('G', "F+G+F");
  
  
  //ruleset[0] = new Rule('X', "F+[[X]-X/X]-F[-FX*X]+X");//10000
  //ruleset[1] = new Rule('F', "FF");
  
  //ruleset[0] = new Rule('F', "F+F--F+F");
  //ruleset[0] = new Rule('F', "FF+F+F+F+F+F-F");
  ruleset[0] = new Rule('F', "FF[+F][-F][*F][/F]");// 90 degrees,500
  //ruleset[0] = new Rule('F', "FF[+F--F][--F+F]");// 30 degrees,270
  //ruleset[0] = new Rule('F', "F[-F+F--F]+F--F[+F]+");//30 degrees,200,100
  lsys = new LSystem("F", ruleset);
  //lsys = new LSystem("FFFF[++++F][----F]", ruleset);
  //lsys = new LSystem("F--F--F", ruleset);
  //lsys = new LSystem("F+F+F+F", ruleset);
  turtle = new Turtle(lsys.getSentence(), 600, radians(90));
  //stroke(0);
  //line(width-100,height-100,width-100,height);
}

void draw()
{
  //cam.runCam();
  background(0);  
  fill(255);
  //text("Click mouse to generate", 10, height-10);
  //rectMode(CENTER);
  translate(0, height+100);
  rotate(-PI/2);
  turtle.render();
  //noLoop();
}

int counter = 0;

void keyPressed()
{
  if(key == 's')
  {
    if (counter < 10) 
    {
      pushMatrix();
      lsys.generate();
      //println(lsys.getSentence());
      turtle.setToDo(lsys.getSentence());
      turtle.changeLen(0.5);
      popMatrix();
      redraw();
      counter++;
    }
  }
}
