% 関数化する
pos1 = [0,0];
pos2 = [1,4];

r1 = 1;
r2 = 2;

figure
ax = axes(figure);
hold(ax,"on");
axis(ax,"equal");

DrawCircle(pos1,r1,ax);
DrawCircle(pos2,r2,ax);

% 円を描画する関数
function DrawCircle(pos, r, ax)
ang = linspace(0,2*pi,360);
x = r * cos(ang) + pos(1);
y = r * sin(ang) + pos(2); 
plot(ax,x,y)
end