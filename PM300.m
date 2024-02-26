clc;
clear;

m0 = 5;
m = 3;
a = 2;

%%(1)给定一个具有m0个节点的初始强连通网络。把每一条边所指向的节点的编号添加到数组Array中。

% 定义邻接矩阵
adjacency_matrix = [0 1 0 0 0; 0 0 1 0 0; 0 0 0 1 0; 0 0 0 0 1; 1 0 0 0 0];

%定义初始节点
nodes = {'1', '2', '3', '4', '5'};

% 创建有向图对象
G = digraph(adjacency_matrix, nodes);
plot(G);

% 获取有向图的边信息
edges = G.Edges;

% 提取边的起始节点和目标节点的编号
end_nodes = edges.EndNodes(:, 2);

% 将边的信息存储到数组Array中
Array = str2num(char(end_nodes));
Array = Array';

% 显示结果
disp('Array:');
disp(Array);

%%(2)给定参数p∈[0,1]。对于t=1,2,... ,N-m0,执行如下操作
p = m / (m+a);

for num_nodes = length(nodes) : 299
    %进行一次循环
    add_array = circle1(Array,num_nodes,m,p);
    Array = [Array,add_array];
    
    %将一个零列向量拼接到矩阵下方
    zero1 = zeros(1,num_nodes);
    adjacency_matrix = cat(1,adjacency_matrix,zero1);
    
    for i = 1 : num_nodes
        % 检查元素是否在数组中
        is_in_array = ismember(i, add_array);
        if is_in_array
            adjacency_matrix(num_nodes+1,i) = 1;
        else
            % 如果元素不在数组中，则将对应位置赋值为0
            adjacency_matrix(num_nodes+1,i) = 0;
        end
    end
        
    %将一个零列向量拼接到矩阵右侧
    zero1 = zeros(num_nodes+1,1);
    adjacency_matrix = cat(2,adjacency_matrix,zero1);
end