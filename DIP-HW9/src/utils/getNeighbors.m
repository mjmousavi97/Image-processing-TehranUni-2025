% Get the 8-neighbors in clockwise order
function P = getNeighbors(img, i, j)
    P = [img(i-1,j)   img(i-1,j+1) img(i,j+1) img(i+1,j+1) ...
         img(i+1,j)   img(i+1,j-1) img(i,j-1) img(i-1,j-1)];
end
