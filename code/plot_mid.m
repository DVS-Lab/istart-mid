function plot_mid(name, roidir, rois, models, LG, SG, LL, SL, Hit, Miss, N, Salience, HitMiss,  type, ID_Measure_1, ID_Measure_2, ID_Measure_1_name, ID_Measure_2_name)
    
% This function plots results in the ISTART mid task. It employs DVS
% plotting tool barweb_dvs2.m. This code generates the inputs to make the
% plots and scatter plots for this project.

% Daniel Sahin
% 07/13/23
% Temple University
% DVS Lab

close all
clc

    output = [roidir 'results/' name '/'];
    outputdir = output;
    
    if exist(output) == 7
        rmdir(output, 's');
        mkdir(output);
    else 
        mkdir(output); % set name
    end
    
    for r = 1:length(rois)
        roi = rois{r} ;
        for m = 1:length(models)
            model = models(1);
           
            LG_use= load(strjoin([roidir,rois(r),models(1),LG], ''));
            SG_use= load(strjoin([roidir,rois(r),models(1),SG], ''));
            LL_use= load(strjoin([roidir,rois(r),models(1),LL], ''));
            SL_use= load(strjoin([roidir,rois(r),models(1),SL], ''));
            Hit_use= load(strjoin([roidir,rois(r),models(1),Hit], ''));
            Miss_use= load(strjoin([roidir,rois(r),models(1),Miss], ''));
            N_use= load(strjoin([roidir,rois(r),models(1),N], ''));
            Salience_use= load(strjoin([roidir,rois(r),models(1),Salience], ''));
            HitMiss_use= load(strjoin([roidir,rois(r),models(1),HitMiss], ''));

            figure, barweb_dvs2([mean(LL_use); mean(SL_use); mean(N_use); mean(SG_use); mean(LG_use)], [std(LL_use)/sqrt(length(LL_use)); std(SL_use)/sqrt(length(SL_use)); std(N_use)/sqrt(length(N_use)); std(SG_use)/sqrt(length(SG_use)); std(LG_use)/sqrt(length(LG_use))]);
            xlabel('Task Condition');
            xticks([0.5, 0.75, 1, 1.25, 1.5]);
            xticklabels({'LL','SL','N','SG','LG'});
            ylabel('BOLD Response');
            legend({'LL','SL','N','SG','LG'},'Location','northeast');
            axis square;
            title([roi type]);
            %outname = 'plot'
            %cmd = ['print -depsc ' outname];
            %eval(cmd);
            %saveas(gca, fullfile(outname), 'svg');
         
            % figure
            % 
            % subplot(2,5,1)
            % [R,P] = corrcoef(ID_Measure_1, DGP);
            % scatter(ID_Measure_1, DGP, 'MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5);
            % ylabel (['DGP ' roi type], 'FontSize', 12);
            % xlabel  (ID_Measure_1_name, 'FontSize', 12);
            % i = lsline;
            % i.LineWidth = 3.5;
            % i.Color = [0 0 0];
            % str=sprintf([' R=%1.2f' ' P=%1.2f'], [R(1,2) P(1,2)]);
            % T = text(min(get(gca, 'xlim')), max(get(gca, 'ylim')), str);
            % T.FontSize = 8;
            % 
            % subplot(2,5,2)
            % [R,P] = corrcoef(ID_Measure_1, UGP);
            % scatter(ID_Measure_1, UGP, 'MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5);
            % ylabel (['UGP ' roi type], 'FontSize', 12);
            % xlabel  (ID_Measure_1_name, 'FontSize', 12);
            % i = lsline;
            % i.LineWidth = 3.5;
            % i.Color = [0 0 0];
            % str=sprintf([' R=%1.2f' ' P=%1.2f'], [R(1,2) P(1,2)]);
            % T = text(min(get(gca, 'xlim')), max(get(gca, 'ylim')), str);
            % T.FontSize = 8;
            % 
            % subplot(2,5,3)
            % [R,P] = corrcoef(ID_Measure_1, UGR);
            % scatter(ID_Measure_1, UGR, 'MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5);
            % ylabel (['UGR ' roi type], 'FontSize', 12);
            % xlabel  (ID_Measure_1_name, 'FontSize', 12);
            % i = lsline;
            % i.LineWidth = 3.5;
            % i.Color = [0 0 0];
            % str=sprintf([' R=%1.2f' ' P=%1.2f'], [R(1,2) P(1,2)]);
            % T = text(min(get(gca, 'xlim')), max(get(gca, 'ylim')), str);
            % T.FontSize = 8;
            % 
            % subplot(2,5,4)
            % [R,P] = corrcoef(ID_Measure_1, (DGP-UGP));
            % scatter(ID_Measure_1, (DGP-UGP), 'MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5);
            % ylabel (['DG-UG ' roi type], 'FontSize', 12);
            % xlabel  (ID_Measure_1_name, 'FontSize', 12);
            % i = lsline;
            % i.LineWidth = 3.5;
            % i.Color = [0 0 0];
            % str=sprintf([' R=%1.2f' ' P=%1.2f'], [R(1,2) P(1,2)]);
            % T = text(min(get(gca, 'xlim')), max(get(gca, 'ylim')), str);
            % T.FontSize = 8;
            % 
            % subplot(2,5,5)
            % [R,P] = corrcoef(ID_Measure_1, (UGP-DGP));
            % scatter(ID_Measure_1, (UGP-DGP), 'MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5);
            % ylabel (['UG-DG ' roi type], 'FontSize', 12);
            % xlabel  (ID_Measure_1_name, 'FontSize', 12);
            % i = lsline;
            % i.LineWidth = 3.5;
            % i.Color = [0 0 0];
            % str=sprintf([' R=%1.2f' ' P=%1.2f'], [R(1,2) P(1,2)]);
            % T = text(min(get(gca, 'xlim')), max(get(gca, 'ylim')), str);
            % T.FontSize = 8;
            % 
            % subplot(2,5,6)
            % [R,P] = corrcoef(ID_Measure_2, DGP);
            % scatter(ID_Measure_2, DGP, 'MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5);
            % ax = gca;
            % ax.FontSize = 12;
            % ylabel (['DGP ' roi type], 'FontSize', 12);
            % xlabel  (ID_Measure_2_name, 'FontSize', 12);
            % i = lsline;
            % i.LineWidth = 3.5;
            % i.Color = [0 0 0];
            % set(gcf,'color','w');
            % str=sprintf([' R=%1.2f' ' P=%1.2f'], [R(1,2) P(1,2)]);
            % T = text(min(get(gca, 'xlim')), max(get(gca, 'ylim')), str);
            % T.FontSize = 8;
            % 
            % subplot(2,5,7)
            % [R,P] = corrcoef(ID_Measure_2, UGP);
            % scatter(ID_Measure_2, UGP, 'MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5);
            % ylabel (['UGP ' roi type], 'FontSize', 12);
            % xlabel  (ID_Measure_2_name, 'FontSize', 12);
            % i = lsline;
            % i.LineWidth = 3.5;
            % i.Color = [0 0 0];
            % str=sprintf([' R=%1.2f' ' P=%1.2f'], [R(1,2) P(1,2)]);
            % T = text(min(get(gca, 'xlim')), max(get(gca, 'ylim')), str);
            % T.FontSize = 8;
            % 
            % subplot(2,5,8)
            % [R,P] = corrcoef(ID_Measure_2, UGR);
            % scatter(ID_Measure_2, UGR, 'MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5);
            % ylabel (['UGR ' roi type], 'FontSize', 12);
            % xlabel  (ID_Measure_2_name, 'FontSize', 12);
            % i = lsline;
            % i.LineWidth = 3.5;
            % i.Color = [0 0 0];
            % str=sprintf([' R=%1.2f' ' P=%1.2f'], [R(1,2) P(1,2)]);
            % T = text(min(get(gca, 'xlim')), max(get(gca, 'ylim')), str);
            % T.FontSize = 8;
            % outname2= fullfile([outputdir roi model 'scatterplots']);
            % saveas(gca, fullfile(outname2), 'svg');
            % 
            % subplot(2,5,9)
            % [R,P] = corrcoef(ID_Measure_2, (DGP-UGP));
            % scatter(ID_Measure_2, (DGP-UGP), 'MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5);
            % ylabel (['DG-UG ' roi type], 'FontSize', 12);
            % xlabel  (ID_Measure_2_name, 'FontSize', 12);
            % i = lsline;
            % i.LineWidth = 3.5;
            % i.Color = [0 0 0];
            % str=sprintf([' R=%1.2f' ' P=%1.2f'], [R(1,2) P(1,2)]);
            % T = text(min(get(gca, 'xlim')), max(get(gca, 'ylim')), str);
            % T.FontSize = 8;
            % outname2= fullfile([outputdir roi model 'scatterplots']);
            % saveas(gca, fullfile(outname2), 'svg');
            % 
            % subplot(2,5,10)
            % [R,P] = corrcoef(ID_Measure_2, (UGP-DGP));
            % scatter(ID_Measure_2, (UGP-DGP), 'MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5);
            % ylabel (['UG-DG ' roi type], 'FontSize', 12);
            % xlabel  (ID_Measure_2_name, 'FontSize', 12);
            % i = lsline;
            % i.LineWidth = 3.5;
            % i.Color = [0 0 0];
            % str=sprintf([' R=%1.2f' ' P=%1.2f'], [R(1,2) P(1,2)]);
            % T = text(min(get(gca, 'xlim')), max(get(gca, 'ylim')), str);
            % T.FontSize = 8;
            % outname2= fullfile([outputdir roi model 'scatterplots']);
            % saveas(gca, fullfile(outname2), 'svg');
           
        end  
    end

end

