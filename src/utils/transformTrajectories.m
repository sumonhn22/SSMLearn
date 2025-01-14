function outData = transformTrajectories(map, inData)
% outData = transformTrajectories(map, inData)
% 
% Apply a map to each trajectory in inData.
% Example: transform reduced coordinates to normal form:
%     zData = transformTrajectories(RDInfo.inverseTransformation.map, etaData);
%   
% INPUT
% map        function handle  function from the space of inData to outData.
% inData     {nTraj x nCol}   Cell array of trajectories. First column 
%                             contains time, second column contains state
%                             and the optional third column contains 
%                             parameters.
%
% OUTPUT
% outData    {nTraj x nCol}   Trajectories in transformed coordinates.

nTraj = size(inData,1);
nCol = size(inData,2);
outData = cell(nTraj,nCol);
if nCol == 2
for iTraj = 1:nTraj
    outData{iTraj,1} = inData{iTraj,1};
    outData{iTraj,2} = map(inData{iTraj,2});
end
else
for iTraj = 1:nTraj
    outData{iTraj,1} = inData{iTraj,1}; outData{iTraj,3} = inData{iTraj,3};
    outData{iTraj,2} = map(inData{iTraj,2},inData{iTraj,3});
end    
end