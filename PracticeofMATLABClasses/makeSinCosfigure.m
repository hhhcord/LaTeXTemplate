
%% 共通化できない編集
clearvars
close all;

% 一つ目の図の作成
fig = figure('name', '三角関数をプロット');
x = 0:0.001:4*pi;
ys = sin(x);
yc = cos(x);
plot(x, ys, x, yc);

% 描画範囲の指定
xlim([0, 2*pi]);
ylim([-1.2, 1.2]);

% 軸ラベルの設定
xlabel('$x$', 'Interpreter', 'latex');
ylabel('$y(x)$', 'Interpreter', 'latex');

% 凡例の設定
legend({'$y(x) = \sin(x)$', '$y(x) = \cos(x)$'}, 'Interpreter', 'latex');

% グリッド線の表示
grid on;

saveFigAsPdf(fig, {'三角関数(オリジナル)'});

% 二つ目の図の作成
fig2 = figure('name', 'subplotで三角関数を並べる');
ax = gobjects([2, 1]);
xRange = [0,2*pi];
yRange = [-1.2, 1.2];
ax(1) = subplot(2,1,1);
plot(x, ys);
xlim(xRange); ylim(yRange);
xlabel('$x$', 'Interpreter', 'latex');
ylabel('$\sin(x)$', 'Interpreter', 'latex');
grid on;
ax(2) = subplot(2,1,2);
plot(x, yc, 'r');
xlim(xRange); ylim(yRange);
xlabel('$x$', 'Interpreter', 'latex');
ylabel('$\cos(x)$', 'Interpreter', 'latex');
grid on;

%% 共通化可能な編集
% reshape_figure('qiita', fig);         % 一枚だけ編集
reshape_figure('qiita', [fig, fig2]);   % 複数の図を一度に編集

%% PDFへの書き出し
print(fig, '三角関数(組込み関数).pdf', '-dpdf');
saveFigAsPdf([fig, fig2], {'三角関数', '三角関数(分けた)'});
export_fig('gain_all.pdf', fig);

%% Qiitaへ乗せるためにImageMagickでPNGへ変換(コメントアウト)
% !magick -density 200 三角関数(オリジナル).pdf fig1_org.png
% !magick -density 200 三角関数(組込み関数).pdf fig1_print.png
% !magick -density 200 三角関数.pdf fig1.png
% !magick -density 200 三角関数(分けた).pdf fig2.png