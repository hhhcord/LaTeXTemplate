classdef Circle_private_prop
    % 円クラス

    % 円がもっている変数
    properties (SetAccess = private)
        pos = [0,0]
        r = 1
        linePlot
    end

    % 円がもっている関数
    methods
        % コンストラクタ
        function obj = Circle_private_prop(ax)
            obj.linePlot = plot(ax,0,0);
        end

        % 位置を変更してもらう
        function obj = SetPos(obj,newPos)
            obj.pos = newPos;
            obj.UpdateCircle();
        end
        
        % 半径を変更してもらう
        function obj = SetR(obj,newR)
            obj.r = newR;
            obj.UpdateCircle();
        end

        % 描画を更新してもらう
        function UpdateCircle(obj)
            ang = linspace(0,2*pi,360);
            x = obj.r * cos(ang) + obj.pos(1);
            y = obj.r * sin(ang) + obj.pos(2);

            obj.linePlot.XData = x;
            obj.linePlot.YData = y;
        end
    end
end