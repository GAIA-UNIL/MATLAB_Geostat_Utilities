function grid=postprocess_opening(grid)

grid=int8(grid);
SE = strel('arbitrary',ones(3,3,3));
grid=imopen(grid,SE);


