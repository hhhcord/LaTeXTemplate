classdef AppleMove < Apple
    properties (SetAccess = private)
        dt = 1e-3; % シミュレーションの時間ステップ
    end

    properties (SetAccess = private)
        % 位置・力・速度・加速度をメンバーに追加。
        pos (2,1) double = [0;0];
        forces (2,1) double = [0;0];
        velocity (2,1) double = [0;0];
        accel (2,1) double = [0;0];
    end
    
    % クラス内でしか使わない関数はprivateメソッドにしておく。
    methods (Access = private)
        function obj = UpdateAccel(obj)
            obj.accel = obj.forces / obj.might;
        end

        function obj = UpdateVelocity(obj)
            obj.velocity = obj.velocity + obj.accel * obj.dt;
        end

        function obj = UpdatePos(obj)
            obj.pos = obj.pos + obj.velocity * obj.dt;
        end

        function obj = Update(obj)
            obj = obj.UpdateAccel();
            obj = obj.UpdateVelocity();
            obj = obj.UpdatePos();
        end
    end

    methods
        function obj = SetInitPos(obj, initPos)
            obj.pos = initPos;
        end

        function obj = SetInitVelocity(obj, initVel)
            obj.velocity = initVel;
        end

        function obj = SetDt(obj, newDt)
            obj.dt = newDt;
        end

        function obj = SetForce(obj, newForce)
            obj.forces = newForce;
            obj = obj.Update();
        end
    end
end