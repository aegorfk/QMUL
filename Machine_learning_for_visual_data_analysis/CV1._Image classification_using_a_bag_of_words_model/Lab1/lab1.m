% ========================================================================
% Image classification using Bag of Words
% EECS734 Computer Vision Systems (Queen Mary University of London)
% Lecturers:  Dr. Ioannis Patras (i.patras@eecs.qmul.ac.uk) and Dr. Tao Xiang (txiang@eecs.qmul.ac.uk)
% The experiment is coordinated by TA: Heng Yang(heng.yang@eecs.qmul.ac.uk)
%                      Jan.2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Acknowledgements
% Parts of the code is from the online sources below
% Ravindra Gadde       http://masterravi.wordpress.com/tag/bag-of-words/
% Piji Li:             http://www.zhizhihu.com 
% VGG Group in Oxford: http://www.robots.ox.ac.uk/~vgg/software/
% VLFeat Library:      http://www.vlfeat.org/index.html
% LibSVM library:      http://www.csie.ntu.edu.tw/~cjlin/libsvm/ 
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                          See instruction FIRST
% Make sure in your workspace there are:
%1. lab1.m is the main file 
%2. *software* contains all codes 
%3. *image* all training and test images 1-300 for training and 300-400 for
%    testing.  
%4. *data* all data in .mat format  including all computed result.
% The code for each step is commented by  
%---------------------code---------------------------
%                        %{
%                        ....
%                        }%
%-------------------end of code-----------------------
% To UNCOMMENT the code just input a '%' after the '{'


%% Step 1 Add path to your workspace  
%--------------------------code-------------------------------------------
%{%
addpath(genpath('/Users/ekaterina/Documents/GitHub/Machine_Learning_For_Visual_Data_Analysis/Lab1._Image classification_using_a_bag_of_words_model/Lab1'));% add the path of code to your workspace 
%}
%-------------------------end of code-------------------------------------
%==========================================================================
%% Step2 Dictionary creation-feature quantization 
%% 2.1 load the pre-computed features for the training and the test images
%    The features are stored in data/local/'ID' ID is the image number form
%    001-400. If you are interested in how these feature is extracted
%    see compute_descriptors.m and GenerateSiftDescriptors.m 
%there is struct variable called 'features' with members:
%data,x,y,wid,hgt,patchSize of which data is the feature information 
%----------------------code-for-save-no need to run------------------------
%{
opts.localdatapath = 'data/local';
featureName = 'sift_features';
TrainMat = [];
TestMat = [];
for k = 1:300
      image_dir=sprintf('%s/%s/',opts.localdatapath,num2string(k,3)); 
      inFName = fullfile(image_dir, sprintf('%s',featureName));
      load(inFName, 'features');
      TrainMat = [TrainMat;features.data];
end 
for k = 301:400
      image_dir=sprintf('%s/%s/',opts.localdatapath,num2string(k,3)); 
      inFName = fullfile(image_dir, sprintf('%s',featureName));
      load(inFName, 'features');
      TestMat = [TestMat;features.data];
end 
save('data/global/all_features','TrainMat','TestMat');
%}
%-----------------------code to load pre-computed features-----------------
%{%
load('data/global/all_features');
%}
%------------------------end of code---------------------------------------

%% 2.2 create a dictionary by clustering a subset of the extracted
% We use the fast kmeans algorithm in vlfeat lab from 
%http://www.vlfeat.org/index.html 
%if you wanna see the detail of how the dictionary is created, please refer
%to CalculateDictionary.m which runs step by step. 
%--------------------------code--------------------------------------------
%{%
clear 
load('data/global/all_features');
DictionarySize = 500;
run('software/vlfeat-0.9.16/toolbox/vl_setup.m');% to compile the vlfeat lab. 
tic
[C,A] = vl_kmeans(TrainMat',DictionarySize,'algorithm', 'elkan');
C = C';
toc
save('data/global/dictionary','C');
%}
%-------------------------end of code--------------------------------------

%% 2.3 Euclidean distance 
% Assume a and b are two vectors, the  Euclidean distance function is EuclideanDistance.m 
%--------------------------------------code--------------------------------
%{%
clear;
load('data/global/all_features');
load('data/global/dictionary');
a = TestMat(1,:);
b = C(1,:);
d = EuclideanDistance(a,b);
%}
%----------------------------------end of code ----------------------------

%% 2.4 Assign each descriptor to the nearest codeword 

%{%
clear;
load('data/global/all_features');
load('data/global/dictionary');

% The following 3 lines is an example to on how to assign the descriptor 
% discrptor_test1 to the nearest codeword in C
discrptor_test1 = TestMat(1,:);
d = EuclideanDistance(discrptor_test1,C);
[minv, index] = min(d);% index will be the nearest codeword cluster


% initialise arrays
index_test = zeros(size(TestMat(:,1))); 
index_train = zeros(size(TrainMat(:,1)));
for n = 1:size(TestMat,1)
    % TestMat(n,:) - our extracted feature vectors, also known as descriptor
    % c - array with codewords
    d = EuclideanDistance(TestMat(n,:), C);
    % index will be the nearest codeword cluster
    [~, index] = min(d);
    index_test(n) = index;
end

for n = 1:size(TrainMat,1)
    d = EuclideanDistance(TrainMat(n,:), C);
    % index will be the nearest codeword cluster
    [~, index] = min(d);
    index_train(n) = index;
end


% Write your own code that assigns each descriptor in the training and 
% test images to the nearest codeword cluster. (Hint: use the function min())
% Assume the assignment vector of training images is index_train and that 
% of test images is index_test, the dimensions of which should be 1x270000 and 1x90000. 
% The entry of the vector is the codeword ID. 

% save them like this:
save('data/global/assignd_discriptor','index_train','index_test');
%}
%-----------------------------end of code----------------------------------

%% 2.5 Visualize some image patches that are assigned to the same codeword 
%------------------------code------------------------------------------
%{%
clear;
load('data/global/assignd_iscriptor');
wordid = 37; %78; %397; % set a random value and we instead to find 20 patches from both training and test
n = 30;% number of patches
close all;
visualize_patches(index_train, index_test, wordid, n);
clear; 
%}
%==========================================================================

%==========================================================================
%% Step 3 Image representation using bag of words 
%% 3.1 represent each image using BoW 
%{%
clear;
BoW =[]; %initialization 
isshow = 0; % show image and histogram or not
load('data/global/image_names');
load('data/global/dictionary','C');
%load('data/global/all_features');
nimages = 400;
vocbsize = 500;
for ii = 1:nimages
      image_dir=sprintf('%s/%s/','data/local', num2string(ii, 3));
      % location where detector is saved
      inFName = fullfile(image_dir, sprintf('%s', 'sift_features'));
      load(inFName, 'features');
 
      d = EuclideanDistance(features.data, C);
      %calculate the distance
      [~, index] = min(d);
      %%%%histogram and normalisation with provided function
      [histogram, c] = do_normalize(hist(index, vocbsize));
      BoW(:,ii) = histogram;
 
      if isshow == 1
        close all; figure;
        subplot(1,2,1), subimage(imread(strcat('image/', image_names{ii})));
        subplot(1,2,2), bar(BoW(:,ii)), xlim([0 500]);
      end 
end 

% 
save('data/global/bow','BoW')
%}
%------------------------end of code-----------------------------------
%==========================================================================

%==========================================================================
%% Step 4 NN classifier 
%% 4.1 K-NN training 
%--------------------------code--------------------------------------------
%{%
clear;
load('data/global/bow');
%BoW = transpose(BoW)
tem = ones(60,1);
train_labels  = [tem;2*tem;3*tem;4*tem;5*tem];
tem = ones(20,1);
test_labels = [tem;2*tem;3*tem;4*tem;5*tem];
train_data = BoW(1:300,:); 
test_data  = BoW(301:400,:);
clear BoW;
k = 1;% set the k for k-nn algorithm 
method = 2;% 1-L2; 2- Histogram intersection 
NNresult = knnsearch(test_data,train_data,k,method);

if k >1 
  NNresult = round(mean(NNresult,2));% stores the nearest neighbour 
end 
predict_label = train_labels(NNresult);
%}
%-----------------------end of code------------------------------------------
%% 4.2 classification error
%----------------------------------code------------------------------------
%{%
num_c = 5;
num_pc = 20;
error_n = zeros(num_c,1);
for k = 1:num_c
    error_n(k) = num_pc-length(find(predict_label((k-1)*num_pc+1:num_pc*k)==k));
end 
err = error_n/num_pc;
err_all = sum(error_n)/(num_pc*num_c);
%}
%--------------------------------end of code-------------------------------

%% 4.3 Confusion matrix 
%-----------------------------------code-----------------------------------
%{%
num_class = 5;
num_test_1c = floor(size(predict_label,1)/num_class);
confusion_matrix = ones(num_class);
class_names={...
    'airplanes'
    'cars'
    'dog'
    'faces'
    'keyboard'
    };
for ci = 1:num_class
    for cj = 1:num_class
        confusion_matrix(ci,cj)=size(find(predict_label((ci-1)*num_test_1c+1:ci*num_test_1c,:)==cj),1)/num_test_1c;
    end 
end 
close all; figure;
draw_cm(confusion_matrix,class_names,num_class);
%}
%---------------------------------end of code------------------------------

%% 4.4 Show some correct and incorrect cases 
%---------------------------------code-------------------------------------
%{%
load('data/global/image_names');
load('data/global/bow');
class_names={...
    'airplanes'
    'cars'
    'dog'
    'faces'
    'keyboard'
    };
right_v = find(predict_label == test_labels);%correct
wrong_v = find(predict_label ~= test_labels);%incorrect 
idright = right_v(2);% set number you are about to visualize
idwrong = wrong_v(1);% set number you are about to visualize, be sure it is nor larger than length of wrong_v 
gt_label_r = class_names{test_labels(idright)};
gt_label_w = class_names{test_labels(idwrong)};
prd_label_r = class_names{predict_label(idright)};
prd_label_w = class_names{predict_label(idwrong)};
figure, 
subplot(2,4,1),subimage(imread(strcat('image/',image_names{idright+300}))),title('test image'),axis off;
subplot(2,4,2),bar(BoW(idright+300,:)),xlim([1,500]),title('BoW of test image');
subplot(2,4,3),subimage(imread(strcat('image/',image_names{NNresult(idright)}))),title('Right Label NN image'),axis off;
subplot(2,4,4),bar(BoW(NNresult(idright),:)),xlim([1,500]),title('BoW of NN image');

subplot(2,4,5),subimage(imread(strcat('image/',image_names{idwrong+300}))),title('test image'),axis off;
subplot(2,4,6),bar(BoW(idwrong+300,:)),xlim([1,500]),title('BoW of test image');
subplot(2,4,7),subimage(imread(strcat('image/',image_names{NNresult(idwrong)}))),title('Wrong Label NN image'),axis off;
subplot(2,4,8),bar(BoW(NNresult(idwrong),:)),xlim([1,500]),title('BoW of NN image');
%}
%-------------------------------end of code--------------------------------
%% 4.5 Histogram intersection distance
% see 'method' option in 4.1 
%==========================================================================

%==========================================================================
%% Step 5 Dictionary size 
%% 5.1 Small dictionary 
% Change the value of variable 'DictionarySize' in 2.2 and rerun all the
% steps above. 
%% 5.2 Explain and visualization 
% visualize using step 2.5 
%==========================================================================


%==========================================================================
%% Step 6 SVM classifier 
%% 6.1 train a multiclass SVM model 
% Please note that here Libsvm is used: http://www.csie.ntu.edu.tw/~cjlin/libsvm/
% compile it when neccesary
% run('software/libsvm-3.14/matlab/make')
%---------------------------------code-------------------------------------
% preparing the training and testing data 
% Be sure the BoW is available 
%{%
clear;
load('data/global/bow','BoW');
fprintf('\nClassification using BOW rbf_svm\n');
tem = ones(60,1);
train_labels  = [tem;2*tem;3*tem;4*tem;5*tem];
train_data    = BoW(1:300,:);
tem = ones(20,1);
test_labels   = [tem;2*tem;3*tem;4*tem;5*tem];
test_data     = BoW(301:400,:);
clear BoW;
% set the parameters via cross-validation! Elapsed time is 246.922774 seconds.
bestc=64;bestg=2.2974;
bestcv=0;
% tic 
% for log2c = -1:10,
%   for log2g = -1:0.1:1.5,
%     cmd = ['-v 5 -t 2 -c ', num2str(2^log2c), ' -g ', num2str(2^log2g)];
%     cv = svmtrain(train_labels, train_data, cmd);
%     if (cv >= bestcv),
%       bestcv = cv; bestc = 2^log2c; bestg = 2^log2g;
%     end
%     fprintf('%g %g %g (best c=%g, g=%g, rate=%g)\n', log2c, log2g, cv, bestc, bestg, bestcv);
%   end
% end
% toc 
options=sprintf('-s 0 -t 2 -c %f -b 1 -g %f -q',bestc,bestg);
model=svmtrain(train_labels, train_data,options);
%}
%-----------------------------------end of code------------------------
%% 6.2 apply the SVM model to the test images 
%{%
[predict_label, accuracy , dec_values] = svmpredict(test_labels,test_data, model,'-b 1');
%}
%% 6.3 classification error
%----------------------------------code------------------------------------
%{%
num_c = 5;
num_pc = 20;
error_n = zeros(num_c,1);
for k = 1:num_c
    error_n(k) = num_pc-length(find(predict_label((k-1)*num_pc+1:num_pc*k)==k));
end 
err = error_n/num_pc;
err_all = sum(error_n)/(num_pc*num_c);
%}
%--------------------------------end of code-------------------------------

%% 6.4 Confusion matrix 
%-----------------------------------code-----------------------------------
%{%
num_class = 5;
num_test_1c = floor(size(predict_label,1)/num_class);
confusion_matrix = ones(num_class);
class_names={...
    'airplanes'
    'cars'
    'dog'
    'faces'
    'keyboard'
    };
for ci = 1:num_class
    for cj = 1:num_class
        confusion_matrix(ci,cj)=size(find(predict_label((ci-1)*num_test_1c+1:ci*num_test_1c,:)==cj),1)/num_test_1c;
    end 
end 
close all,
figure;
draw_cm(confusion_matrix,class_names,num_class);
%}
%---------------------------------end of code------------------------------

%% 6.5 Show some correct and incorrect cases 
%---------------------------------code-------------------------------------
%{%
load('data/global/image_names');
load('data/global/bow');
class_names={...
    'airplanes'
    'cars'
    'dog'
    'faces'
    'keyboard'
    };
right_v = find(predict_label == test_labels);%correct
wrong_v = find(predict_label ~= test_labels);
n_w = length(wrong_v);
nv = min(n_w,20);
nrows = floor((nv*2)/5);
close all;
figure 
for k = 1:nv
    subplot(nrows,5,2*k-1),subimage(imread(strcat('image/',image_names{right_v(k)+300}))),title(strcat('PL-',class_names{predict_label(right_v(k))})),axis tight,axis off;
    subplot(nrows,5,2*k),subimage(imread(strcat('image/',image_names{wrong_v(k)+300}))),title(strcat('PL-',class_names{predict_label(wrong_v(k))})),axis tight,axis off;
end 
%}
%-------------------------------end of code--------------------------------





























