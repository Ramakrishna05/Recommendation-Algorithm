function pearson_similarity = Similarity_Pearson(Dataset)
    items=size(Dataset,1);
    users=size(Dataset,2);
    pearson_similarity=zeros(items,items);
    for i=1:items
        for j=1:items
            temp1=Dataset(i,:);
            temp2=Dataset(j,:);
            mean_temp1=sum(temp1)/users;
            mean_temp2=sum(temp2)/users;
            modified_temp1=temp1-mean_temp1;
            modified_temp2=temp2-mean_temp2;
            %display(modified_temp1);
            %display(modified_temp2);
            %display(mean_temp1);
            %display(mean_temp2);
            numerator=sum(modified_temp1.*modified_temp2);
            denominator=(sqrt(sum(modified_temp1.^2)))*(sqrt(sum(modified_temp2.^2)));
            pearson_similarity(i,j)=numerator/denominator;
            if pearson_similarity(i,j)<0
                pearson_similarity(i,j)=-1*pearson_similarity(i,j);
            end
            %display(cos_similarity(i,j));
        end
    end
end