"use strict";
//This is a good example of resizing for a codepen app.
//It resizes as expected when the browser or animation window
//changes size.

//Remove default margin (8px?)
document.body.style.margin = "0px";
//Remove scrolling bars
document.documentElement.style.overflow = 'hidden';
//Get DOM element by ID.
var canvas = document.getElementById("canvas");
canvas.style.background = "rgb(10,10,30)";
var stage = new createjs.Stage("canvas");
var resize = false;

//Adding functionality to the onresize event.
//Signal to the tick method that it needs to adjust for resize.
window.onresize = function(){
  this.resize = true;
}
window.onresize();



function init(){
  // Set the function to run each frame and FPS
  createjs.Ticker.addEventListener("tick", tick);
  createjs.Ticker.setFPS(30);
  createjs.Ticker.useRAF = true;

  var moon = new createjs.Bitmap("https://dl.dropboxusercontent.com/u/49722688/images/moon.png");
  moon.alpha = 0;
  moon.image.onload = function(){
    new createjs.Tween.get(moon)
    .to({alpha:1.},4000)
  };
  moon.regX = moon.regY = 75;
  moon.addEventListener("tick",function(e){
    e.target.x = stage.canvas.width/3;
    e.target.y = stage.canvas.height/4;
  });
  stage.addChild(moon);
}


var starsPerTick = 4;
function tick(){
  for (var i = 0; i < starsPerTick; i++) {
    var star = new createjs.Shape();
    // Draw a star into center of a shape object
    star.graphics.s("#DDD").f("#FFF")
    .drawPolyStar(0,0,6,5,0.7,Math.random()*180);
    // Set object location and alpha
    star.set({x:Math.random()*canvas.width,
              y:Math.random()*canvas.height,
              alpha:0}); // Invisible
    // Add object to stage to make it visible
    stage.addChild(star);

    //Tween the fade in/out and rotation
    new createjs.Tween.get(star)
              // star fades in
    .to({alpha:0.8,rotation:90}, r*500+300, createjs.Ease.linear)
              // star fades out
    .to({alpha:0,rotation:180}, r*500+300, createjs.Ease.linear)
              // then call a function to remove it
              .call(function(){ stage.removeChild(star); });
    // Simultaneously tween the falling motion
    var r = Math.random();
    new createjs.Tween.get(star)
              // Use a second tween to add movement
              .to({x:star.x-r*20-10,y:star.y+r*100+10},1600)
  }

  if (window.resize){
    stage.canvas.width = window.innerWidth;
    stage.canvas.height = window.innerHeight;
    resize = false;
  }
  stage.update();
}

// Run the animation
init();
