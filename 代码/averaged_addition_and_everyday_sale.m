clear;clc;
%%X代表各单品（剔除每日都0销量的）在2023-6-24到2023-6-30每天的成本加成百分比
X = [4.190927835	4.190927835	4.190927835	4.190927835	3.56228866	3.56228866	3.56228866;
0	9.408779762	9.408779762	9.408779762	0	9.408779762	0;
4.170783699	4.170783699	4.170783699	4.170783699	3.545166144	3.545166144	3.545166144;
8.164210526	8.164210526	8.164210526	8.164210526	8.164210526	8.164210526	8.164210526;
6.178695652	6.178695652	0	6.178695652	6.178695652	0	0;
6.108714286	6.108714286	6.108714286	6.108714286	6.108714286	6.108714286	6.108714286;
0	7.468116279	7.468116279	7.468116279	0	0	0;
14.30595041	14.30595041	14.30595041	0	0	0	0;
6.84083293	6.84083293	6.84083293	6.84083293	6.84083293	6.84083293	6.84083293;
6.140333333	6.140333333	6.140333333	5.321622222	4.912266667	4.912266667	4.912266667;
12.26853721	0	13.49539093	13.49539093	0	0	0;
5.374222222	0	5.374222222	5.374222222	5.374222222	4.134017094	4.134017094;
5.307003984	5.307003984	5.307003984	5.307003984	5.307003984	5.307003984	5.307003984;
4.678298319	4.678298319	4.678298319	4.678298319	4.678298319	4.678298319	6.029806723;
4.660738636	4.660738636	4.660738636	4.660738636	4.660738636	4.660738636	4.660738636;
6.211233083	0	0	7.282135338	7.282135338	7.282135338	7.282135338;
0	0	0	0	0	0	4.01316;
14.14045504	14.14045504	14.14045504	12.12039003	12.12039003	11.31236403	11.31236403;
14.28452586	0	0	0	14.28452586	14.28452586	13.26420259;
16.09848889	16.09848889	16.09848889	16.09848889	16.09848889	16.09848889	16.09848889;
16.82831858	16.82831858	16.82831858	16.82831858	16.82831858	16.82831858	16.82831858;
14.16447433	14.16447433	0	14.16447433	14.16447433	14.16447433	14.16447433;
9.488671698	9.488671698	9.488671698	9.488671698	9.488671698	9.488671698	9.488671698;
0	0	0	26.33805328	0	26.33805328	26.33805328;
0	18.17535124	18.17535124	0	0	18.17535124	0;
26.21247027	26.21247027	26.21247027	26.21247027	26.21247027	26.21247027	26.21247027;
6.055518293	6.055518293	6.055518293	6.055518293	6.055518293	6.055518293	6.055518293;
6.184417178	6.184417178	6.184417178	6.184417178	6.184417178	6.184417178	0;
12.08023256	12.08023256	12.08023256	12.08023256	12.08023256	12.08023256	12.08023256;
0	0	0	9.167727273	0	9.167727273	0;
8.096895307	8.096895307	0	8.096895307	5.262981949	5.262981949	5.262981949;
10.14338028	10.14338028	12.17205634	12.17205634	12.17205634	12.17205634	12.17205634;
5.244638554	5.244638554	5.244638554	5.244638554	5.244638554	5.244638554	5.244638554;
5.920471366	5.920471366	5.920471366	5.920471366	5.920471366	5.920471366	5.920471366;
2.916831858	2.916831858	2.916831858	2.916831858	2.916831858	2.916831858	2.916831858;
4.962820144	0	3.928899281	0	0	0	0;
4.053878661	4.053878661	4.053878661	6.132790795	6.132790795	6.132790795	6.132790795;
20.00428228	21.01459956	21.01459956	21.01459956	21.01459956	21.01459956	0;
4.997659389	4.997659389	4.997659389	4.997659389	4.997659389	4.997659389	4.997659389;
6.026008264	6.026008264	0	6.026008264	6.026008264	6.026008264	6.026008264;
20.21703107	20.21703107	20.21703107	20.21703107	20.21703107	20.21703107	20.21703107;
24.18514286	24.18514286	24.18514286	24.18514286	24.18514286	24.18514286	24.18514286;
0	0	7.936656	0	6.919136	0	0;
3.958557522	0	3.958557522	0	3.958557522	3.958557522	3.958557522;
5.503055556	5.503055556	5.503055556	5.503055556	5.503055556	5.503055556	5.503055556;
5.806852321	0	5.806852321	5.806852321	0	0	0;
2.003488372	2.003488372	2.003488372	2.003488372	2.003488372	2.003488372	2.003488372;
3	3	3	3	3	3	3;
]
X(48,7);
%%Y代表各单品基于所在品类的销量权重
Y=[0.09816	0.11177	0.12039	0.10236	0.03539	0.07639	0.05600;
0.00000	0.00634	0.12340	0.00232	0.00000	0.02502	0.00000;
0.11298	0.15861	0.18611	0.13043	0.12219	0.08971	0.10727;
0.03496	0.01573	0.02198	0.01687	0.05160	0.04037	0.05858;
0.02804	0.01413	0.00000	0.00761	0.02510	0.00000	0.00000;
0.01316	0.05174	0.09482	0.02609	0.05490	0.03859	0.03185;
0.00000	0.04815	0.00887	0.00271	0.00000	0.00000	0.00000;
0.02217	0.02609	0.01974	0.00000	0.00000	0.00000	0.00000;
0.04773	0.06826	0.03096	0.13881	0.13008	0.10337	0.04996;
0.02735	0.03512	0.05403	0.06530	0.02263	0.04812	0.04896;
0.02509	0.00000	0.02882	0.00922	0.00000	0.00000	0.00000;
0.04506	0.00000	0.11821	0.06331	0.07887	0.05461	0.07530;
0.04071	0.05447	0.08431	0.02781	0.02395	0.06728	0.03921;
0.33412	0.26168	0.03096	0.20358	0.29733	0.21535	0.28309;
0.16365	0.14790	0.07740	0.13881	0.11150	0.18951	0.19150;
0.00682	0.00000	0.00000	0.06478	0.04646	0.05168	0.04996;
0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00833;
0.81287	1.00000	1.00000	1.00000	0.83397	0.65229	0.70183;
0.18713	0.00000	0.00000	0.00000	0.16603	0.34771	0.29817;
0.45366	0.32128	0.42564	0.34491	0.48162	0.31415	0.44526;
0.15406	0.13080	0.21005	0.13725	0.03659	0.14549	0.04487;
0.13948	0.15025	0.00000	0.14551	0.15085	0.18337	0.32843;
0.06793	0.05866	0.03716	0.02500	0.17324	0.04472	0.06973;
0.00000	0.00000	0.00000	0.16523	0.00000	0.04133	0.02234;
0.00000	0.16099	0.03077	0.00000	0.00000	0.04198	0.00000;
0.18487	0.17801	0.29639	0.18209	0.15770	0.22896	0.08936;
0.47844	0.70547	0.77247	0.48663	0.38815	0.46642	0.58561;
0.25020	0.16118	0.16764	0.10969	0.15654	0.08166	0.00000;
0.24079	0.10693	0.05989	0.27712	0.31417	0.24915	0.35830;
0.00000	0.00000	0.00000	0.06084	0.00000	0.04448	0.00000;
0.03056	0.02642	0.00000	0.06572	0.14114	0.15828	0.05609;
0.10456	0.08060	0.09787	0.06774	0.10545	0.08954	0.10718;
0.20223	0.17963	0.15705	0.26783	0.18867	0.17576	0.20115;
0.22487	0.25698	0.27356	0.29768	0.29943	0.38415	0.27839;
0.17990	0.10582	0.21277	0.06267	0.09981	0.08149	0.11389;
0.01124	0.00000	0.01520	0.00000	0.00000	0.00000	0.00000;
0.16865	0.19651	0.10638	0.07834	0.14972	0.20954	0.11389;
0.00842	0.01584	0.01704	0.01565	0.02542	0.00196	0.00000;
0.05622	0.13605	0.09119	0.12534	0.08318	0.02328	0.11389;
0.01124	0.01512	0.00000	0.06267	0.03327	0.01164	0.05062;
0.03266	0.01345	0.02895	0.02209	0.01505	0.02264	0.02101;
0.15773	0.15107	0.12987	0.14424	0.07232	0.09960	0.21497;
0.00000	0.00000	0.03626	0.00000	0.01933	0.00000	0.00000;
0.07657	0.00000	0.14502	0.00000	0.07731	0.02309	0.06542;
0.25523	0.21223	0.25379	0.23339	0.21259	0.13852	0.22897;
0.02552	0.00000	0.07251	0.03890	0.00000	0.00000	0.00000;
0.30628	0.38909	0.29004	0.15559	0.50249	0.50792	0.39252;
0.17866	0.24760	0.07251	0.42788	0.11596	0.23087	0.09813;
]
Y(48,7);
%%Z代表各单品(剔除全0销量)在2023-6-24到2023-6-30每天的成本加成百分比贡献值
Z = X .* Y;
%%初始化addition 各品类权重后的日成本加成
addition=zeros(6,7);
label = zeros(6,1);
%%48x7的矩阵中一列48个单品分成6大类，label(i,1)代表每一大类的单品种类个数
label(1,1)=17;label(2,1)=2;label(3,1)=7;label(4,1)=5;label(5,1)=10;label(6,1)=7;
for j = 1:7
    addition(1,j)=sum(Z(1:17,j));
    addition(2,j)=sum(Z(18:19,j));
    addition(3,j)=sum(Z(20:26,j));
    addition(4,j)=sum(Z(27:31,j));
    addition(5,j)=sum(Z(32:41,j));
    addition(6,j)=sum(Z(42:48,j));
end
%%addition代表各品类（剔除每日都0销量的）在2023-6-24到2023-6-30每天的成本加成百分比
disp(addition);
%%X代表各品类（剔除每日都0销量的）在2023-6-24到2023-6-30每天的销量
A=[146.656	87.895	64.597	108.063	107.625	116.09	120.104;
11.548	10.681	8.083	14.272	16.069	23.272	24.08;
12.69	9.87	9.393	8.721	5.986	18.558	10.34;
28.369	23.315	21.224	8.415	15.651	11.511	24.53;
88.94	66.153	65.8	63.828	60.114	85.903	79.026;
39.18	28.271	27.582	25.708	51.742	43.314	30.572;
]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%拟合各品类每日销量和每日加权加成定价关系%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%第一大类：花叶类
Hy_y=addition(1,:)
Hy_y=Hy_y'
Hy_x=A(1,:)
Hy_x=Hy_x'
%% 拟合: '花叶类'。
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
figure( 'Name', '花叶类' );
h = plot( fitresult, xData, yData );
legend( h, 'Hy_y vs. Hy_x', '花叶类', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'Hy_x', 'Interpreter', 'none' );
ylabel( 'Hy_y', 'Interpreter', 'none' );
grid on
%%显示花叶类高斯拟合
disp(ft)



%%%%%第二大类：花菜类
Hc_y=addition(2,:)
Hc_y=Hc_y'
Hc_x=A(2,:)
Hc_x=Hc_x'
%% 拟合: '花菜类高斯拟合'。
[xData, yData] = prepareCurveData( Hc_x, Hc_y );

% 设置 fittype 和选项。
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [14.1674150125466 11.548 7.51741962896822 11.1014038075237 23.272 2.83113447114561];

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft, opts );

% 绘制数据拟合图。
figure( 'Name', '花菜类高斯拟合' );
h = plot( fitresult, xData, yData );
legend( h, 'Hc_y vs. Hc_x', '花菜类高斯拟合', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'Hc_x', 'Interpreter', 'none' );
ylabel( 'Hc_y', 'Interpreter', 'none' );
grid on
%%显示花菜类高斯拟合
disp(ft)



%%%%%第三大类：水生根茎类
Ss_y=addition(3,:)
Ss_y=Ss_y'
Ss_x=A(3,:)
Ss_x=Ss_x'
%% 拟合: '水生根茎类'。
[xData, yData] = prepareCurveData( Ss_x, Ss_y );

% 设置 fittype 和选项。
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [19.2853712352819 8.721 3.24139949380204 18.3785964219526 18.558 2.48543734533352];

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft, opts );

% 绘制数据拟合图。
figure( 'Name', '水生根茎类' );
h = plot( fitresult, xData, yData );
legend( h, 'Ss_y vs. Ss_x', '水生根茎类', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'Ss_x', 'Interpreter', 'none' );
ylabel( 'Ss_y', 'Interpreter', 'none' );
grid on
%%显示水生根茎类高斯拟合
disp(ft)


%%%%%第四大类：茄类
Q_y=addition(4,:)
Q_y=Q_y'
Q_x=A(4,:)
Q_x=Q_x'
%% 拟合: '茄类'。
[xData, yData] = prepareCurveData( Q_x, Q_y );

% 设置 fittype 和选项。
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [8.16972005133114 24.53 10.6961838956575 7.21859923953297 8.415 3.02231151519];

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft, opts );

% 绘制数据拟合图。
figure( 'Name', '茄类' );
h = plot( fitresult, xData, yData );
legend( h, 'Q_y vs. Q_x', '茄类', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'Q_x', 'Interpreter', 'none' );
ylabel( 'Q_y', 'Interpreter', 'none' );
grid on
%%显示茄类高斯拟合
disp(ft)



%%%%%第五大类：辣椒类
Lj_y=addition(5,:)
Lj_y=Lj_y'
Lj_x=A(5,:)
Lj_x=Lj_x'
%% 拟合: '辣椒类'。
[xData, yData] = prepareCurveData( Lj_x, Lj_y );

% 设置 fittype 和选项。
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [6.70979450507094 60.114 14.7796264863746 6.1747180131464 85.903 3.94972378731181];

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft, opts );

% 绘制数据拟合图。
figure( 'Name', '辣椒类' );
h = plot( fitresult, xData, yData );
legend( h, 'Lj_y vs. Lj_x', '辣椒类', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'Lj_x', 'Interpreter', 'none' );
ylabel( 'Lj_y', 'Interpreter', 'none' );
grid on
%%显示辣椒类高斯拟合
disp(ft)




%%%%%第六大类：食用菌
Syj_y=addition(6,:)
Syj_y=Syj_y'
Syj_x=A(6,:)
Syj_x=Syj_x'
%% 拟合: '食用菌'。
[xData, yData] = prepareCurveData( Syj_x, Syj_y );

% 设置 fittype 和选项。
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [7.7988828801382 30.572 4.02724194998678 6.73928485762241 39.18 4.63859898665056];

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft, opts );

% 绘制数据拟合图。
figure( 'Name', '食用菌' );
h = plot( fitresult, xData, yData );
legend( h, 'Syj_y vs. Syj_x', '食用菌', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'Syj_x', 'Interpreter', 'none' );
ylabel( 'Syj_y', 'Interpreter', 'none' );
grid on
%%显示食用菌高斯拟合
disp(ft)




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%拟合各品类每日销量关系2023-6-24到2023-6-30%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%一周七天
T=[1;2;3;4;5;6;7]



%%第一类：花叶类
Cofhy_y=A(1,:);
Cofhy_y=Cofhy_y'
%% 拟合: '花叶类销量'。
[xData, yData] = prepareCurveData( T, Cofhy_y );

% 设置 fittype 和选项。
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [146.656 1 1.66640212977373 120.103656397588 7 1.85178463503987];

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft, opts );

% 绘制数据拟合图。
figure( 'Name', '花叶类销量' );
h = plot( fitresult, xData, yData );
legend( h, 'Cofhy_y vs. T', '花叶类销量', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'T', 'Interpreter', 'none' );
ylabel( 'Cofhy_y', 'Interpreter', 'none' );
grid on
%%显示花叶类销量趋势
disp(ft)



%%第二类：花菜类
Cofhc_y=A(2,:);
Cofhc_y=Cofhc_y'
%% 拟合: '花菜类销量'。
[xData, yData] = prepareCurveData( T, Cofhc_y );

% 设置 fittype 和选项。
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [24.08 7 1.21161402941692 14.4902997821162 5 1.71072997537348];

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft, opts );

% 绘制数据拟合图。
figure( 'Name', '花菜类销量' );
h = plot( fitresult, xData, yData );
legend( h, 'Cofhc_y vs. T', '花菜类销量', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'T', 'Interpreter', 'none' );
ylabel( 'Cofhc_y', 'Interpreter', 'none' );
grid on
%%显示花叶类销量趋势
disp(ft)




%%第三类：水生根茎类
Cofss_y=A(3,:);
Cofss_y=Cofss_y'
%% 拟合: '水生根茎类销量'。
[xData, yData] = prepareCurveData( T, Cofss_y );

% 设置 fittype 和选项。
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [18.558 6 0.88869905581123 12.6899999999997 1 1.27493726466862];

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft, opts );

% 绘制数据拟合图。
figure( 'Name', '水生根茎类销量' );
h = plot( fitresult, xData, yData );
legend( h, 'Cofss_y vs. T', '水生根茎类销量', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'T', 'Interpreter', 'none' );
ylabel( 'Cofss_y', 'Interpreter', 'none' );
grid on
%%显示水生根茎类销量趋势
disp(ft)



%%第四类:茄类
Cofq_y=A(4,:);
Cofq_y=Cofq_y'
%% 拟合: '茄类销量'。
[xData, yData] = prepareCurveData( T, Cofq_y );

% 设置 fittype 和选项。
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [28.369 1 1.45325788156546 24.5299988781066 7 1.17827237450103];

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft, opts );

% 绘制数据拟合图。
figure( 'Name', '茄类销量' );
h = plot( fitresult, xData, yData );
legend( h, 'Cofq_y vs. T', '茄类销量', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'T', 'Interpreter', 'none' );
ylabel( 'Cofq_y', 'Interpreter', 'none' );
grid on
%%显示茄类销量趋势
disp(ft)



%%第五类:辣椒类
Coflj_y=A(5,:);
Coflj_y=Coflj_y'
%% 拟合: '辣椒类销量'。
[xData, yData] = prepareCurveData( T, Coflj_y );

% 设置 fittype 和选项。
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [88.94 1 2.55660564485601 83.9621449997658 6 0.845913864235668];

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft, opts );

% 绘制数据拟合图。
figure( 'Name', '辣椒类销量' );
h = plot( fitresult, xData, yData );
legend( h, 'Coflj_y vs. T', '辣椒类销量', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'T', 'Interpreter', 'none' );
ylabel( 'Coflj_y', 'Interpreter', 'none' );
grid on
%%显示辣椒类销量趋势
disp(ft)


%%第六类:食用菌
Cofsyj_y=A(6,:);
Cofsyj_y=Cofsyj_y'
%% 拟合: '食用菌销量'。
[xData, yData] = prepareCurveData( T, Cofsyj_y );

% 设置 fittype 和选项。
ft = fittype( 'gauss2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [51.742 5 0.845406794620528 39.1799999901948 1 1.99063314521303];

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft, opts );

% 绘制数据拟合图。
figure( 'Name', '食用菌销量' );
h = plot( fitresult, xData, yData );
legend( h, 'Cofsyj_y vs. T', '食用菌销量', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'T', 'Interpreter', 'none' );
ylabel( 'Cofsyj_y', 'Interpreter', 'none' );
grid on
%%显示食用菌销量趋势
disp(ft)