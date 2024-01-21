classdef Circle
    % 円クラス

    % 円がもっている変数
    properties 
        pos;
        r;
    end

    % 円がもっている関数
    methods
        function DrawCircle(obj,ax)
            ang = linspace(0,2*pi,360);
            x = obj.r * cos(ang) + obj.pos(1);
            y = obj.r * sin(ang) + obj.pos(2);
            plot(ax,x,y)
        end
    end
end