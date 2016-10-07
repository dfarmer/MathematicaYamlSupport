(* ::Package:: *)

BeginPackage["YamlSupport`", {"JLink`"}]
ImportExport`RegisterImport["YAML", YamlSupport`YamlImport]
YamlImport[fname_] := JavaBlock[
InstallJava[];
yaml = JavaNew["org.yaml.snakeyaml.Yaml"];
filepath = JavaNew["java.io.FileInputStream", fname];
parsed = yaml@load[filepath];
assoc = Association[Map[ParseYamlValue, JavaObjectToExpression[parsed@entrySet[]], Infinity]];
{"Data" -> assoc}
]
Begin["`Private`"]
ParseYamlValue[val_Symbol /; ClassName[val] == "java.util.LinkedHashMap$Entry"] := <|val@getKey[] -> ParseYamlValue[val@getValue[]]|>
ParseYamlValue[val_Symbol /; ClassName[val] == "java.util.LinkedHashMap"] := Flatten[Map[ParseYamlValue, JavaObjectToExpression[val@entrySet[]], Infinity]]
ParseYamlValue[val_Symbol /; ClassName[val] == "java.util.ArrayList"] := 
Flatten[Map[ParseYamlValue, JavaObjectToExpression[val@toArray[]], Infinity]]
ParseYamlValue[val_] := val
End[]
EndPackage[]
