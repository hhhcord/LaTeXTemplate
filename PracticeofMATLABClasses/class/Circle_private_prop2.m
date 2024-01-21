classdef Circle_private_prop
    % 円クラス

    % 円がもっている変数
    properties (SetAccess = private)
        pos = [0,0]
        r = 1
    end

    % 円がもっている関数
    methods
        % 位置を変更してもらう
        function self = SetPos(obj,newPos)
            obj.pos = newPos;
        end
        
        % 半径を変更してもらう
        function self = SetR(obj,newR)
            obj.r = newR;
        end
        
        % 描画してもらう
        function DrawCircle(obj,ax)
            ang = linspace(0,2*pi,360);
            x = obj.r * cos(ang) + obj.pos(1);
            y = obj.r * sin(ang) + obj.pos(2);
            plot(ax,x,y)
        end
    end
end