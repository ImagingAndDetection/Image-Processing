close all;
clc;

% Read and display original picture
pic = imread('Michael2.JPG');
figure
imshow(pic);
% Initialize picture that will show skin pixels
skinpic = pic;

% Obtain RGB values of original picture
r = pic(:,:,1);
g = pic(:,:,2);
b = pic(:,:,3);

% Obtain sizes of the RGB arrays
sizer = size(r);
sizeg = size(g);
sizeb = size(b);

% Reshape the RGB arrays to make it easier to check the values
rr = reshape(r,[sizer(2)*sizer(1) 1]);
gg = reshape(g,[sizeg(2)*sizeg(1) 1]);
bb = reshape(b,[sizeb(2)*sizeb(1) 1]);

% Check the RGB values to see if they are skin pixels
% Skin pixels will be white. Other pixels will be black
for i = 1:size(rr,1)
        if ( ((rr(i)-gg(i))/(rr(i)+gg(i))) <= 0.5 && 0 <= ((rr(i)-gg(i))/(rr(i)+gg(i))) && (bb(i)/(rr(i)+gg(i))) <= 0.5)
            rr(i) = 255;
            gg(i) = 255;
            bb(i) = 255;
        else
            rr(i) = 0;
            gg(i) = 0;
            bb(i) = 0; 
        end
end

% Reshape the new arrays of black and white pixels
newr = reshape(rr,[sizer(1) sizer(2)]);
newg = reshape(gg,[sizeg(1) sizeg(2)]);
newb = reshape(bb,[sizeb(1) sizeb(2)]);

% Assign the new arrays to the picture
skinpic(:,:,1) = newr;
skinpic(:,:,2) = newg;
skinpic(:,:,3) = newb;

% Display the new picture
figure
imshow(skinpic);


