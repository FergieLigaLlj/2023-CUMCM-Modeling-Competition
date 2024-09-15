function [fitresult, gof] = createFit(Hy_x, Hy_y)
%CREATEFIT(HY_X,HY_Y)
%  创建一个拟合。
%
%  要进行 '销量与成本加成' 拟合的数据:
%      X 输入: Hy_x
%      Y 输出: Hy_y
%  输出:
%      fitresult: 表示拟合的拟合对象。
%      gof: 带有拟合优度信息的结构体。
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 09-Sep-2023 12:50:22 自动生成


%% 拟合: '销量与成本加成'。
[xData, yData] = prepareCurveData( Hy_x, Hy_y );

% 设置 fittype 和选项。
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [6.06992623258916 64.597 34.2109985575676 5.34824982688662 146.656 24.6075637044289];

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft, opts );

% 绘制数据拟合图。
figure( 'Name', '销量与成本加成' );
h = plot( fitresult, xData, yData );
legend( h, 'Hy_y vs. Hy_x', '销量与成本加成', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'Hy_x', 'Interpreter', 'none' );
ylabel( 'Hy_y', 'Interpreter', 'none' );
grid on


