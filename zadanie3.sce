function histogramPrzedzialy(img,ilosc_przedzialow)
    [h  w] = size(img);
    H = zeros(ilosc_przedzialow,1);
    Y = zeros(2*ilosc_przedzialow+2,1);
    dlugoscStopnia = ceil(256/ilosc_przedzialow);
    pom = [0:dlugoscStopnia:255];
    pom = [pom;pom];
    X = matrix(pom,1,-1); 
    X = [X 255 255];   
    
    for i = 1:h
        for j = 1:w
            wartosc = img(i,j);
            for p = 0:(ilosc_przedzialow-1)
                if wartosc >= p*dlugoscStopnia & wartosc < p*dlugoscStopnia+dlugoscStopnia then
                    H(p+1) = H(p+1) + 1;
                end
            end
        end
    end
    
    for i = 2:2:2*ilosc_przedzialow+1
        Y(i) = H(i/2);
        Y(i+1) = Y(i);
    end
    plot(X,Y);
endfunction

img = imread('lena3.jpg');
histogramPrzedzialy(img,4);
