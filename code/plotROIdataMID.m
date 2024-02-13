clear
close all;
clc

% Daniel Sazhin
% Adapted from D.Smith's code in r21-cardgame
% ISTART
% 07/13/23
% DVS Lab
% Temple University

% This code plots ROIs for the MID task.

% set up dirs
codedir = '/ZPOOL/data/projects/istart-mid/code'; % Run code from this path.
addpath(codedir)
maindir = '/ZPOOL/data/projects/istart-mid';
roidir = '/ZPOOL/data/projects/istart-mid/derivatives/imaging_plots/'; % Results from extractROI script.
resultsdir = '/ZPOOL/data/projects/istart-mid/derivatives/imaging_plots/results/'; % Output where results will be saved.
cov_dir ='/ZPOOL/data/projects/istart-mid/code/covariates/'; % Input for covariates

COVARIATE = readtable([cov_dir 'model_4A.xlsx']); % N = 48 (REWARD and SUBSTANCE)

% Inputs into scatterplots.

% Strategic_Behavior	Composite_Substance	 Composite_Reward	Composite_Reward_Squared	Composite_SubstanceXReward	Composite_SubstanceXReward_Squared

ID_Measure_1 = COVARIATE.Aberrant;  %STRATEGIC.Raw Proportion;
ID_Measure_1_name= ' Aberrant';
ID_Measure_2 = COVARIATE.RS; %STRATEGIC.Proportion; %
ID_Measure_2_name=' RS';%' Composite_SubstanceXReward_Squared'
rois= {'seed-NAcc'}; % 'pTPJ_extracted' 'seed-NAcc-thr' 'seed-vmPFC-5mm-thr'};% 'seed-pTPJ-bin' 'seed-mPFC-thr' 'seed-SPL-thr' 'seed-ACC-50-thr' 'seed-insula-thr'  'seed-dlPFC-thr'}; % 'seed-pTPJ-thr' 'seed-vmPFC-5mm-thr' 'seed-SPL-thr' 'seed-ACC-50-thr'}; % 'seed-dlPFC-UGR-bin' 'seed-ACC-10mm' 
models = {['_type-act_cov-4A_model-1_']}; % ppi_seed-IFG_extracted 'nppi-ecn' nppi-ecn ppi_seed-NAcc-bin act ppi_seed-IFG_extracted};

% Test hypotheses:

H2 = 1; % Reward Anticipation Activation 
H3 = 0; % Reward Anticipation Connectivity


%% Specify COPES and L3 models:

%
% # COPE Nums:

% # 1.  Large Gain (USE)
% # 2.  Small Gain
% # 3.  Large Loss
% # 4.  Small Loss
% # 5.  Hit
% # 6.  Miss
% # 7.  Neutral
% # 8.  Gain-Loss
% # 9.  Gain-Neutral
% # 10. Loss-Neutral
% # 11. Salience (USE)
% # 12. Hit-Miss (USE)
% # 13. Large Gain-Small Gain
% # 14. Large Loss-Small Loss

% # L3 Models:

% 4A: SU*RS + SU*RS^2
% 4B: SU*RS 
% 4C: SU*RS^2
% 4D: no interaction
% 4EvBETA: Fit*RS + Fit*RS^2
% 4FvBETA: Fit*RS
% 4GvBETA: Fit*RS^2

%% H2 Reward Anticipation Activation 

if H2 == 1

            name = 'Act_Anticipation_results';
            LG={'cope-01.txt'};
            SG={'cope-02.txt'};
            LL={'cope-03.txt'};
            SL={'cope-04.txt'};
            Hit={'cope-05.txt'};
            Miss={'cope-06.txt'};
            N={'cope-07.txt'};
            Salience={'cope-11.txt'};
            HitMiss={'cope-12.txt'};


        type=' act';
        plot_mid(name, roidir, rois, models, LG, SG, LL, SL, Hit, Miss, N, Salience, HitMiss, type, ID_Measure_1, ID_Measure_2, ID_Measure_1_name, ID_Measure_2_name)
end
       
   
%% H3 Reward Anticipation Connectivity

if H3 == 1
    
        name = 'PPI_Antication_results';
            LG={'cope-01.txt'};
            SG={'cope-02.txt'};
            LL={'cope-03.txt'};
            SL={'cope-04.txt'};
            Hit={'cope-05.txt'};
            Miss={'cope-06.txt'};
            N={'cope-07.txt'};
            Salience={'cope-11.txt'};
            HitMiss={'cope-12.txt'};
        type=' ppi';
        plot_mid(name, roidir, rois, models, LG, SG, LL, SL, Hit, Miss, N, Salience, HitMiss, type, ID_Measure_1, ID_Measure_2, ID_Measure_1_name, ID_Measure_2_name)
    
end

