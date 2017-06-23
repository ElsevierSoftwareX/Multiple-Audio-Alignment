% SMC Demonstration: Demonstration of multiresolution alignment based on SMC samplers
%
% Copyright (C) 2016  Author: Dogac Basaran

%    This program is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program.  If not, see <http://www.gnu.org/licenses/>

current_folder = pwd;
if isempty(strfind(current_folder,'/'))==1 % OS is Windows
    parent_folder = current_folder(1:strfind(current_folder,'\SMC_based_alignment'));
    load_path = [parent_folder 'audio_data\'];    
else % OS is Linux
    parent_folder = current_folder(1:strfind(current_folder,'/SMC_based_alignment'));
    load_path = [parent_folder 'audio_data/'];    
end

% Extract features from audio dataset
dataset_features = feature_extract_module(load_path);

% Align the unsyncronized audio signals (might take a while..), the results
% are written in a text file.
[Clusters, r_clusters, time_elapsed] = SMC_main_module(dataset_features);

