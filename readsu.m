function [seis, nx, nt, dt] = readsu(infile)

%% writen by Youshan Liu

fid = fopen(infile,'r','n');
    head = fread(fid,120,'int16');
    nt = head(58);
    dt = head(59)*1e-6;
    frewind(fid);
    fseek(fid,0,'eof');
    nbyte = ftell(fid);
    nx = fix(nbyte/(240+4*nt));
    frewind(fid);
    seis = zeros(nt,nx);
    for k = 1:1:nx
        fseek(fid,240,0);
        seis(1:nt,k) = fread(fid,nt,'float');
    end
fclose(fid);

end