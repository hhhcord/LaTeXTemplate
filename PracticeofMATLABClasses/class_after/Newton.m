num = 2;
ug = UniversalGravitation(num);
ug = ug.SetInitAppleMight(rand(1,num)*1e8 + 1e8);
ug = ug.SetInitApplePos((rand(2,num)-0.5)*10);
ug = ug.SetInitAppleVelocity((rand(2,num)-0.5)*0.1);

dt = 0.5;
ug = ug.SetDt(dt);

for t = 0:dt:1000
    ug = ug.Update();
end