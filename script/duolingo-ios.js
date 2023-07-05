var body = $response.body;
var obj = JSON.parse(body);
obj["plusStatus"] = "BOUND";
if(!obj['adsConfig'])
{
 obj['adsConfig'] = {};
}
obj["adsConfig"]["allowPersonalizedAds"] = false;
body = JSON.stringify(obj);
$done({body});