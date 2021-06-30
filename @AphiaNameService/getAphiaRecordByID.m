function xReturn = getAphiaRecordByID(obj,AphiaID)
%getAphiaRecordByID(obj,AphiaID)
%
%   <strong>Get the complete AphiaRecord for a given AphiaID</strong>
%   		<br /> The returned AphiaRecord has this format:
%   		<br /> <ul><li>	<u><b>AphiaID</b></u> : Unique and persistent identifier within WoRMS. Primary key in the database</li><li>	<u><b>url</b></u> : HTTP URL to the AphiaRecord</li><li>	<u><b>scientificname</b></u> : the full scientific name without authorship</li><li>	<u><b>authority</b></u> : the authorship information for the scientificname formatted according to the conventions of the applicable nomenclaturalCode</li><li>	<u><b>taxonRankID</b></u> : the taxonomic rank identifier of the most specific name in the scientificname</li><li>	<u><b>rank</b></u> : the taxonomic rank of the most specific name in the scientificname</li><li>	<u><b>status</b></u> : the status of the use of the scientificname (usually a taxonomic opinion). Additional technical statuses are (1) <u>quarantined</u>: hidden from public interface after decision from an editor and (2) <u>deleted</u>: AphiaID should NOT be used anymore, please replace it by the valid_AphiaID</li><li>	<u><b>unacceptreason</b></u> : the reason why a scientificname is unaccepted</li><li>	<u><b>valid_AphiaID</b></u> : the AphiaID (for the scientificname) of the currently accepted taxon. NULL if there is no currently accepted taxon.</li><li>	<u><b>valid_name</b></u> : the scientificname of the currently accepted taxon</li><li>	<u><b>valid_authority</b></u> : the authorship information for the scientificname of the currently accepted taxon</li><li>	<u><b>parentNameUsageID</b></u> : the AphiaID (for the scientificname) of the direct, most proximate higher-rank parent taxon (in a classification)</li><li>	<u><b>kingdom</b></u> : the full scientific name of the kingdom in which the taxon is classified</li><li>	<u><b>phylum</b></u> : the full scientific name of the phylum or division in which the taxon is classified</li><li>	<u><b>class</b></u> : the full scientific name of the class in which the taxon is classified</li><li>	<u><b>order</b></u> : the full scientific name of the order in which the taxon is classified</li><li>	<u><b>family</b></u> : the full scientific name of the family in which the taxon is classified</li><li>	<u><b>genus</b></u> : the full scientific name of the genus in which the taxon is classified</li><li>	<u><b>citation</b></u> : a bibliographic reference for the resource as a statement indicating how this record should be cited (attributed) when used</li><li>	<u><b>lsid</b></u> : LifeScience Identifier. Persistent GUID for an AphiaID</li><li>	<u><b>isMarine</b></u> : a boolean flag indicating whether the taxon is a marine organism, i.e. can be found in/above sea water. Possible values: 0/1/NULL</li><li>	<u><b>isBrackish</b></u> : a boolean flag indicating whether the taxon occurrs in brackish habitats. Possible values: 0/1/NULL</li><li>	<u><b>isFreshwater</b></u> : a boolean flag indicating whether the taxon occurrs in freshwater habitats, i.e. can be found in/above rivers or lakes. Possible values: 0/1/NULL</li><li>	<u><b>isTerrestrial</b></u> : a boolean flag indicating the taxon is a terrestial organism, i.e. occurrs on land as opposed to the sea. Possible values: 0/1/NULL</li><li>	<u><b>isExtinct</b></u> : a flag indicating an extinct organism. Possible values: 0/1/NULL</li><li>	<u><b>match_type</b></u> : Type of match. Possible values: exact/like/phonetic/near_1/near_2</li><li>	<u><b>modified</b></u> : The most recent date-time in GMT on which the resource was changed</li></ul>
%   
%     Input:
%       AphiaID = (int)
%   
%     Output:
%       return = (AphiaRecord)

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
    'http://aphia/v1.0/AphiaRecord', ...
    'getAphiaRecordByID', ...
    values,names,types,'rpc');
response = callSoapService( ...
    obj.endpoint, ...
    'getAphiaRecordByID', ...
    soapMessage);
xReturn = parseSoapResponse(response);
