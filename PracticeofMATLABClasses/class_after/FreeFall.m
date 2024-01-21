g = [0;-9.8];
m = 2;
force = m * g;
dt = 1e-3;

ag = AppleGravity;
ag = ag.SetMight(m);
ag = ag.SetInitPos([0;10]);
ag = ag.SetInitVelocity([2;3]);
ag = ag.SetDt(dt);

tend = 1;
x = [];
y = [];
for t = 0:dt:tend
    ag = ag.SetForce(force);
    x = [x, ag.pos(1)];
    y = [y, ag.pos(2)];
end