%% Image Processing CW Deonte Allen Gooden
% Student ID: 20166502

imOne = imread("StackNinja1.bmp");
imTwo = imread("StackNinja2.bmp");
imThree = imread("StackNinja3.bmp");
imshow(imOne);
imshow(imTwo);
imshow(imThree);

%% StackNinja One

sub1 = subplot(5,3,1);
imshow(imOne);
title("StackNinja One");
processImg(imOne, 4);

%% StackNinja Two

sub2 = subplot(5,3,2);
imshow(imTwo);
title("StackNinja Two");
processImg(imTwo, 5);

%% StackNinja Three

sub3 = subplot(5,3,3);
imshow(imThree);
title("Stack Ninja Three");
processImg(imThree, 6);

%% IP Function
function processImg(root, i)
    
    %green space colour conversion
    greenSpace = root(:,:,2); 

    %noise reduction
    greenSpace = medfilt2(greenSpace); 

    %contrast increase
    greenSpace = greenSpace * 1.75; 

    %image thresholding
    thresholding = graythresh(greenSpace); 
    
    %Grayscale to Binary image
    grayToBinary = imbinarize(greenSpace, thresholding); 

    %detecting large cells
    se = strel('disk',5);
    largeN =  imopen(grayToBinary, se);
 
    %detecting small cells
    seTwo = strel('disk',1);
    smallN = imopen(grayToBinary, seTwo);
    
    %print grayscale image
    subplot(5, 3, i),
    imshow(greenSpace),
    title("GrayScale Image");

    %print binary all nuclei
    subplot(5, 3, i + 3),
    imshow(grayToBinary),
    title("All Nuclei");
    
    %print binary large nuclei
    subplot(5, 3, i + 6),
    imshow(largeN);
    title("large Nuclei");
    
    %print binary small nuclei
    subplot(5, 3, i + 9),
    imshow(smallN);
    title("Small Nuclei");
end

