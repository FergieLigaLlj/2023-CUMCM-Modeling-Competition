clear;clc;
%%经过7.1的定性分析后，我们已经从37个正向收益的单品中找到收益概率最小的十个单品，从十个单品中去除拟合收益较小的前4个（尽量保持各品类都有）即可。
%%该10个单品为：上海青，菜心，云南油麦菜，外地茼蒿，小青菜(1)，红莲藕带，野生粉藕，高瓜(2)，虫草花(份)，海鲜菇(包)。
%% X矩阵：代表该10个单品在2023-6-01到2023-6-30的每日销量
%X是一个10x30的矩阵。
%其中X(1,:)代表上海青的数据，以此类推，X(10,:)代表海鲜菇(包)的数据。
X=[12.857	6.394	7.56	10.695	5.83	9.468	5.829	4.349	6.892	9.484	8.374	3.121	4.41	1.863	3.15	4.733	12.387	4.598	2.187	3.404	2.59	4.121	4.698	5.127	1.383	1.42	1.823	5.553	4.687	7.036;
0	0	0	0	0	0	1.633	3.1	0	0	0	0	2.793	0.67	0	0	0	5.603	1.997	0	4.246	4.012	0	4.112	1.242	0	0.822	2.701	0	0;
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	4.232	0.573	0.293	0	0	0;
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	3.561	0	0	2.048	3.68	0	1.862	0.996	0	0	0;
3.308	1.97	9.495	8.334	7.552	7.113	3.542	3.843	7.435	9.296	10.706	5.675	7.218	6.762	6.85	6.299	13.081	14.071	7.442	6.494	5	5.755	5.155	5.97	4.788	5.446	3.005	2.578	7.81	4.709;
0.475	0.233	0.861	0.905	0.493	1.139	0.117	0.579	1.211	1.648	1.387	0.459	1.704	0	1.245	1.103	2.761	4.739	0.524	0.458	1.812	0.95	0.644	0.862	0.579	0.349	0.218	1.037	0.83	0.721;
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1.441	0	0.767	0.231;
0	0	0.191	1.01	0	0	0.966	0.279	0.207	0.974	0.487	0	0.864	0	0.182	0	0.464	0	0	0	0.244	0.219	0	0	1.589	0.289	0	0	0.779	0;
3	3	2	7	3	3	2	2	3	6	4	1	1	4	2	1	4	2	4	1	3	3	0	3	0	4	0	4	1	2;
5	11	17	12	2	6	6	11	7	12	14	6	10	8	4	12	14	12	3	7	9	10	9	7	7	2	11	6	10	3;
]
%% Y矩阵：代表该十个单品在2023-6-01到2023-6-30的计算出的成本加成定价
%Y是一个10x30的矩阵。
%其中Y(1,:)代表上海青的数据，以此类推，Y(10,:)代表海鲜菇(包)的数据。
Y=[7.011803202	7.011803202	7.946710296	7.946710296	7.946710296	7.946710296	7.946710296	7.946710296	7.946710296	7.946710296	7.946710296	7.946710296	7.946710296	7.946710296	7.946710296	7.946710296	9.349070936	9.349070936	9.349070936	9.349070936	9.349070936	9.349070936	9.349070936	9.349070936	9.349070936	9.349070936	9.349070936	9.349070936	9.349070936	9.349070936;
0	0	0	0	0	0	8.342989571	8.342989571	0	0	0	0	8.342989571	8.342989571	0	0	0	6.025492468	6.025492468	0	6.025492468	6.025492468	0	6.952491309	6.952491309	0	6.952491309	6.952491309	0 0;
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8.257827733	8.257827733	8.257827733	0	0	0;
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16.25135428	0	0	16.25135428	16.25135428	0	17.87648971	17.87648971	0	0	0;
4.460800714	4.460800714	4.460800714	4.460800714	4.460800714	5.799040928	6.691201071	6.691201071	6.691201071	6.691201071	6.691201071	6.691201071	6.691201071	6.691201071	6.691201071	5.799040928	5.799040928	5.799040928	5.799040928	5.799040928	5.799040928	5.799040928	5.799040928	5.799040928	5.799040928	5.799040928	5.799040928	5.799040928	5.799040928	5.799040928;
13.434089	13.434089	13.434089	13.434089	13.434089	13.434089	13.434089	11.03514454	11.03514454	11.03514454	11.03514454	11.03514454	11.03514454	0	11.03514454	11.03514454	11.03514454	11.03514454	11.03514454	11.03514454	11.03514454	11.03514454	11.03514454	11.03514454	11.03514454	11.03514454	11.03514454	11.03514454	11.03514454	11.03514454;
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29.77894857	0	29.77894857	29.77894857;
0	0	13.91189135	13.91189135	0	0	15.45765706	15.45765706	15.45765706	16.56177542	16.56177542	0	17.66589378	0	17.66589378	0	17.66589378	0	0	0	17.66589378	17.66589378	0	0	19.87413051	19.87413051	0	0	19.87413051	0;
4.195649774	4.195649774	4.195649774	4.195649774	4.195649774	4.195649774	4.195649774	4.195649774	4.195649774	4.195649774	4.195649774	4.195649774	4.195649774	4.195649774	4.195649774	4.195649774	4.195649774	4.195649774	4.195649774	4.195649774	4.195649774	4.195649774	0	4.195649774	4.195649774	4.195649774	0	4.195649774	4.195649774	4.195649774;
3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3;
]

%% ci代表成本价格，i=1,2,3,4,...,10.
c1=7.03;c2=4.6;c3=3.44;c4=11.69;c5=5.02;c6=5.3;c7=9.76;c8=9.68;c9=2.26;c10=2.67;
%% 单品总利润 w = x*(y-成本)
%% 每个单品拟合补货量和成本加成定价的关系：
%上海青：
S1=X(1,:);
S1=S1'
R1=Y(1,:);
R1=R1'
%% 拟合: '上海青'。
[xData, yData] = prepareCurveData( S1, R1 );

% 设置 fittype 和选项。
ft = fittype( 'poly1' );

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft, 'Normalize', 'on' );

% 绘制数据拟合图。
figure( 'Name', '上海青' );
h = plot( fitresult, xData, yData );
legend( h, 'R1 vs. S1', '上海青', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'S1', 'Interpreter', 'none' );
ylabel( 'R1', 'Interpreter', 'none' );
grid on
%菜心
S2=X(2,:);
S2=S2'
R2=Y(2,:);
R2=R2'
%剔除点（0，0）
S2=[1.6330;
    3.1000;
    2.7930;
    0.6700;
    5.6030;
    1.9970;
    4.2460;
    4.0120;
    4.1120;
    1.2420;
    0.8220;
    2.7010]
R2=[
    8.3430;
    8.3430;
    8.3430;
    8.3430;
    6.0255;
    6.0255;
    6.0255;
    6.0255;
    6.9525;
    6.9525;
    6.9525;
    6.9525]
%% 拟合: '菜心'。
[xData, yData] = prepareCurveData( S2, R2 );

% 设置 fittype 和选项。
ft = fittype( 'poly1' );

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft, 'Normalize', 'on' );

% 绘制数据拟合图。
figure( 'Name', '菜心' );
h = plot( fitresult, xData, yData );
legend( h, 'R2 vs. S2', '菜心', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'S2', 'Interpreter', 'none' );
ylabel( 'R2', 'Interpreter', 'none' );
grid on
%云南油麦菜
S3=X(3,:);
S3=S3'
R3=Y(3,:);
R3=R3'
%剔除点（0，0）
S4=[4.2320;
    0.5730;
    0.2930]
R3=[8.2578;
    8.2578;
    8.2578]
%% 拟合: '云南油麦菜'。
[xData, yData] = prepareCurveData( S4, R3 );

% 设置 fittype 和选项。
ft = fittype( 'poly1' );

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft );

% 绘制数据拟合图。
figure( 'Name', '云南油麦菜' );
h = plot( fitresult, xData, yData );
legend( h, 'R3 vs. S3', '云南油麦菜', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'S3', 'Interpreter', 'none' );
ylabel( 'R3', 'Interpreter', 'none' );
grid on
%外地茼蒿
S4=X(4,:);
S4=S4'
R4=Y(4,:);
R4=R4'
%剔除点（0，0）
S4=[3.5610;
    2.0480;
    3.6800;
    1.8620;
    0.9960]
R4=[16.2514;
   16.2514;
   16.2514;
   17.8765;
   17.8765]
%% 拟合: '外地茼蒿'。
[xData, yData] = prepareCurveData( S4, R4 );

% 设置 fittype 和选项。
ft = fittype( 'poly1' );

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft );

% 绘制数据拟合图。
figure( 'Name', '外地茼蒿' );
h = plot( fitresult, xData, yData );
legend( h, 'R4 vs. S4', '外地茼蒿', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'S4', 'Interpreter', 'none' );
ylabel( 'R4', 'Interpreter', 'none' );
grid on
%小青菜(1)
S5=X(5,:);
S5=S5'
R5=Y(5,:);
R5=R5'
%% 拟合: '小青菜(1)'。
[xData, yData] = prepareCurveData( S5, R5 );

% 设置 fittype 和选项。
ft = fittype( 'poly1' );

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft );

% 绘制数据拟合图。
figure( 'Name', '小青菜(1)' );
h = plot( fitresult, xData, yData );
legend( h, 'R5 vs. S5', '小青菜(1)', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'S5', 'Interpreter', 'none' );
ylabel( 'R5', 'Interpreter', 'none' );
grid on
%红莲藕带
S6=X(6,:);
S6=S6'
R6=Y(6,:);
R6=R6'
%剔除点（0，0）
S6 =[    0.4750
    0.2330
    0.8610
    0.9050
    0.4930
    1.1390
    0.1170
    0.5790
    1.2110
    1.6480
    1.3870
    0.4590
    1.7040
    1.2450
    1.1030
    2.7610
    4.7390
    0.5240
    0.4580
    1.8120
    0.9500
    0.6440
    0.8620
    0.5790
    0.3490
    0.2180
    1.0370
    0.8300
    0.7210]
R6=[   13.4341
   13.4341
   13.4341
   13.4341
   13.4341
   13.4341
   13.4341
   11.0351
   11.0351
   11.0351
   11.0351
   11.0351
   11.0351
   11.0351
   11.0351
   11.0351
   11.0351
   11.0351
   11.0351
   11.0351
   11.0351
   11.0351
   11.0351
   11.0351
   11.0351
   11.0351
   11.0351
   11.0351
   11.0351]
%% 拟合: '红莲藕带'。
[xData, yData] = prepareCurveData( S6, R6 );

% 设置 fittype 和选项。
ft = fittype( 'poly1' );

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft );

% 绘制数据拟合图。
figure( 'Name', '红莲藕带' );
h = plot( fitresult, xData, yData );
legend( h, 'R6 vs. S6', '红莲藕带', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'S6', 'Interpreter', 'none' );
ylabel( 'R6', 'Interpreter', 'none' );
grid on
%野生粉藕
S7=X(7,:);
S7=S7'
R7=Y(7,:);
R7=R7'
%剔除点（0，0）
S7 =[1.4410
    0.7670
    0.2310]
R7=[29.7789
    29.7789
    29.7789]
%% 拟合: '野生粉藕'。
[xData, yData] = prepareCurveData( S7, R7 );

% 设置 fittype 和选项。
ft = fittype( 'poly1' );

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft );

% 绘制数据拟合图。
figure( 'Name', '野生粉藕' );
h = plot( fitresult, xData, yData );
legend( h, 'R7 vs. S7', '野生粉藕', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'S7', 'Interpreter', 'none' );
ylabel( 'R7', 'Interpreter', 'none' );
grid on
%高瓜(2)
S8=X(8,:);
S8=S8'
R8=Y(8,:);
R8=R8'
%剔除点（0，0）
S8 =[
    0.1910
    1.0100
    0.9660
    0.2790
    0.2070
    0.9740
    0.4870
    0.8640
    0.1820
    0.4640
    0.2440
    0.2190
    1.5890
    0.2890
    0.7790]
R8 =[
   13.9119
   13.9119
   15.4577
   15.4577
   15.4577
   16.5618
   16.5618
   17.6659
   17.6659
   17.6659
   17.6659
   17.6659
   19.8741
   19.8741
   19.8741]
%% 拟合: '高瓜(2)'。
[xData, yData] = prepareCurveData( S8, R8 );

% 设置 fittype 和选项。
ft = fittype( 'poly1' );

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft );

% 绘制数据拟合图。
figure( 'Name', '高瓜(2)' );
h = plot( fitresult, xData, yData );
legend( h, 'R8 vs. S8', '高瓜(2)', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'S8', 'Interpreter', 'none' );
ylabel( 'R8', 'Interpreter', 'none' );
grid on
%虫草花(份)
S9=X(9,:);
S9=S9'
R9=Y(9,:);
R9=R9'
%剔除点（0，0）
S9 =[     3
     3
     2
     7
     3
     3
     2
     2
     3
     6
     4
     1
     1
     4
     2
     1
     4
     2
     4
     1
     3
     3
     3
     4
     0
     4
     1
     2]
R9 =[    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956
    4.1956]
%% 拟合: '虫草花(份)'。
[xData, yData] = prepareCurveData( S9, R9 );

% 设置 fittype 和选项。
ft = fittype( 'poly1' );

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft );

% 绘制数据拟合图。
figure( 'Name', '虫草花(份)' );
h = plot( fitresult, xData, yData );
legend( h, 'R9 vs. S9', '虫草花(份)', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'S9', 'Interpreter', 'none' );
ylabel( 'R9', 'Interpreter', 'none' );
grid on
%海鲜菇(包)
S10=X(10,:);
S10=S10'
R10=Y(10,:);
R10=R10'
%% 拟合: '海鲜菇(包)'。
[xData, yData] = prepareCurveData( S10, R10 );

% 设置 fittype 和选项。
ft = fittype( 'poly1' );

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft );

% 绘制数据拟合图。
figure( 'Name', '海鲜菇(包)' );
h = plot( fitresult, xData, yData );
legend( h, 'R10 vs. S10', '海鲜菇(包)', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'S10', 'Interpreter', 'none' );
ylabel( 'R10', 'Interpreter', 'none' );
grid on