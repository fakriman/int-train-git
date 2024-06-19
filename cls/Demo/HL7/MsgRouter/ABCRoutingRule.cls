/// 
Class Demo.HL7.MsgRouter.ABCRoutingRule Extends Ens.Rule.Definition [ ProcedureBlock ]
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="Demo.HL7.MsgRouter.Production">

<ruleSet name="Rules for  ABC application messages" effectiveBegin="" effectiveEnd="">

<rule name="Send 2.3.1 ADT_A08 to ADT_A08 and Priority BOs" disabled="false">

<constraint name="docCategory" value="2.3.1"></constraint>

<constraint name="docName" value="ADT_A08"></constraint>

<when condition="1">

<send transform="" target="ADT_A08_FileOperation"></send>

<send transform="" target="Priority_FileOperation"></send>

<return></return>

</when>

</rule>

<rule name="Send custom ORM_O01 with patient class of emergency to Priority BO" disabled="false">

<constraint name="msgClass" value="EnsLib.HL7.Message"></constraint>

<constraint name="docCategory" value="Demo.HL7.MsgRouter.Schema"></constraint>

<constraint name="docName" value="ORM_O01"></constraint>

<when condition="((HL7.{PIDgrp.PV1grp.PV1:PatientClass})=(&quot;E&quot;))">

<send transform="" target="Priority_FileOperation"></send>

<return></return>

</when>

</rule>

<rule name="Send custom ORM_O01 to ORM_O01 BO" disabled="false">

<constraint name="msgClass" value="EnsLib.HL7.Message"></constraint>

<constraint name="docCategory" value="Demo.HL7.MsgRouter.Schema"></constraint>

<constraint name="docName" value="ORM_O01"></constraint>

<when condition="1">

<send transform="" target="ORM_O01_FileOperation"></send>

<return></return>

</when>

</rule>

<rule name="Send 2.3.1 ADT_A31 messages to ADT_A31 BO" disabled="false">

<constraint name="docCategory" value="2.3.1"></constraint>

<constraint name="docName" value="ADT_A31"></constraint>

<when condition="1">

<send transform="" target="ADT_A31_FileOperation"></send>

<return></return>

</when>

</rule>

<rule name="Send 2.3.1 ORU_R01 to Extra Observation BO" disabled="false">

<constraint name="msgClass" value="EnsLib.HL7.Message"></constraint>

<constraint name="docCategory" value="2.3.1"></constraint>

<constraint name="docName" value="ORU_R01"></constraint>

<when condition="1">

<send transform="" target="Extra_Observations"></send>

<return></return>

</when>

</rule>

<rule name="Send all messages that did not match a rule above to Regular BO" disabled="false">

<when condition="1">

<send transform="" target="Regular_FileOperation"></send>

<return></return>

</when>

</rule>

</ruleSet>

</ruleDefinition>
}

}

