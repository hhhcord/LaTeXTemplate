% 初歩的なクラス
circ1 = Circle;
circ2 = Circle;

circ1.pos = [0,0];
circ1.r = 1;

circ2.pos = [1,4];
circ2.r = 2;

figure
ax2 = axes(figure);
hold(ax2,"on");
axis(ax2,"equal");

circ1.DrawCircle(ax2);
circ2.DrawCircle(ax2);