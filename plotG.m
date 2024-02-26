% 创建有向图对象
G = digraph(adjacency_matrix);

% 绘制图形
plot(G, 'Layout', 'force');
title('Price Network Model - 300 nodes');