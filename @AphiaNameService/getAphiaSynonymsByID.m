function xReturn = getAphiaSynonymsByID(obj,AphiaID,offset)
%getAphiaSynonymsByID(obj,AphiaID,offset)
%
%   <strong>Get all synonyms for a given AphiaID</strong>
%           <br />Parameters:
%   		<ul>
%   			<li><u>offset</u>: Starting recordnumber, when retrieving next chunk of (50) records. Default=1</li>
%   		</ul>
%   
%     Input:
%       AphiaID = (int)
%       offset = (int)
%   
%     Output:
%       return{:} = (AphiaRecord)

% Build up the argument lists.
values = { ...
   AphiaID, ...
   offset, ...
   };
names = { ...
   'AphiaID', ...
   'offset', ...
   };
types = { ...
   '{http://www.w3.org/2001/XMLSchema}int', ...
   '{http://www.w3.org/2001/XMLSchema}int', ...
   };

% Create the message, make the call, and convert the response into a variable.
soapMessage = createSoapMessage( ...
    'http://aphia/v1.0/AphiaRecords', ...
    'getAphiaSynonymsByID', ...
    values,names,types,'rpc');
response = callSoapService( ...
    obj.endpoint, ...
    'getAphiaSynonymsByID', ...
    soapMessage);
xReturn = parseSoapResponse(response);
