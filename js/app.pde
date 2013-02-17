
/*
@pjs font="js/data/Pakt Bold.ttf"; 
*/

/*

Tweening

*/


class TweenLibrary{
  
  TweenLibrary(){
  
  }
  
  /*
  Easing Equations v1.5
   May 1, 2003
   (c) 2003 Robert Penner, all rights reserved. 
   This work is subject to the terms in http://www.robertpenner.com/easing_terms_of_use.html.  
   
   These tweening functions provide different flavors of 
   math-based motion under a consistent API. 
   
   Types of easing:
   
   	  Linear
   	  Quadratic
   	  Cubic
   	  Quartic
   	  Quintic
   	  Sinusoidal
   	  Exponential
   	  Circular
   	  Elastic
   	  Back
   	  Bounce
   
   Changes:
   1.5 - added bounce easing
   1.4 - added elastic and back easing
   1.3 - tweaked the exponential easing functions to make endpoints exact
   1.2 - inline optimizations (changing t and multiplying in one step)--thanks to Tatsuo Kato for the idea
   
   Discussed in Chapter 7 of 
   Robert Penner's Programming Macromedia Flash MX
   (including graphs of the easing equations)
   
   http://www.robertpenner.com/profmx
   http://www.amazon.com/exec/obidos/ASIN/0072223561/robertpennerc-20
   */


  ///////////// LINEAR TWEEN: NO EASING ///////////////////

  // t: current time, b: beginning value, c: change in value, d: duration
  float linearTween (float t, float b, float c, float d) {
    return c*t/d + b;
  };

  ///////////// QUADRATIC EASING: t^2 ///////////////////

  // quadratic easing in - accelerating from zero velocity
  // t: current time, b: beginning value, c: change in value, d: duration
  // t and d can be in frames or seconds/milliseconds
  float easeInQuad (float t, float  b, float  c, float  d) {
    return c*(t/=d)*t + b;
  };

  // quadratic easing out - decelerating to zero velocity
  float easeOutQuad (float t, float  b, float  c, float  d) {
    return -c *(t/=d)*(t-2) + b;
  };

  // quadratic easing in/out - acceleration until halfway, then deceleration
  float easeInOutQuad (float t, float  b, float  c, float  d) {
    if ((t/=d/2) < 1) return c/2*t*t + b;
    return -c/2 * ((--t)*(t-2) - 1) + b;
  };

  ///////////// CUBIC EASING: t^3 ///////////////////////

  // cubic easing in - accelerating from zero velocity
  // t: current time, b: beginning value, c: change in value, d: duration
  // t and d can be frames or seconds/milliseconds
  float easeInCubic (float t, float  b, float  c, float  d) {
    return c*(t/=d)*t*t + b;
  };

  // cubic easing out - decelerating to zero velocity
  float easeOutCubic (float t, float  b, float  c, float  d) {
    return c*((t=t/d-1)*t*t + 1) + b;
  };

  // cubic easing in/out - acceleration until halfway, then deceleration
  float easeInOutCubic (float t, float  b, float  c, float  d) {
    if ((t/=d/2) < 1) return c/2*t*t*t + b;
    return c/2*((t-=2)*t*t + 2) + b;
  };

  ///////////// QUARTIC EASING: t^4 /////////////////////

  // quartic easing in - accelerating from zero velocity
  // t: current time, b: beginning value, c: change in value, d: duration
  // t and d can be frames or seconds/milliseconds
  float easeInQuart (float t, float  b, float  c, float  d) {
    return c*(t/=d)*t*t*t + b;
  };

  // quartic easing out - decelerating to zero velocity
  float easeOutQuart (float t, float  b, float  c, float  d) {
    return -c * ((t=t/d-1)*t*t*t - 1) + b;
  };

  // quartic easing in/out - acceleration until halfway, then deceleration
  float easeInOutQuart (float t, float  b, float  c, float  d) {
    if ((t/=d/2) < 1) return c/2*t*t*t*t + b;
    return -c/2 * ((t-=2)*t*t*t - 2) + b;
  };


  ///////////// QUINTIC EASING: t^5  ////////////////////

  // quintic easing in - accelerating from zero velocity
  // t: current time, b: beginning value, c: change in value, d: duration
  // t and d can be frames or seconds/milliseconds
  float easeInQuint (float t, float  b, float  c, float  d) {
    return c*(t/=d)*t*t*t*t + b;
  };

  // quintic easing out - decelerating to zero velocity
  float easeOutQuint (float t, float  b, float  c, float  d) {
    return c*((t=t/d-1)*t*t*t*t + 1) + b;
  };

  // quintic easing in/out - acceleration until halfway, then deceleration
  float easeInOutQuint (float t, float  b, float  c, float  d) {
    if ((t/=d/2) < 1) return c/2*t*t*t*t*t + b;
    return c/2*((t-=2)*t*t*t*t + 2) + b;
  };


  ///////////// SINUSOIDAL EASING: sin(t) ///////////////

  // sinusoidal easing in - accelerating from zero velocity
  // t: current time, b: beginning value, c: change in position, d: duration
  float  easeInSine (float t, float  b, float  c, float  d) {
    return -c * cos(t/d * (PI/2)) + c + b;
  };

  // sinusoidal easing out - decelerating to zero velocity
  float  easeOutSine (float t, float  b, float  c, float  d) {
    return c * sin(t/d * (PI/2)) + b;
  };

  // sinusoidal easing in/out - accelerating until halfway, then decelerating
  float  easeInOutSine (float t, float  b, float  c, float  d) {
    return -c/2 * (cos(PI*t/d) - 1) + b;
  };


  /////////// CIRCULAR EASING: sqrt(1-t^2) //////////////

  // circular easing in - accelerating from zero velocity
  // t: current time, b: beginning value, c: change in position, d: duration
  float  easeInCirc (float t, float  b, float  c, float  d) {
    return -c * (sqrt(1 - (t/=d)*t) - 1) + b;
  };

  // circular easing out - decelerating to zero velocity
  float  easeOutCirc (float t, float  b, float  c, float  d) {
    return c * sqrt(1 - (t=t/d-1)*t) + b;
  };

  // circular easing in/out - acceleration until halfway, then deceleration
  float  easeInOutCirc (float t, float  b, float  c, float  d) {
    if ((t/=d/2) < 1) return -c/2 * (sqrt(1 - t*t) - 1) + b;
    return c/2 * (sqrt(1 - (t-=2)*t) + 1) + b;
  };


  /////////// ELASTIC EASING: exponentially decaying sine wave  //////////////

  // t: current time, b: beginning value, c: change in value, d: duration, a: amplitude (optional), p: period (optional)
  // t and d can be in frames or seconds/milliseconds

  float  easeInElastic (float t, float  b, float  c, float  d, float  a, float  p) {

    float s;

    if (t==0) return b;  
    if ((t/=d)==1) return b+c;  
    if (p==0) p=d*.3;
    if (a < abs(c)) { 
      a=c; 
      s=p/4;
    }
    else {
      s = p/(2*PI) * asin (c/a);
    }
    return -(a*pow(2, 10*(t-=1)) * sin( (t*d-s)*(2*PI)/p )) + b;
  };

  float  easeOutElastic (float t, float  b, float  c, float  d, float  a, float  p) {

    float s;

    if (t==0) return b;  
    if ((t/=d)==1) return b+c;  
    if (p==0) p=d*.3;
    if (a < abs(c)) { 
      a=c; 
      s=p/4;
    }
    else s = p/(2*PI) * asin (c/a);
    return a*pow(2, -10*t) * sin( (t*d-s)*(2*PI)/p ) + c + b;
  };

  float  easeInOutElastic (float t, float  b, float  c, float  d, float  a, float  p) {

    float s;

    if (t==0) return b;  
    if ((t/=d/2)==2) return b+c;  
    if (p==0) p=d*(.3*1.5);
    if (a < abs(c)) { 
      a=c;
      s=p/4;
    }
    else s = p/(2*PI) * asin (c/a);
    if (t < 1) return -.5*(a*pow(2, 10*(t-=1)) * sin( (t*d-s)*(2*PI)/p )) + b;
    return a*pow(2, -10*(t-=1)) * sin( (t*d-s)*(2*PI)/p )*.5 + c + b;
  };

  /////////// BACK EASING: overshooting cubic easing: (s+1)*t^3 - s*t^2  //////////////

  // back easing in - backtracking slightly, then reversing direction and moving to target
  // t: current time, b: beginning value, c: change in value, d: duration, s: overshoot amount (optional)
  // t and d can be in frames or seconds/milliseconds
  // s controls the amount of overshoot: higher s means greater overshoot
  // s has a default value of 1.70158, which produces an overshoot of 10 percent
  // s==0 produces cubic easing with no overshoot
  float easeInBack (float t, float b, float c, float d, float _s) {
    float s;
    s=_s;
    if (s == 0) s = 1.70158;
    return c*(t/=d)*t*((s+1)*t - s) + b;
  };

  // back easing out - moving towards target, overshooting it slightly, then reversing and coming back to target
  float easeOutBack (float t, float b, float c, float d, float _s) {

    float s;
    s=_s;

    if (s == 0) s = 1.70158;
    return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
  };

  // back easing in/out - backtracking slightly, then reversing direction and moving to target,
  // then overshooting target, reversing, and finally coming back to target
  float easeInOutBack (float t, float b, float c, float d, float _s) {

    float s;
    s=_s;

    if (s == 0) s = 1.70158; 
    if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
    return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;
  };


  /////////// BOUNCE EASING: exponentially decaying parabolic bounce  //////////////

  // bounce easing in
  // t: current time, b: beginning value, c: change in position, d: duration
  float easeInBounce (float t, float  b, float  c, float  d) {
    return c - easeOutBounce (d-t, 0, c, d) + b;
  };

  // bounce easing out
  float easeOutBounce (float t, float  b, float  c, float  d) {
    if ((t/=d) < (1/2.75)) {
      return c*(7.5625*t*t) + b;
    } 
    else if (t < (2/2.75)) {
      return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
    } 
    else if (t < (2.5/2.75)) {
      return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
    } 
    else {
      return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
    }
  };

  // bounce easing in/out
  float easeInOutBounce (float t, float  b, float  c, float  d) {
    if (t < d/2) return easeInBounce(t*2, 0, c, d) * .5 + b;
    return easeOutBounce(t*2-d, 0, c, d) * .5 + c*.5 + b;
  };

}


class Tween {
  
  TweenLibrary tweenLibrary;

  float val;

  float currentTime, begin, finish, change, duration;
  float amplitude, period;
  float startTime;

  Boolean doTween;

  String type;

  Tween(TweenLibrary _tweenLibrary) {
    
    tweenLibrary=_tweenLibrary;
    
    val=0;

    doTween=false;
    
  }

  void update() {

    //TWEEN
    if (doTween) {

      currentTime=millis()-startTime;

      if (currentTime<duration) {

        if (type=="linearTween") {
          val=tweenLibrary.linearTween(currentTime, begin, change, duration);
        }
        else if (type=="easeInQuad") {
          val=tweenLibrary.easeInQuad(currentTime, begin, change, duration);
        }
        else if (type=="easeOutQuad") {
          val=tweenLibrary.easeOutQuad(currentTime, begin, change, duration);
        }
        else if (type=="easeInOutQuad") {
          val=tweenLibrary.easeInOutQuad(currentTime, begin, change, duration);
        }
        else if (type=="easeInCubic") {
          val=tweenLibrary.easeInCubic(currentTime, begin, change, duration);
        }
        else if (type=="easeOutCubic") {
          val=tweenLibrary.easeOutCubic(currentTime, begin, change, duration);
        }
        else if (type=="easeInOutCubic") {
          val=tweenLibrary.easeInOutCubic(currentTime, begin, change, duration);
        }
        else if (type=="easeInQuart") {
          val=tweenLibrary.easeInQuart(currentTime, begin, change, duration);
        }
        else if (type=="easeOutQuart") {
          val=tweenLibrary.easeOutQuart(currentTime, begin, change, duration);
        }
        else if (type=="easeInOutQuart") {
          val=tweenLibrary.easeInOutQuart(currentTime, begin, change, duration);
        }
        else if (type=="easeInQuint") {
          val=tweenLibrary.easeInQuint(currentTime, begin, change, duration);
        }
        else if (type=="easeOutQuint") {
          val=tweenLibrary.easeOutQuint(currentTime, begin, change, duration);
        }
        else if (type=="easeInOutQuint") {
          val=tweenLibrary.easeInOutQuint(currentTime, begin, change, duration);
        }
        else if (type=="easeInSine") {
          val=tweenLibrary.easeInSine(currentTime, begin, change, duration);
        } 
        else if (type=="easeOutSine") {
          val=tweenLibrary.easeOutSine(currentTime, begin, change, duration);
        } 
        else if (type=="easeInOutSine") {
          val=tweenLibrary.easeInOutSine(currentTime, begin, change, duration);
        }
        else if (type=="easeInCirc") {
          val=tweenLibrary.easeInCirc(currentTime, begin, change, duration);
        }
        else if (type=="easeOutCirc") {
          val=tweenLibrary.easeOutCirc(currentTime, begin, change, duration);
        }
        else if (type=="easeInOutCirc") {
          val=tweenLibrary.easeInOutCirc(currentTime, begin, change, duration);
        }
        else if (type=="easeInElastic") {
          val=tweenLibrary.easeInElastic(currentTime, begin, change, duration, amplitude, period);
        }
        else if (type=="easeOutElastic") {
          val=tweenLibrary.easeOutElastic(currentTime, begin, change, duration, amplitude, period);
        }
        else if (type=="easeInOutElastic") {
          val=tweenLibrary.easeInOutElastic(currentTime, begin, change, duration, amplitude, period);
        }
        else if (type=="easeInBack") {
          val=tweenLibrary.easeInBack(currentTime, begin, change, duration, 0.0);
        }
        else if (type=="easeOutBack") {
          val=tweenLibrary.easeOutBack(currentTime, begin, change, duration, 0.0);
        }
        else if (type=="easeInOutBack") {
          val=tweenLibrary.easeInOutBack(currentTime, begin, change, duration, 0.0);
        }
        else if (type=="easeInBounce") {
          val=tweenLibrary.easeInBounce(currentTime, begin, change, duration);
        } 
        else if (type=="easeOutBounce") {
          val=tweenLibrary.easeOutBounce(currentTime, begin, change, duration);
        } 
        else if (type=="easeInOutBounce") {
          val=tweenLibrary.easeInOutBounce(currentTime, begin, change, duration);
        }
      }
      else {
        val=finish;
        doTween=false;
      }
    }

    //FINE UPDATE
  }

  void setTween(String _type,float _begin, float _finish, float _duration) {
    
    type=_type;
    
    begin=_begin;
    finish=_finish;
    duration=_duration*1000;

    change=finish-begin;

    currentTime=-1;
    startTime=-1;

    amplitude=0;
    period=400; //0 stiff spring - 1000 smooth spring
  }


  void start() {

    doTween=true;
    currentTime=millis();
    startTime=millis();
  }


  void stop() {

    doTween=false;

    change=0;

    currentTime=-1;
    startTime=-1;
  }


  


  //FINE TWEEN
}


/* Face */


class FaceMouth {
  PVector pos;

  float width;
  float height;

  FaceMouth() {
    pos = new PVector(0, 70);
    width=60;
    height = -10;
  } 

  void draw() {
    stroke(255);
    strokeWeight(4);

    pushMatrix();
    translate(pos.x, pos.y);


    float startAngle, endAngle;

    if (height < 0) {
      startAngle = PI;
      endAngle = 2*PI;
    } 
    else {
      startAngle = 0;
      endAngle = PI;
    }
    
    noFill();
    arc(0, 0, width, abs(height), startAngle, endAngle);

    popMatrix();
  }
}

class FaceNose {
  PVector pos;
  float width;
  float height;

  FaceNose() {
    pos = new PVector(0, 50);
    width = 20;
    height=40;
  } 

  void draw() {

    strokeWeight(3.0);
    stroke(255);

    pushMatrix();
    translate(pos.x, pos.y);

    line(-width/2, 0, width/2, 0);
    line(-width/2.0, 0, 0, -height);

    popMatrix();
  }
}

class FaceEyebrows {
  PVector pos;
  float width;
  float distance;
  float rotateAngle;

  FaceEyebrows() {
    pos = new PVector(0, -20);
    width = 40.0; 
    distance = 60.0;
    rotateAngle = radians(-5);
  }

  void draw() {

    stroke(0);
    strokeWeight(5);
    pushMatrix();

    translate(pos.x, pos.y);

    pushMatrix();
    translate(-distance/2, 0);
    rotate(rotateAngle);
    line(-width/2, 0, width/2, 0);
    popMatrix();

    pushMatrix();
    translate(distance/2.0, 0);
    rotate(-rotateAngle);
    line(-width/2, 0, width/2, 0);
    popMatrix();

    popMatrix();
  }
}

class FaceEyes {
  PVector pos; // center position
  float height; // how open
  float animatedHeightValue;
  float animatedHeight;
  float animationSpeed;
  float width; // how big
  float distance; // distance between left right
  float pupilOffset;
  boolean animate;

  float closingFactor;


  FaceEyes() {

    pos = new PVector(0, 0);
    animatedHeightValue = 0.0;
    animationSpeed = 0.05;
    animate = false;
    height = 20.0;
    width = 40.0;
    distance = 60;
	pupilOffset = 0;
  }

  void draw() {

	float faceMulti = 0;
	
	if(closingFactor > 0.7 && closingFactor < 0.8) {
		faceMulti = closingFactor;
	}
	
    strokeWeight(1);

    pushMatrix();
    translate(pos.x, pos.y);

    float pupilRadius = map(animatedHeight, 0, 20, 0, 15);

	pupilRadius *= (1.0 - faceMulti);

    pushMatrix();
    noFill();
    stroke(255);
    translate(-distance/2.0, 0); 
    ellipse(0, 0, width, animatedHeight*(1.0 - faceMulti));

    fill(255);
    ellipse(0+pupilOffset, 0, pupilRadius, pupilRadius);
    fill(30, 30, 30, 100);
    ellipse(0+pupilOffset, 0, pupilRadius/2, pupilRadius/2);
    
popMatrix();

    pushMatrix();
    noFill();
    translate(distance/2.0, 0);
    ellipse(0, 0, width, animatedHeight*(1.0 - faceMulti));

    fill(255);
    ellipse(0+pupilOffset, 0, pupilRadius, pupilRadius);
    fill(30, 30, 30, 100);
    ellipse(0+pupilOffset, 0, pupilRadius/2, pupilRadius/2);
    popMatrix();

    popMatrix();
  }

  void update() {
    if (animate) {
      animatedHeightValue += animationSpeed;   
      if (animatedHeightValue >= 1.0) animatedHeightValue -= 1.0;
      
    } 
    else {
      animatedHeight = height;
    }
  }
};

class Face {
  float pos, neg, neu;

  FaceEyes eyes;
  FaceEyebrows eyebrows;
  FaceNose nose;
  FaceMouth mouth;

  Face() {
    eyes = new FaceEyes(); 
    eyebrows = new FaceEyebrows();
    nose = new FaceNose();
    mouth = new FaceMouth();
  }

  void draw() {
    noStroke();
    fill(0,198,245);
    ellipse(0,20,160,160);
    
    eyes.draw();
    eyebrows.draw(); 
    nose.draw();
    mouth.draw();
  }

  void update() {
    float mood = pos-neg;

    // mouth
    float mHeight = map(mood, -10, 10, -10, 10);
    mHeight = constrain(mHeight, -10.0, 10.0);
    mouth.height = mHeight;

    // eyebrows
    float mAngle = map(mood, -10, 10, -10, 0);
    mAngle = constrain(mAngle, -10.0, 0);
    eyebrows.rotateAngle = radians(mAngle);

    // eyes
    float eyeHeight = map(mood, -10,10,10,20);
    eyeHeight = constrain(eyeHeight, 10,20);
    eyes.height =eyeHeight;

    // nose
    
    float noseWidth = map(mood, -10,10,25,20);
    noseWidth = constrain(noseWidth, 20,25);
    nose.width = noseWidth;
    
    float noseHeight = map(mood, -10,10,30,35);
    noseHeight = constrain(noseHeight, 30,35);
    nose.height = noseHeight;

    eyes.update();
  }

  void setMood(float p, float n, float ne) {
    pos = p;
    neg = n;
    neu = ne;
  }
};



ArrayList cities;
PFont font;


class City {
	string name;
	string query;

	int positive;
	int negative;
	int neutral;
	
	int targetpositive;
	int targetnegative;
	int targetneutral;
	
	Face fc;
	
	
	PVector pos;
	
	City() {
		fc = new Face();
	}
	
	void update() {
		if(positive > targetpositive) {
			positive--;
		} else if(positive < targetpositive) {
			positive++;
		}
		
		if(negative > targetnegative) {
			negative--;
		} else if(negative < targetnegative) {
			negative++;
		}
		
		if(neutral > targetneutral) {
			neutral--;
		} else if(neutral < targetneutral) {
			neutral++;
		}
	
		fc.setMood(positive+floor(0.6*neutral), negative+floor(0.3*neutral),neutral);
		fc.update();
	}
	
	void drawPie(withFont) {
		float angle = 0;
		
		float negativeAngle = map(negative, 0, 100, 0, 2*PI);
		float positiveAngle = map(positive, 0, 100, 0, 2*PI);
		float neutralAngle = map(neutral, 0, 100, 0, 2*PI);
		
		float arcRadius = 100;
		
		fill(100,200,255);
		arc(0,0,arcRadius,arcRadius,angle,angle+positiveAngle);
		angle+=positiveAngle;
		fill(255,arcRadius,arcRadius);
		arc(0,0,arcRadius,arcRadius,angle,angle+negativeAngle);
		angle+=negativeAngle;
		fill(255);
		arc(0,0,arcRadius,arcRadius,angle,2*PI);
		
		stroke(255);
		fill(100,200,255);
		text("Positive: "+positive,300,-20);
		fill(255,arcRadius,arcRadius);	
		text("Negative: "+negative,300, 0);
		fill(255);
		text("Neutral: "+neutral,300, 20);			
	}
	
	void drawFace() {
		pushMatrix();
		fc.draw();
		popMatrix();
	}
};

TweenLibrary tl;

Tween eyesTw;
Tween eyesClosingTw;
bool reverseEyesTween;

void setup() {
	size(900,900);	
	font = createFont("Pakt Bold",14);
	textFont(font);
	tl = new TweenLibrary();
	
	eyesTw = new Tween(tl);
	eyesClosingTw = new Tween(tl);
	eyesClosingTw.setTween("easeInQuint", 0,1.0,10.0);
	eyesClosingTw.start();
	
	eyesTw.setTween("easeInOutBack",-10.0,10.0,5);
	eyesTw.start();
	reverseEyesTween = false;
	
	cities = new ArrayList();
}

void draw() {
	// tweens
	if(eyesTw.doTween){
		eyesTw.update();
	} else {
		eyesTw.setTween("easeInOutBack",-eyesTw.begin,-eyesTw.finish,5);
		eyesTw.start();
	}
	
	if(eyesClosingTw.doTween) {
		eyesClosingTw.update();

	} else {
	//	eyesClosingTw.setTween("easeInQuint", 1.0 - eyesClosingTw.begin,1.0-eyesClosingTw.finish,10);
		eyesClosingTw.start();
	}
	

	background(0);
	fill(255);
	stroke(255);
	pushMatrix();
	translate(260,50);
	scale(3.0,3.0,0.0);
	pushMatrix();
	translate(1.0,1.0);
	fill(50,50,50);
	text("Twitter Mood Around The World", 0,0);
	popMatrix();
	fill(195,195,195);
	text("Twitter Mood Around The World", 0,0);	
	popMatrix();
	
	text("Last Updated: "+appVars.lastUpdateTime, 420,100);
	
	int i=0;
	pushMatrix();
	translate(200,100);

	for(int i=0;i<cities.size();i++) {
	
	
		cities.get(i).update();
	
		// tweening
		cities.get(i).fc.eyes.pupilOffset = eyesTw.val;
		cities.get(i).fc.eyes.closingFactor = eyesClosingTw.val;
	
		pushMatrix();
		translate(cities.get(i).pos.x, cities.get(i).pos.y);
		scale(2.0,2.0,0.0);
		fill(255);
		text(cities.get(i).name,0,0 );
		popMatrix();
		
		stroke(0);
		pushMatrix();
		translate(220, cities.get(i).pos.y);
		cities.get(i).drawPie(font);
		popMatrix();
		
		pushMatrix();
		translate(cities.get(i).pos.x+340, cities.get(i).pos.y-10);
		scale(0.6,0.6);
		cities.get(i).drawFace();
		
		
		
		popMatrix();
	}
	
	if(cities.size() == 0) {
		text('Loading Twitter Data...', 200,300);
	}
	
	popMatrix();
}

void addCities() {
	cities.clear();
	int index = 1;
	var cityNames = Object.keys(appVars.cities);
	cityNames.forEach(function(cityName) {
		City c = new City();
		c.name = appVars.cities[cityName].name;
		c.query = appVars.cities[cityName].query;
		c.pos = new PVector(0, index*120.0);
		
		cities.add(c);
		index += 1;
	});
	console.log('cities added: '+cities.size());
	updateCities();
}

void updateCities() {
	int index = 0;
	if(cities.size() > 0) {
		var cityNames = Object.keys(appVars.cities);
	
		cityNames.forEach(function(cityName) {
			cities.get(index).targetpositive = appVars.cities[cityName].positive;
			cities.get(index).targetnegative = appVars.cities[cityName].negative;
			cities.get(index).targetneutral = appVars.cities[cityName].neutral;
			
			index++;
		});	
	}
}
