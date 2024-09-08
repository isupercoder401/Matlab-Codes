function[y2,y1]=mymin(arr)
minvalue=arr(1);
index=1;
for i=2:length(arr)
    if(minvalue>arr(i))
        minvalue=arr(i);
        index=i;
    end
end
y2=minvalue;
y1=index;
end
