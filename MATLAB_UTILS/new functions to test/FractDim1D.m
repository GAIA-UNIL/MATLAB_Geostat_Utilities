function length=FractDim1D(X,Y,fractal_steps);

% computes fractal dimension
for k = 1:size(fractal_steps,2)
    
    sizestep = fractal_steps(k);
    length(k) = 0;
    d = 0;
    istart = 1;
    for i = 1:size(X,1)-1
        
        x = X(i);
        y = Y(i);
        xs = X(istart);
        ys = Y(istart);
        d = sqrt((x-xs)^2+(y-ys)^2);
        if d>sizestep
            length(k) = length(k)+d;
            d = 0;
            istart = i;
        end
    end
end
