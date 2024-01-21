figure
ax = axes(figure);
hold(ax,"on");
axis(ax,"equal");

circles = [];
for idx = 1:10
    circles = [circles, Circle_private_prop(ax)];
    newR = abs(rand(1))
    newPos = rand(1,2)
    circles(end) = circles(end).SetR(newR);
    circles(end) = circles(end).SetPos(newPos);
end