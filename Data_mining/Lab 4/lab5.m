%% Cell 1. Load data.
load('Yale_64x64');
faces = fea'; N=165;
figure(11); clf; for i = 1: 9, subplot(3,3,i); imagesc(reshape(faces(:,10*i),[64,64])); end; set(gcf,'Name','Example Faces from Database');
colormap gray;

%% Cell 2. Take SVD of the data.
meanFace=mean(faces,2);
[U,S,V]=svd(faces); %SVD gives Eigenvectors and Eigenvals.
figure(12); clf; 
subplot(4,4,1); imagesc(reshape(meanFace,64,64)); title('Mean Face'); colormap gray;
for i = 2: 16, subplot(4,4,i); imagesc(reshape(U(:,i-1),[64,64])); title(sprintf('PC: %d', i)); end; set(gcf,'Name','Eigenfaces');

%% Cell 3. PCA Encoding and Reconstruction.
nPCA = 25; 
pcaFaces  = U(:,1:nPCA)'*(faces-meanFace*ones(1,N));      %PCA Encoding. Raw images faces => compressed images pcaFaces.
reconstrFaces = U(:,1:nPCA)*pcaFaces+meanFace*ones(1,N);  %PCA Decoding. Compressed images pcaFaces => Raw images reconstrFaces.
figure(1); clf; for i = 1 : 9, subplot(3,3,i); imagesc([reshape(faces(:,10*i),[64,64]),reshape(reconstrFaces(:,10*i),[64,64])]); end; colormap gray;
originalSize = round(numel(faces)*8/1e3);
encodedSize = round(numel(pcaFaces)*8/1e3);
fprintf(1,'Original/Encoding Size: %d/%d KB. Reconstruction Error: %1.3f\n', originalSize, encodedSize, sum((reconstrFaces(:)-faces(:)).^2)/sum(faces(:).^2));

%% Cell4. Error and EigenValues.
eigvals = diag(S).^2;
figure(2); clf;
% Plot the eigenvals.
% Plot the cumulitive eigenvalues.
% How many PCs are needed to explain 99% of the data?

%% Cell 5.
% Find out how classification accuracy varies with PCA dimensions.
nPCA = 5; 
pcaFaces  = U(:,1:nPCA)'*(faces-meanFace*ones(1,N));    %PCA Encoding.
xTr = pcaFaces(:,1:2:end); yTr = gnd(1:2:end);
xTe = pcaFaces(:,2:2:end); yTe = gnd(2:2:end);
class = knnclassify(xTe', xTr', yTr); 
fprintf(1,'Dimensions: %d. Accuracy: %1.2f\n', nPCA, sum(class==yTe)/numel(yTe));
