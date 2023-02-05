Class dc.IrisGeoMap.FoliumData Extends (%Persistent, %Populate)
{

Property latitude As %Float;

Property longitude As %Float;

Property name As %String;

Property dataset As %String;

Storage Default
{
<Data name="FoliumDataDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>latitude</Value>
</Value>
<Value name="3">
<Value>longitude</Value>
</Value>
<Value name="4">
<Value>name</Value>
</Value>
<Value name="5">
<Value>dataset</Value>
</Value>
</Data>
<DataLocation>^dc.IrisGeoMap.FoliumDataD</DataLocation>
<DefaultData>FoliumDataDefaultData</DefaultData>
<IdLocation>^dc.IrisGeoMap.FoliumDataD</IdLocation>
<IndexLocation>^dc.IrisGeoMap.FoliumDataI</IndexLocation>
<StreamLocation>^dc.IrisGeoMap.FoliumDataS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
