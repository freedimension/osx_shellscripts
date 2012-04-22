<?php
$sWeather = file_get_contents("/Users/mirko/Scripts/weather_google.xml");
$oAPI = simplexml_load_string(utf8_encode($sWeather));

echo "datum=" .$oAPI->weather->forecast_information->forecast_date->attributes()->data."\n";

$sHumidity = $oAPI->weather->current_conditions->humidity->attributes()->data;
$sHumidity = str_replace('%', '', $sHumidity);
$sHumidity = substr($sHumidity, strpos($sHumidity, ':')+1);
$sWind = $oAPI->weather->current_conditions->wind_condition->attributes()->data;
$sWind = substr($sWind, strpos($sWind, ':')+1);

echo "akt_zustand="           .$oAPI->weather->current_conditions->condition->attributes()->data."\n";
echo "akt_temperatur="        .$oAPI->weather->current_conditions->temp_c->attributes()->data."\n";
echo "akt_luftfeuchtigkeit="  .preg_replace('/[^0-9]/', '', $sHumidity)."\n";
echo "akt_wind="              .trim($sWind)."\n";
