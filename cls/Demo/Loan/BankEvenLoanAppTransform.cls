Class Demo.Loan.BankEvenLoanAppTransform Extends Ens.DataTransformDTL [ DependsOn = (Demo.Loan.Msg.Application, Demo.Loan.Msg.Approval) ]
{

/// Comentarios previos de ayuda
/// <EXAMPLE>
/// Do ##class(Demo.Loan.BankEvenLoanAppTransform).Test()
/// </EXAMPLE>
/// Fin de comentarios previos de ayuda
Parameter IGNOREMISSINGSOURCE = 0;

Parameter REPORTERRORS = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Demo.Loan.Msg.Application' targetClass='Demo.Loan.Msg.Approval' create='new' language='objectscript' >
<assign value='process.BankName' property='target.BankName' action='set'  />
<assign value='(context.NameLength#2)=0' property='target.IsApproved' action='set'  />
</transform>
}

}

