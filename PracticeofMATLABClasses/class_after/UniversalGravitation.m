classdef UniversalGravitation
    properties (SetAccess = private)
        apples (1,:) AppleMove
    end

    methods (Static)
        % 万有引力
        function force = GetForce(pos1, might1, pos2, might2)
            dif = pos2 - pos1;
            r = vecnorm(dif,2,1);
            G = 6.67259e-11;
            force = (dif ./ r) * G * (might1 * might2) / r^2;
        end
    end

    methods (Access = public)
        % 指定した数のりんごを空間に召喚
        function obj = UniversalGravitation(numApple)
            obj.apples(1,numApple) = AppleGravity;
        end

        % りんごの質量を設定する
        function obj = SetInitAppleMight(obj, newMights)
            if numel(obj.apples) ~= numel(newMights)
                error("りんごの数と質量ベクトルの要素数が一致しません。")
            end

            for idx = 1:numel(obj.apples)
                obj.apples(idx) = obj.apples(idx).SetMight(newMights(idx));
            end
        end

        % りんごの位置を設定する
        function obj = SetInitApplePos(obj, newPoses)
            arguments
                obj UniversalGravitation
                newPoses (2,:) double
            end

            if numel(obj.apples) ~= size(newPoses,2)
                error("りんごの数と位置ベクトルの要素数が一致しません。")
            end

            for idx = 1:numel(obj.apples)
                obj.apples(idx) = obj.apples(idx).SetInitPos(newPoses(:,idx));
            end
        end

        % りんごの初期速度を設定する。
        function obj = SetInitAppleVelocity(obj, newVelocity)
            arguments
                obj UniversalGravitation
                newVelocity (2,:) double
            end

            if numel(obj.apples) ~= size(newVelocity,2)
                error("りんごの数と速度ベクトルの要素数が一致しません。")
            end

            for idx = 1:numel(obj.apples)
                obj.apples(idx) = obj.apples(idx).SetInitVelocity(newVelocity(:,idx));
            end
        end

        % 時間ステップ設定
        function obj = SetDt(obj, dt)
            for idx = 1:numel(obj.apples)
                obj.apples(idx) = obj.apples(idx).SetDt(dt);
            end
        end

        % りんごを更新する
        function obj = Update(obj)
            positions = [obj.apples.pos];
            mights = [obj.apples.might];
            forces = 0 .* positions;
            
            for idx = 1:numel(obj.apples)
                for idy = 1:numel(obj.apples)
                    if idx == idy
                        continue;
                    end

                    forces(:,idx) = forces(:,idx) + obj.GetForce(positions(:,idx),mights(idx),positions(:,idy),mights(idy));
                end
            end

            for idx = 1:numel(obj.apples)
                obj.apples(idx) = obj.apples(idx).SetForce(forces(:,idx));
            end
        end
    end
end