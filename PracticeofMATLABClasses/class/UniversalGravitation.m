classdef UniversalGravitation

    properties (SetAccess = private)
        apples (1,:) Apple
        G = 6.67259e-11;
    end

    methods
        % 指定した数のりんごを空間に召喚
        function obj = UniversalGravitation(numApple)
            obj.apples(1,numApple) = Apple;
        end

        % りんごの質量を設定する
        function obj = SetAppleMight(obj, newMights)
            if numel(obj.apples) ~= numel(newMights)
                error("りんごの数と質量ベクトルの要素数が一致しません。")
            end

            for idx = 1:numel(obj.apples)
                obj.apples(idx) = obj.apples(idx).SetMight(newMights(idx));
            end
        end

        % りんごの位置を設定する
        function obj = SetApplePos(obj, newPoses)
            if numel(obj.apples) ~= size(newPoses,1)
                error("りんごの数と位置ベクトルの要素数が一致しません。")
            end

            for idx = 1:numel(obj.apples)
                obj.apples(idx) = obj.apples(idx).SetPos(newPoses(idx,:));
            end
        end
    end
end