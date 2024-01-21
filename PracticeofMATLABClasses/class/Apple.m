classdef Apple
    %UNTITLED2 このクラスの概要をここに記述
    %   詳細説明をここに記述

    properties (SetAccess = private)
        might double = 1;
        pos (1,2) double = [0,0];
    end

    methods
        function obj = SetMight(obj,newMight)
            obj.might = newMight;
        end

        function obj = SetPos(obj,newPos)
            obj.pos = newPos;
        end
    end
end