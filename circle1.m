%%①生成一个完全随机数r∈[0,1);
%%②如果r<p,那么就完全随机地在数组Array 中选择一个元素;
%%③ 如果r≥p,那么就完全随机地选择一个节点;
%%④执行步骤①-③ m次后(避免重复选取节点),添加从新加入节点指向选定的m个节点的m条有向边,并把这m个节点的编号添加到数组 Array 中。

function add_array = circle1(Array,num_nodes,m,p)

    new_array = [];
    i = 1;

    while i <=  m
    % 生成一个随机数 r ∈ [0, 1)
    r = rand();
    disp(r);

    if r < p
        % 如果 r 小于 p，则完全随机选择数组中的一个元素
        selected_node = Array(randi(length(Array)));

    else
        % 如果 r 大于等于 p，则完全随机选择一个节点（假设节点编号是从 1 开始的整数）
        selected_node = randi(num_nodes);
    end

     % 检查元素是否在数组中
    is_in_array = ismember(selected_node, new_array);

    if is_in_array
        % 如果元素在数组中，则不做任何操作，i = i
    else
        % 如果元素不在数组中，则将其加入数组
        new_array = [new_array, selected_node];
        i = i + 1;
    end
    end

    % 使用 sort 函数对数组进行排序
    add_array = sort(new_array);
    disp(add_array);

end