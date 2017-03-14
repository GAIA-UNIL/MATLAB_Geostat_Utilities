function ViewPts(pts,var,dotsize,marker)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

if numel(dotsize)==0
    dotsize=5;
end

if var>size(pts,2)-3
    disp(['Var. ',num2str(var),' not present in conditioning data file. Using var. 1 instead.']);
    var=1;
end

hold on

scatter3(pts(:,1),pts(:,3),pts(:,2),dotsize,pts(:,3+var),'filled')
scatter3(pts(:,1),pts(:,3),pts(:,2),dotsize,pts(:,3+var),marker)

view([0 0])

axis image equal tight