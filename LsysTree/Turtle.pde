
class Turtle 
{

  String todo;
  float len;
  float theta;

  Turtle(String s, float l, float t) 
  {
    todo = s;
    len = l; 
    theta = t;
  }

  void render() 
  {
    //strokeWeight(2);
    strokeWeight(1);
    //stroke(0,255,0,255);
    //println(todo.length());
    for (int i = 0; i < todo.length(); i++) 
    {
      char c = todo.charAt(i);
      if (c == 'F' || c == 'G')
      {
        stroke(random(200),random(100,255),random(200));
        line(0, 0, len, 0);
        translate(len, 0);
      } 
      else if (c == '+') 
      {
        //rotate(random(theta));
        rotateZ(theta);
      } 
      else if (c == '-') 
      {
        //rotate(random(-theta));
        rotateZ(-theta);
      }
      
      else if (c == '*') 
      {
        //rotate(random(theta));
        rotateY(theta);
      } 
      else if (c == '/') 
      {
        //rotate(random(-theta));
        rotateY(-theta);
      }
      
      else if (c == '[') 
      {
        pushMatrix();
      } 
      else if (c == ']') 
      {
        popMatrix();
      }
    }
  }

  void setLen(float l) 
  {
    len = l;
  }
  float getLen() 
  {
    return len;
  }

  void changeLen(float percent) 
  {
    len *= percent;
  }

  void setToDo(String s) 
  {
    todo = s;
  }
}
