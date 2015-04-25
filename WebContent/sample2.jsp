<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/reset.css" /> <!-- reset css -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<style>
    body{ background-color: ivory; }
    canvas{border:1px solid red;}
</style>
</head>
<body>
    <p>Original external image</p>
    <canvas id="canvas" width=140 height=140></canvas>
    <p>.getImageData with .crossOrigin='anonymous'
    <p>[Succeeds in Chrome+Mozilla, still fails in IE]</p>
    <canvas id="canvasAnonymous" width=140 height=140></canvas>
</body>
<script>
$(function(){

    var canvas=document.getElementById("canvas");
    var ctx=canvas.getContext("2d");
    var canvasCORS=document.getElementById("canvasCORS");
    var ctxCORS=canvasCORS.getContext("2d");
    var canvasAnonymous=document.getElementById("canvasAnonymous");
    var ctxAnonymous=canvasAnonymous.getContext("2d");

    // Using image WITHOUT crossOrigin=anonymous
    // Fails in all browsers
    var externalImage1=document.createElement("img");  // chrome bug prevents new Image();
    externalImage1.onload=function(){
        canvas.width=externalImage1.width;
        canvas.height=externalImage1.height;
        ctx.drawImage(externalImage1,0,0);
        // use getImageData to replace blue with yellow
        var imageData=recolorImage(externalImage1,0,0,255,255,255,0);
        // put the altered data back on the canvas  
        // this will FAIL on a CORS violation
        ctxCORS.putImageData(imageData,0,0);    
    }
    externalImage1.src="https://dl.dropboxusercontent.com/u/139992952/stackoverflow/colorhouse.png";

    // Using image WITH crossOrigin=anonymous
    // Succeeds in Chrome+Mozilla, Still fails in IE
    var externalImage2=new Image();
    externalImage2.onload=function(){
        canvas.width=externalImage2.width;
        canvas.height=externalImage2.height;
        ctx.drawImage(externalImage2,0,0);
        // use getImageData to replace blue with yellow
        var imageData=recolorImage(externalImage2,0,0,255,255,255,0);
        // put the altered data back on the canvas  
        // this will FAIL on a CORS violation
        ctxAnonymous.putImageData(imageData,0,0);    
    }
    externalImage2.crossOrigin = "Anonymous";
    externalImage2.src="https://dl.dropboxusercontent.com/u/139992952/stackoverflow/colorhouse.png";


    function recolorImage(img,oldRed,oldGreen,oldBlue,newRed,newGreen,newBlue){
        var c = document.createElement('canvas');
        var ctx=c.getContext("2d");
        var w = img.width;
        var h = img.height;
        c.width = w;
        c.height = h;

        // draw the image on the temporary canvas
        ctx.drawImage(img, 0, 0, w, h);

        // pull the entire image into an array of pixel data
        var imageData = ctx.getImageData(0, 0, w, h);

        // examine every pixel, 
        // change any old rgb to the new-rgb
        for (var i=0;i<imageData.data.length;i+=4)
          {
              // is this pixel the old rgb?
              if(imageData.data[i]==oldRed &&
                 imageData.data[i+1]==oldGreen &&
                 imageData.data[i+2]==oldBlue
              ){
                  // change to your new rgb
                  imageData.data[i]=newRed;
                  imageData.data[i+1]=newGreen;
                  imageData.data[i+2]=newBlue;
              }
          }
        return(imageData);
    }


}); // end $(function(){});
</script>


</html>