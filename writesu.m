function writesu(seis, outfile, nx, nt, dt)

%% writen by Youshan Liu

head = zeros(120,1);

head(58) = nt;
head(59) = dt*1e6;
fid = fopen(outfile,'w','n');
   for k = 1:1:nx
       fwrite(fid,head(1:120),'int16');
       fwrite(fid,seis(1:nt,k),'float');
   end
 fclose(fid);
 
end