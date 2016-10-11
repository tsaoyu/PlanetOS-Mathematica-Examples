(* ::Package:: *)

BeginPackage["PlanetOS`"];
Datasets::usage = "Get list of all dataset IDs."
Metadata::usage = "Get dataset metadata of a given dataset."
Pointdata::usage = "Provides values for the specified dataset at a given point of interest."
Areadata::usage = "Provides values for the specified dataset at a given area of interest."
Stations::usage = "Get the list of stations within a dataset."
Stationdata::usage = "Get vaule from specified station."
Begin["`Private`"]
  apirooturl = "http://api.planetos.com/v1/datasets/"
  Datasets:=Module[{datasetssurl},
	datasetssurl = apirooturl<>"?apikey="<>Global`apikey ;
	Import[datasetssurl ,"json"]
	]
  Metadata[datasets_:"hycom_glbu0.08_91.2_global_0.08d"]:=Module[{datasetmetaurl},
	datasetmetaurl = apirooturl<>datasets<>"?apikey="<>Global`apikey ;
	Import[datasetmetaurl ,"json"]
	]
  Pointdata[datasets_:"hycom_glbu0.08_91.2_global_0.08d",lon_,lat_,opts___?OptionQ]:=Module[{dataseturl},
	If[opts=={},
	dataseturl= apirooturl<>datasets<>"/point?lon="<>ToString[lon]<>"&lat="<>ToString[lat]<>"&apikey="<>Global`apikey;,
	dataseturl= apirooturl<>datasets<>"/point?lon="<>ToString[lon]<>"&lat="<>ToString[lat]<>StringJoin[StringJoin[{"&",ToString[#[[1]]],"=",ToString[#[[2]]]}]&/@Flatten[opts]]<>"&apikey="<>Global`apikey ;
	];
	Import[dataseturl,"json"]
	]
   Areadata[datasets_:"hycom_glbu0.08_91.2_global_0.08d",polygon_,opts___?OptionQ]:=Module[{dataseturl},
	If[opts=={},
	dataseturl= apirooturl<>datasets<>"/area?polygon="<>ToString[polygon]<>"&apikey="<>Global`apikey;,      
	dataseturl= apirooturl<>datasets<>"/area?polygon="<>ToString[polygon]<>StringJoin[StringJoin[{"&",ToString[#[[1]]],"=",ToString[#[[2]]]}]&/@Flatten[opts]]<>"&apikey="<>Global`apikey ;
	];
	Import[dataseturl,"json"]
	]
   Stations[datasets_:"noaa_ndbc_stdmet_stations"]:=Module[{datasetssurl},
	datasetssurl = apirooturl<>datasets<>"/stations?apikey="<>Global`apikey ;
	Import[datasetssurl ,"json"]
	]
   Stationdata[datasets_:"noaa_ndbc_stdmet_stations",station_,opts___?OptionQ]:=Module[{dataseturl},
	If[opts=={},
	dataseturl= apirooturl<>datasets<>"/stations/"<>station<>"?apikey="<>Global`apikey;,
 dataseturl= apirooturl<>datasets<>"/stations/"<>station<>"?apikey="<>Global`apikey<>StringJoin[StringJoin[{"&",ToString[#[[1]]],"=",ToString[#[[2]]]}]&/@Flatten[opts]] ;
	];
	Import[dataseturl,"json"]
	]
End[]

EndPackage[]
