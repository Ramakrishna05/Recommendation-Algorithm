function transformedDataset=transformDataset(dataset)
    %dataset=sortrows(dataset,2);
    dataset_new=int64(dataset(:,(1:2)));
    rows=size(dataset_new,1);
    %smallDataset=dataset((1:(0.15*rows)),:);
    %display(smallDataset);
    %rows=size(smallDataset,1);
    %columns=size(dataset,2);
    users=max(dataset_new(:,1));
    items=max(dataset_new(:,2));
    transformedDataset=zeros(users,items);
    for i=1:rows
        transformedDataset(dataset_new(i,1),dataset_new(i,2))=dataset(i,3);
    end
end