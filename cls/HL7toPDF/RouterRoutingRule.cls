/// 
Class HL7toPDF.RouterRoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="Sample.ASC.PDF.Production">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="">
<when condition="1">
<send transform="Sample.ASC.PDF.DTL.HL7toPDF" target="PDF.Out.File"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}

