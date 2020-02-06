counter=0; totalcount=0;
for i= 1:6
    for j= 1:6
        for k= 1:6
            if(i==2| j==2| k==2)
                counter= counter +1
            end
            totalcount= totalcount +1
        end 
    end
end
outcomes = counter/totalcount