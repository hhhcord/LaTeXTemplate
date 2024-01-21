circ3 = Circle_private_prop;
circ4 = Circle_private_prop;

circ3 = circ3.SetPos([0,0]);
circ3 = circ3.SetR(1);

circ4 = circ4.SetPos([1,4]);
circ4 = circ4.SetR(2);

figure
ax3 = axes(figure);
hold(ax3,"on");
axis(ax3,"equal");

circ3.DrawCircle(ax3);
circ4.DrawCircle(ax3);