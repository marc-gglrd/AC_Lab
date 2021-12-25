% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

size=10;

jj = size/2;
kk = size/2 + 1;
    rloc = [floor(kk),floor(jj)]; %initial child position
    floc = [floor(jj),floor(kk)]; %initial caregiver position    



size = 10;
a=zeros(size,size);

i = 1;
j = size - 4;
k = size - 1;

for n=1:6
     if mod(i,2) == 0
         env_x = j;
         env_y = size - 1;
         j = j-3;
     else
         env_x = size - 1;
         env_y = k;
         k = k-3;
     end
     i = i+1;
 if env_x > 0 & env_y > 0
     a(env_x,env_y)=1;
 end
end

i = 1;
j = 5;
k = 2;
      
for n=1:3
     if mod(i,2) == 0
         env_x = j;
         env_y = 2;
         j = j+3;
     else
         env_x = 2;
         env_y = k;
         k = k+3;
     end
     i = i+1;
 if env_x <= 10 & env_y <= 10
     a(env_x,env_y)=1;
 end
end