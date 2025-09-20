function [dist,angle] = my_signature(input_bound, x0 , y0) 
[rw, ~] = size(input_bound);

% delete end point if it's equal to first point
if isequal(input_bound(1,:), input_bound(rw,:))
    input_bound=input_bound(1:rw-1,:);
    rw = rw-1;
end 

% compute the center
if nargin == 1
    x0 = sum(input_bound(:,1)) / rw;
    y0 = sum(input_bound(:,2)) / rw;
end

% shift the coordination
input_bound(:,1) = input_bound(:,1) - x0;
input_bound(:,2) = input_bound(:,2) - y0 ;

% convert coordinates to polar
xcart = input_bound(:,2);
ycart = -input_bound(:,1);
[theta, p] = cart2pol(xcart,ycart); 
theta = theta.*(180/pi);

% convert to non-negative angle(0-360)
j = theta==0;
theta = theta.*(0.5*abs(1+sign(theta)))-0.5*(-1+sign(theta)).*(360+theta);
theta(j) = 0;
theta = round(theta); 
cpml = [theta,p];

% delete duplicate angle
[w,u] = unique(cpml(:,1));
cpml = cpml(u,:);

if cpml(end ,1) == cpml(1)+360
    cpml = cpml(1:end-1,:);
end

% compute angle value
angle = cpml(:,1);

% compute length value
dist = cpml(:,2); 

end

