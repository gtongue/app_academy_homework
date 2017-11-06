document.addEventListener("DOMContentLoaded", function(){
  const canvas: HTMLCanvasElement = <HTMLCanvasElement>document.getElementById("myCanvas");
  canvas.width = 500;
  canvas.height = 500;

  const ctx = canvas.getContext('2d');
  ctx.fillStyle = 'black';
  ctx.fillRect(0, 0, 500, 500);
  
  ctx.strokeStyle = 'red';
  ctx.beginPath();
  ctx.arc(100,100,20,0,2 * Math.PI, true);
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = 'white';
  ctx.fill();
});
