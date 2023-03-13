cd '/Users/sophiaspungin/Desktop/Santa Monica State Beach'

addpath 'Long Beach Breakwater'/
addpath 'Long Beach Breakwater'/Ecoli/
addpath 'Long Beach Breakwater'/Enterococcus/
addpath 'Long Beach Breakwater'/'Total coliform'/
addpath 'Santa Monica Pier'/
addpath 'Santa Monica Pier'/'Coliform Total'/
addpath 'Santa Monica Pier'/'E coli'/
addpath 'Santa Monica Pier'/Enterococcus/
addpath 'VENICE BREAKWATER'/
addpath 'VENICE BREAKWATER'/'Coliform total'/
addpath 'VENICE BREAKWATER'/Ecoli/
addpath 'VENICE BREAKWATER'/Enterococcus/

load('samplelocations.mat')

%% ALL LOCATIONS
figure();
geoscatter(samplelocations.TargetLatitude, samplelocations.TargetLongitude)


%% Saving as .mat files
%% Enterococcus
% Venise
DHS107B_entero=readtable('DHS107B_Venice City Beach_entero.csv')
save('DHS107B_entero.mat','DHS107B_entero')
DHS108_entero=readtable('VENICE BREAKWATER/Enterococcus/DHS108_Venice City Beach_entero.csv')
save('DHS108_entero.mat','DHS108_entero')
DHS109_entero=readtable('VENICE BREAKWATER/Enterococcus/DHS109_Venice City Beach_entero.csv')
save('DHS109_entero.mat','DHS109_entero')
SM3_6_entero=readtable('VENICE BREAKWATER/Enterococcus/SM3_6_Venice_Entero.csv')
save('SM3_6_entero.mat','SM3_6_entero')
SMB_3_8_entero=readtable('VENICE BREAKWATER/Enterococcus/SMB_3_8_VENICE_ENTERO.csv')
save('SMB_3_8_entero.mat','SMB_3_8_entero')


Venice_entero = [SMB_3_8_entero; SM3_6_entero;DHS109_entero;DHS108_entero;DHS107B_entero]
save('Venice_entero.mat','Venice_entero')
% Santa Monica
DHS103B_entero=readtable('DHS103B_WillRogersStateBeach.csv')
save('DHS103B_entero.mat','DHS103B_entero')
DHS104B_entero=readtable('DHS104B_SantaMonicaStateBeach.csv')
save('DHS104B_entero.mat','DHS104B_entero')
DHS105B_entero=readtable('DHS105B_SantaMonicaStateBeach.csv')
save('DHS105B_entero.mat','DHS105B_entero')
DHS106_entero=readtable('DHS106_SantaMonicaStateBeach.csv')
save('DHS106_entero.mat','DHS106_entero')
HYPS5_entero=readtable('HYPS5_SantaMonicaStateBeach.csv')
save('HYPS5_entero.mat','HYPS5_entero')
SMB3_3_entero=readtable('SMB3_3_SantaMonicaPier.csv')
save('SMB3_3_entero.mat','SMB3_3_entero')
SMB3_5_entero=readtable('SMB3_5.csv')
save('SMB3_5_entero.mat','SMB3_5_entero')



SantaMonica_entero = [SMB3_5_entero; SMB3_3_entero;HYPS5_entero;DHS106_entero;DHS105B_entero;DHS104B_entero;DHS103B_entero];  %note the semicolon for vertical concatenation
save('SantaMonica_entero.mat','SantaMonica_entero')
%% Longbeach
B3_entero=readtable('B3_LONGBEACH_entero.csv')
save('B3_entero.mat','B3_entero')
B66_entero=readtable('B66_LONGBEACH_ENTERO.csv')
save('B66_entero.mat','B66_entero')
OSB04_entero=readtable('OSB04_Seal Beach Surfside_ENTERO.csv')
save('OSB04_entero.mat','OSB04_entero')

Longbeach_entero = [B3_entero; B66_entero;OSB04_entero];  %note the semicolon for vertical concatenation
save('Longbeach_entero.mat','Longbeach_entero')

%% Plot sampling locations:

%1) Find all stations
all_locations=samplelocations.StationCode
unique_locations_Venice=unique(Venice_entero.StationCode)

for ll=1:length(unique_locations_Venice)
venice_index(ll,1)=find(strcmp(all_locations,unique_locations_Venice(ll,1))==1)
end

unique_locations_SantaMonica=unique(SantaMonica_entero.StationCode)

for ll=1:length(unique_locations_SantaMonica)
santamonica_index(ll,1)=find(strcmp(all_locations,unique_locations_SantaMonica(ll,1))==1)
end

unique_locations_LongBeach=unique(Longbeach_entero.StationCode)

for ll=1:length(unique_locations_LongBeach)
longbeach_index(ll,1)=find(strcmp(all_locations,unique_locations_LongBeach(ll,1))==1)
end


selected_locations=cat(1,venice_index, santamonica_index, longbeach_index)



figure()
geoscatter(samplelocations.TargetLatitude(santamonica_index), samplelocations.TargetLongitude(santamonica_index), 'filled', 'MarkerFaceColor','r')
hold on
geoscatter(34.006533, -118.501422, 'filled', 'square', 'MarkerFaceColor','r')
hold on
geoscatter(samplelocations.TargetLatitude(longbeach_index), samplelocations.TargetLongitude(longbeach_index), 'filled', 'MarkerFaceColor','g')
hold on
geoscatter(33.723220, -118.159241, 'filled', 'square', 'MarkerFaceColor','g')
hold on
geoscatter(samplelocations.TargetLatitude(venice_index), samplelocations.TargetLongitude(venice_index), 'filled', 'MarkerFaceColor','b')
hold on
geoscatter(33.98542499984057, -118.47679455451241, 'filled', 'square', 'MarkerFaceColor','b')
geobasemap("satellite")


%%[SMB3_5_entero; SMB3_3_entero;HYPS5_entero;DHS106_entero;DHS105B_entero;DHS104B_entero;DHS103B_entero];  %note the semicolon for vertical concatenation

%% February
%SMB3_5 Station


%HYPS5_entero Station
%DHS103B_entero Station



for monthnumber=1:12

DHS103B_entero_uniqueyears=unique(year(DHS103B_entero.SampleDate))

DHS103B_entero_february_averages=struct('Year',DHS103B_entero_uniqueyears, 'Average_Entero',0)
for yy=1:length(DHS103B_entero_uniqueyears)
    yearselect=DHS103B_entero_uniqueyears(yy,1)
DHS103B_entero_yearselect=DHS103B_entero.SampleDate(find(year(DHS103B_entero.SampleDate )== yearselect))
DHS103B_entero_monthyearselect=DHS103B_entero_yearselect((find(month(DHS103B_entero_yearselect)== monthnumber)))
if length(DHS103B_entero_monthyearselect)==0
DHS103B_entero_february_averages.Average_Entero(yy,1)=NaN
else
    for mm=1:length(DHS103B_entero_monthyearselect)
    DHS103B_entero_val=mean(DHS103B_entero.CalculatedResult(find(DHS103B_entero.SampleDate==DHS103B_entero_monthyearselect(mm))), 'omitnan')
    end

DHS103B_entero_february_averages.Average_Entero(yy,1)=DHS103B_entero_val
end
end


SMB3_5_entero_uniqueyears=unique(year(SMB3_5_entero.SampleDate))

SMB3_5_entero_february_averages=struct('Year',SMB3_5_entero_uniqueyears, 'Average_Entero',0)
for yy=1:length(SMB3_5_entero_uniqueyears)
    yearselect=SMB3_5_entero_uniqueyears(yy,1)
SMB3_5_entero_yearselect=SMB3_5_entero.SampleDate(find(year(SMB3_5_entero.SampleDate )== yearselect))
SMB3_5_entero_monthyearselect=SMB3_5_entero_yearselect((find(month(SMB3_5_entero_yearselect)== monthnumber)))
if length(SMB3_5_entero_monthyearselect)==0
SMB3_5_entero_february_averages.Average_Entero(yy,1)=NaN
else
    for mm=1:length(SMB3_5_entero_monthyearselect)
    SMB3_5_entero_val=mean(SMB3_5_entero.CalculatedResult(find(SMB3_5_entero.SampleDate==SMB3_5_entero_monthyearselect(mm))), 'omitnan')
    end

SMB3_5_entero_february_averages.Average_Entero(yy,1)=SMB3_5_entero_val
end
end


figure()
plot(SMB3_5_entero_february_averages.Year,SMB3_5_entero_february_averages.Average_Entero )
hold on
plot(DHS103B_entero_february_averages.Year,DHS103B_entero_february_averages.Average_Entero )
monthnumber
month_name = datestr(datetime(1,monthnumber,1),'mmmm');
title('averages by year and month (' + string(month_name)+')')

end

find(SantaMonica_entero.StationCode ==SMB3_5)



