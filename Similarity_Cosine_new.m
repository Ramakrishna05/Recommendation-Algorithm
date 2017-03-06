function cos_similarity = Similarity_Cosine_new(Dataset)
    items=size(Dataset,1);
    %users=size(Dataset,2);
    cos_similarity=zeros(items,items);
    for i=1:items
        for j=1:items
            temp1=Dataset(i,:);
            temp2=Dataset(j,:);
            %display(temp2);
            numerator=sum(temp1.*temp2);  % Ai * Bi for i from 1 to n where n is number of users rated the items A and B and Ai and Bi are the individual ratings
            denominator=(sqrt(sum(temp1.^2)))*(sqrt(sum(temp2.^2)));
            cos_similarity(i,j)=numerator/denominator;
            if i==j
                cos_similarity(i,j)=0;
            end
            %display(cos_similarity(i,j));
        end
    end