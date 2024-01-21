classdef Apple
    properties (SetAccess = private)
        might double = 1;
    end

    methods
        function obj = SetMight(obj,newMight)
            obj.might = newMight;
        end
    end
end