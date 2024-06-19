Class HL7.RepeatingORUO01DTL Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.2:ORU_R01' targetDocType='2.3:ORU_R01' create='new' language='objectscript' >
<assign value='source.{MSH}' property='target.{MSH}' action='set' />
<assign value='"D"' property='target.{MSH:ProcessingID.processingID}' action='set' />
<assign value='"2.3"' property='target.{MSH:VersionID}' action='set' />
<foreach property='source.{PIDgrpgrp()}' key='k1' >
<assign value='source.{PIDgrpgrp(k1)}' property='target.{PIDgrpgrp(k1)}' action='set' />
<assign value='source.{PIDgrpgrp().PIDgrp.PID:PatientIDInternalID().PatientID}' property='target.{PIDgrpgrp().PIDgrp.PID:PatientIDInternalID().ID}' action='set' />
<assign value='"PI"' property='target.{PIDgrpgrp().PIDgrp.PID:PatientIDInternalID().identifiertypecode}' action='set' />
<assign value='""' property='target.{PIDgrpgrp().PIDgrp.PID:AlternatePatientID}' action='set' />
<assign value='source.{PIDgrpgrp().PIDgrp.PV1}' property='target.{PIDgrpgrp().PIDgrp.PV1grp.PV1}' action='set' />
<if condition='..StartsWith(source.{PIDgrpgrp(k1).PIDgrp.PV1:VisitNumber.PatientID},"L")' >
<true>
<assign value='source.{PIDgrpgrp(k1).PIDgrp.PV1:VisitNumber.PatientID}' property='target.{PIDgrpgrp(k1).PIDgrp.PID:PatientAccountNumber.ID}' action='set' />
</true>
<false>
<assign value='source.{PIDgrpgrp(k1).PIDgrp.PID:PatientIDInternalID(1).PatientID}_source.{PIDgrpgrp(k1).PIDgrp.PV1:VisitNumber.PatientID}' property='target.{PIDgrpgrp(k1).PIDgrp.PID:PatientAccountNumber.ID}' action='set' />
</false>
</if>
<assign value='"1"' property='target.{PIDgrpgrp().ORCgrp(1).OBR:SetIDObservationRequest}' action='set' />
<assign value='source.{PIDgrpgrp().ORCgrp(1).OBR:PlacerOrderNumber(1).uniqueplacerid}' property='target.{PIDgrpgrp().ORCgrp(1).OBR:PlacerOrderNumber(1).entityidentifier}' action='set' />
<assign value='"EPC"' property='target.{PIDgrpgrp().ORCgrp(1).OBR:PlacerOrderNumber(1).namespaceID}' action='set' />
<assign value='..SubString(source.{PIDgrpgrp(k1).ORCgrp(1).OBR:PlacerOrderNumber.uniqueplacerid},2)_"EPC"' property='target.{PIDgrpgrp(k1).ORCgrp(1).OBR:FillerOrderNumber.entityidentifier}' action='set' />
<assign value='"EPC"' property='target.{PIDgrpgrp().ORCgrp(1).OBR:FillerOrderNumber.namespaceID}' action='set' />
<assign value='"MPFILE"' property='target.{PIDgrpgrp().ORCgrp(1).OBR:UniversalServiceIdentifier.nameofcodingsystem}' action='set' />
<foreach property='source.{PIDgrpgrp(k1).ORCgrp(1).OBXgrp()}' key='k2' >
<if condition='source.{PIDgrpgrp(k1).ORCgrp(1).OBXgrp(k2).OBX:ValueType}="TX"' >
<true>
<assign value='"TX"' property='target.{PIDgrpgrp(k1).ORCgrp(1).OBXgrp(k2).OBX:ObservationIdentifier.identifier}' action='set' />
<assign value='"Text"' property='target.{PIDgrpgrp(k1).ORCgrp(1).OBXgrp(k2).OBX:ObservationIdentifier.text}' action='set' />
</true>
</if>
<if condition='..Contains(source.{PIDgrpgrp(k1).ORCgrp(1).OBXgrp(k2).OBX:ObservationIdentifier.identifier},"Overread By")' >
<true>
<assign value='source.{PIDgrpgrp(k1).ORCgrp(1).OBXgrp(k2).OBX:ObservationIdentifier.identifier}_source.{PIDgrpgrp(k1).ORCgrp(1).OBXgrp(k2).OBX:ObservationValue}' property='target.{PIDgrpgrp(k1).ORCgrp(1).OBXgrp(k2).OBX:ObservationValue()}' action='set' />
</true>
</if>
</foreach>
<code>
<![CDATA[      
                    
	set PatID = "PatID="_source.GetValueAt("PIDgrpgrp("_k1_").PIDgrp.PID:PatientIDInternalID.PatientID")
	set IntDate = source.GetValueAt("PIDgrpgrp("_k1_").ORCgrp(1).OBR:Observationdatetime") 
	set Date = "Date="_$e(IntDate,7,8)_"_"_$e(IntDate,5,6)_"_"_$e(IntDate,1,4)
	set Time = "Time="_$e(IntDate,9,10)_":"_$e(IntDate,11,12)_":"_$e(IntDate,13,14)
	set ECG = "TestType=ECG"
	set HOL = "TestType=HOL"


]]></code>
<if condition='source.{PIDgrpgrp(k1).ORCgrp(1).OBR:UniversalServiceID.identifier}="93226X01"' >
<true>
<assign value='$g(PatID)_","_$g(Date)_","_$g(Time)_","_HOL' property='target.{PIDgrpgrp(k1).ORCgrp(1).OBR:PlacerField2}' action='set' />
</true>
<false>
<assign value='$g(PatID)_","_$g(Date)_","_$g(Time)_","_ECG' property='target.{PIDgrpgrp(k1).ORCgrp(1).OBR:PlacerField2}' action='set' />
</false>
</if>
</foreach>
<assign value='source.{DSC}' property='target.{DSC}' action='set' />
</transform>
}

}

