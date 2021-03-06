function KMLplot(LLA)

KMLtdata=LLA;

%Set ellipsoid WGS84
wgs84=[6378.137 0.081819190842622];

%Which type of output desired?
TrackSelected = 1;

LatValues=KMLtdata(:,2);
LongValues=KMLtdata(:,3);
AltValues=KMLtdata(:,4);

%***WRITE KML FILE***Orbit
outnum=findobj('Tag','outdiredit');
OutputDirectory=get(outnum,'String');
OutputFilename='KML_Transit_Altitude';
OutputDirectoryFile=strcat(OutputDirectory,'/',OutputFilename,'.kml');
fid = fopen(OutputDirectoryFile,'wt'); %open file for writing in desired directory

%Do this for all file types
fprintf(fid,'<?xml version="1.0" encoding="UTF-8"?>\n');
fprintf(fid,'<kml xmlns="http://earth.google.com/kml/2.0">\n');
fprintf(fid,'\t<NetworkLinkControl>\n');
%       <minRefreshPeriod>1</minRefreshPeriod>
fprintf(fid,'\t\t<minRefreshPeriod>1</minRefreshPeriod>\n');
%       <maxSessionLength>600</maxSessionLength>
fprintf(fid,'\t\t<maxSessionLength>600</maxSessionLength>\n');
%   </NetworkLinkControl>
fprintf(fid,'\t</NetworkLinkControl>\n');
%   <Placemark>
fprintf(fid,'\t<Placemark>\n');


%       <Snippet maxlines="0"></Snippet>
fprintf(fid,'\t\t<Snippet maxlines="0"></Snippet>\n');
%       <visibility>1</visibility>
fprintf(fid,'\t\t<visibility>1</visibility>\n');
%       <Style>
fprintf(fid,'\t\t<Style>\n');
%           <geomColor>ff0000ff</geomColor>
fprintf(fid,'\t\t\t<geomColor>ff0000ff</geomColor>\n');
%           <geomScale>1</geomScale>
fprintf(fid,'\t\t\t<geomScale>1</geomScale>\n');
%       </Style>
fprintf(fid,'\t\t</Style>\n');
%       <LineString>
fprintf(fid,'\t\t<LineString>\n');

exnum=findobj('Tag','kmlext');
exnum1=get(exnum,'value');
if exnum1==1
fprintf(fid,'\t\t\t<extrude>1</extrude>\n');
else
  fprintf(fid,'\t\t\t<extrude>0</extrude>\n');  
end

fprintf(fid,'\t\t\t<tessellate>1</tessellate>\n');

fprintf(fid,'\t\t\t<altitudeMode>absolute</altitudeMode>\n');

fprintf(fid,'\t\t\t<coordinates>\n');

%Write coordinate set to KML file.

ptssize=size(LatValues);
numPoints=ptssize(1);

for i=1:numPoints
    if (~isnan(LatValues(i,1)))&&(~isnan(LongValues(i,1)))
        
        
        fprintf(fid,'\t\t\t');
        if LatValues(i,1)<10
            fprintf(fid,'%12.9f,%-11.9f',LongValues(i,1),LatValues(i,1));
        else
            fprintf(fid,'%12.9f,%-12.9f',LongValues(i,1),LatValues(i,1));
        end
       
            fprintf(fid,',');
            fprintf(fid,'%-10.3f',AltValues(i,1));
            fprintf(fid,'\n');
       
    end
end

%           </coordinates>
fprintf(fid,'\t\t\t</coordinates>\n');
%       </LineString>
fprintf(fid,'\t\t</LineString>\n');
%   </Placemark>
fprintf(fid,'\t</Placemark>\n');
%</kml>
fprintf(fid,'</kml>\n');


fclose(fid); %close file

%------------------------------------------------------------------------

%***WRITE KML FILE***Orbit
outnum=findobj('Tag','outdiredit');
OutputDirectory=get(outnum,'String');
OutputFilename='KML_Transit_GroundTrack';
OutputDirectoryFile=strcat(OutputDirectory,'/',OutputFilename,'.kml');
fid = fopen(OutputDirectoryFile,'wt'); %open file for writing in desired directory

%Do this for all file types
fprintf(fid,'<?xml version="1.0" encoding="UTF-8"?>\n');
fprintf(fid,'<kml xmlns="http://earth.google.com/kml/2.0">\n');
fprintf(fid,'\t<NetworkLinkControl>\n');
%       <minRefreshPeriod>1</minRefreshPeriod>
fprintf(fid,'\t\t<minRefreshPeriod>1</minRefreshPeriod>\n');
%       <maxSessionLength>600</maxSessionLength>
fprintf(fid,'\t\t<maxSessionLength>600</maxSessionLength>\n');
%   </NetworkLinkControl>
fprintf(fid,'\t</NetworkLinkControl>\n');
%   <Placemark>
fprintf(fid,'\t<Placemark>\n');


%       <Snippet maxlines="0"></Snippet>
fprintf(fid,'\t\t<Snippet maxlines="0"></Snippet>\n');
%       <visibility>1</visibility>
fprintf(fid,'\t\t<visibility>1</visibility>\n');
%       <Style>
fprintf(fid,'\t\t<Style>\n');
%           <geomColor>ff0000ff</geomColor>
fprintf(fid,'\t\t\t<geomColor>ff0000ff</geomColor>\n');
%           <geomScale>1</geomScale>
fprintf(fid,'\t\t\t<geomScale>1</geomScale>\n');
%       </Style>
fprintf(fid,'\t\t</Style>\n');
%       <LineString>
fprintf(fid,'\t\t<LineString>\n');

exnum=findobj('Tag','kmlext');
exnum1=get(exnum,'value');
if exnum1==1
fprintf(fid,'\t\t\t<extrude>1</extrude>\n');
else
  fprintf(fid,'\t\t\t<extrude>0</extrude>\n');  
end

fprintf(fid,'\t\t\t<tessellate>1</tessellate>\n');

fprintf(fid,'\t\t\t<altitudeMode>clampToGround</altitudeMode>\n');

fprintf(fid,'\t\t\t<coordinates>\n');

%Write coordinate set to KML file.

ptssize=size(LatValues);
numPoints=ptssize(1);

for i=1:numPoints
    if (~isnan(LatValues(i,1)))&&(~isnan(LongValues(i,1)))
        
        
        fprintf(fid,'\t\t\t');
        if LatValues(i,1)<10
            fprintf(fid,'%12.9f,%-11.9f',LongValues(i,1),LatValues(i,1));
        else
            fprintf(fid,'%12.9f,%-12.9f',LongValues(i,1),LatValues(i,1));
        end
       
            fprintf(fid,',');
            fprintf(fid,'%-10.3f',AltValues(i,1));
            fprintf(fid,'\n');
       
    end
end

%           </coordinates>
fprintf(fid,'\t\t\t</coordinates>\n');
%       </LineString>
fprintf(fid,'\t\t</LineString>\n');
%   </Placemark>
fprintf(fid,'\t</Placemark>\n');
%</kml>
fprintf(fid,'</kml>\n');


fclose(fid); %close file


clear AltValues LatValues LongValues
clear global KMLtdata KMLtdata2
