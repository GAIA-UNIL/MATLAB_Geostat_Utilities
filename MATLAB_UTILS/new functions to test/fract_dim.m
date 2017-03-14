function length=fract_dim(x,y,ruler_sizes)

% for sim_no=1:10
% sim_temp = load(['SP_Denmark_v2_postpro_test9_realz_' num2str(sim_no-1) '.txt']);
% sim_v_1(:,sim_no) = sim_temp(:,1);
% sim_v_2(:,sim_no) = sim_temp(:,2);
% sim_v_3(:,sim_no) = sim_temp(:,3);
% end

%ruler_sizes=1:100;
%this is only for variable 1
%x = D(:,1);
%y = D(:,4);
for k = 1:size(ruler_sizes,2)
    
    sizestep = ruler_sizes(k); %lag
    length(k) = 0;
    dist = 0;
    x_start = x(1);
    y_start = y(1);
    
    for i = 1:size(x,1)    
        x_end = x(i);
        y_end = y(i);
        %compute distance in a straight line
        dist = sqrt((x_start-x_end)^2+(y_start-y_end)^2);
        
        %if distance larger than current ruler size, it is accepted and
        %this point is set as a new starting point
        if dist>sizestep
            length(k) = length(k)+dist;
            dist = 0;
            x_start = x(i);
            y_start = y(i);
        end
    end
end

%%
%plot(ruler_sizes,length)