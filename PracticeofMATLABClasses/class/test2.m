% 平面上の(0,0)と(1,4)の位置に、それぞれ半径1, 2の円を描画する。
ang = linspace(0,2*pi,360);

x1 = cos(ang);
y1 = sin(ang); 

x2 = 2 * cos(ang) + 1;
y2 = 2 * sin(ang) + 4; 

plot(x1,y1)
hold on
plot(x2,y2)
hold off