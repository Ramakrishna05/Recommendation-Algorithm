function recommendedItemsFinal=Recommendation_Algorithm(Dataset,UserID)
    items=size(Dataset,1);
    users=size(Dataset,2);
    recommendedItemsFinal=zeros(items,2);
    recommendedItems=zeros(items,2);
    threshold=0.20;
    k=1;
    display(Dataset);
    if UserID<=users
        targetUserItems=Dataset(:,UserID);
    end
    similarItems=Similarity_Cosine_new(Dataset);
    display(similarItems);
    for i=1:items
        if targetUserItems(i)==0
            display(i);
            similarityForThatItem=similarItems(:,i);
            display(similarityForThatItem);
            for j=1:items
                if similarityForThatItem(j)>threshold
                    recommendedItems(k,1)=j;
                    recommendedItems(k,2)=similarityForThatItem(j);
                    k=k+1;
                end
            end
            display(recommendedItems);
        end
    end
    recommendedItems=sortrows(recommendedItems,2);
    display(recommendedItems);
    k=size(recommendedItems,1);
    x=1;
    while k>1
        if Dataset(recommendedItems(k,1),UserID)==0
            %display(Dataset(recommendedItems(k,1),UserID));
            recommendedItemsFinal(x,1)=recommendedItems(k,1);
            recommendedItemsFinal(x,2)=recommendedItems(k,2);
            x=x+1;
        end
        k=k-1;
    end
end