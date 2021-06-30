function xReturn = getAphiaDistributionsByID(obj,AphiaID)
%getAphiaDistributionsByID(obj,AphiaID)
%
%   <strong>Get all distributions for a given AphiaID</strong>
%   		<br />Output fields include:
%   		<br /> <ul><li>	<u><b>locality</b></u> : The specific description of the place</li><li>	<u><b>locationID</b></u> : An identifier for the locality. Using the Marine Regions Geographic IDentifier (MRGID), see <a href='https://www.marineregions.org/mrgid.php' target='_blank'>https://www.marineregions.org/mrgid.php</a></li><li>	<u><b>higherGeography</b></u> : A geographic name less specific than the information captured in the locality term. Possible values: an IHO Sea Area or Nation, derived from the MarineRegions <a href='https://www.marineregions.org/gazetteer.php' target='_blank'>gazetteer</a></li><li>	<u><b>higherGeographyID</b></u> : An identifier for the geographic region within which the locality occurred, using MRGID</li><li>	<u><b>recordStatus</b></u> : The status of the distribution record. Possible values are 'valid' ,'doubtful' or 'inaccurate'. See <a href='https://www.marinespecies.org/aphia.php?p=manual#topic8b' target=_blank>here</a> for explanation of the statuses</li><li>	<u><b>typeStatus</b></u> : The type status of the distribution. Possible values: 'holotype' or empty.</li><li>	<u><b>establishmentMeans</b></u> : The process by which the biological individual(s) represented in the Occurrence became established at the location. Possible values: values listed as Origin <a href='http://www.marinespecies.org/introduced/wiki/Traits:Origin' target=_blank>in WRIMS</a></li><li>	<u><b>decimalLatitude</b></u> : The geographic latitude (in decimal degrees, WGS84)</li><li>	<u><b>decimalLongitude</b></u> : The geographic longitude (in decimal degrees, WGS84)</li><li>	<u><b>qualityStatus</b></u> : Quality status of the record. Possible values: 'checked', 'trusted' or 'unreviewed'. See <a href='https://www.marinespecies.org/aphia.php?p=manual#topic22' target='_blank'>https://www.marinespecies.org/aphia.php?p=manual#topic22</a></li></ul>
%   
%     Input:
%       AphiaID = (int)
%   
%     Output:
%       return{:} = (Distribution)

% Build up the argument lists.
values = { ...
   AphiaID, ...
   };
names = { ...
   'AphiaID', ...
   };
types = { ...
   '{http://www.w3.org/2001/XMLSchema}int', ...
   };

% Create the message, make the call, and convert the response into a variable.
soapMessage = createSoapMessage( ...
    'http://aphia/v1.0/AphiaDistributions', ...
    'getAphiaDistributionsByID', ...
    values,names,types,'rpc');
response = callSoapService( ...
    obj.endpoint, ...
    'getAphiaDistributionsByID', ...
    soapMessage);
xReturn = parseSoapResponse(response);
