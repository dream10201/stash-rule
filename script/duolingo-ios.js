var body = $response.body;
var obj = JSON.parse(body);
obj["plusStatus"] = "BOUND";
if(!obj['adsConfig'])
{
 obj['adsConfig'] = {};
}
obj["adsConfig"]["allowPersonalizedAds"] = false;
if(!obj["timerBoostConfig"]){
    obj['timerBoostConfig'] = {};
}
obj["timerBoostConfig"]["hasPurchasedTimerBoost"] = true;
body = JSON.stringify(obj);
$done({body});