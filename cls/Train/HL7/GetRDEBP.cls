/// 
Class Train.HL7.GetRDEBP Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='RDE' type='EnsLib.HL7.Message' instantiate='0' />
<property name='Semaforo' type='%String' initialexpression='"Verde"' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='horarios' type='%String' collection='list' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='550' >
<trace name='Hi' value='context.Semaforo' xpos='200' ypos='250' />
<transform name='RXE' class='Train.HL7.RXEfrecuencias' source='request' target='context.RDE' xpos='200' ypos='350' />
<call name='SendRDE' target='ORMOut' async='1' xpos='968' ypos='400' >
<request type='EnsLib.HL7.Message' >
<assign property="callrequest" value="context.RDE" action="set" languageOverride="" />
</request>
</call>
<trace name='Out' value='"After DTL"' xpos='200' ypos='450' />
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}

