    // JScript File
    function isSpaces(s1)
       {
       var s,l,i,flag;
       flag=0;
       s=MyTrim(s1);//document.getElementById(s1).getAttribute("value");
       l=s.length;
       for(i=0;i<l;i++)
        {
            if(s.charAt(i)!=" ")
            {
            flag=1;
            }
        }
        if(parseInt(flag)==1)
        {
        return false;
        }
        else
        {
        return true;
        }
       } 
       function abc(s1)
       {
       s=document.getElementById(s1).getAttribute("value");
       var s,l,i,flag;
       flag=0;
       l=s.length;
       for(i=0;i<l;i++)
            {   
                if(s.charAt(i)!=" ")
                {   
                    flag=1;
                }
            }
       return flag; 
       }
       function isleap(s)
       {
            i=parseInt(s,0);
            if(i % 100 == 0)
                {
                if(i % 400 ==0)
                    {
                    return true;
                    }
                else
                    {
                    return false; 
                    }   
                }
            else if(i % 4 ==0)  
                {
                    return true;
                }
       return false;
       } 
       function ismon(s)
       {
       var i;
       s=s.toUpperCase();
       mon=new String("JAN,FEB,MAR,APR,MAY,JUN,JUL,AUG,SEP,OCT,NOV,DEC");
       mon=mon.split(',');
       for(i=0;i<12;i++)
       {
        if(s==mon[i])
            {    
                return true;
            }
       }
       return false; 
       }
       function isDate(s)
       {
            if(s.length!=11)
            {
                return false;
            }
            else if(s.charAt(2)!='/' || s.charAt(6)!='/')
            {
                return false;
            }
            else if(ismon(s.substr(3,3))==false)
            {
                return false;
            }
            else if(parseFloat(s.substr(0,2)) > 31 || parseFloat(s.substr(0,2))< 1 )
            {
                return false;
            }
            else if(parseFloat(s.substr(7,4)) > 2100  || parseFloat(s.substr(7,4))< 1900 )
            {
                return false;
            }
            else if(intmonth(s.substr(3,3))==2)
            {
            if(isleap(parseFloat(s.substr(7,4)))==true)
                {
                if(parseFloat(s.substr(0,2))>29)
                    {
                    return false;
                    }
                }
                else
                {
                if(parseFloat(s.substr(0,2))>28)
                    {
                    return false; 
                    } 
                } 
            }
            else if(intmonth(s.substr(3,3))==6 || intmonth(s.substr(3,3))==4 || intmonth(s.substr(3,3))==9 || intmonth(s.substr(3,3))==11)
            {
            if(parseFloat(s.substr(0,2))>30)
                {
                    return false;
                }
             }
            if(chkother(s)==false)
                {
                    return false;
                } 
       return true; 
       }
  function intmonth(s)
       {
       s=s.toUpperCase();
       if(s=='JAN')
       return 1;
       else if(s=='FEB')
       return 2;
       else if(s=='MAR')
       return 3;
       else if(s=='APR')
       return 4;
       else if(s=='MAY')
       return 5;
       else if(s=='JUN')
       return 6;
       else if(s=='JUL')
       return 7;
       else if(s=='AUG')
       return 8;
       else if(s=='SEP')
       return 9;
       else if(s=='OCT')
       return 10;
       else if(s=='NOV')
       return 11;
       else if(s=='DEC')
       return 12;
    }
     function chkother(s)
       {
       if(cc(s.charAt(0))==false)
       {
            return false; 
       }
       if(cc(s.charAt(1))==false)
       {
            return false;
       }
      return true;
       }
      function cc(c)
       {
       if( c!='0' && c!='1'&& c!='2'&& c!='3'&& c!='4'&& c!='5'&& c!='6'&& c!='7'&& c!='8'&& c!='9')
       {
            return false;
       }
       return true;
       }
function MyTrim(s)
{
var l,s1;
l=s.length;
s1="";
for(i=0;i<l;i++)
    {
        if(s.charAt(i)!=" ")
        {
            s1=s1 + s.charAt(i);
        }
   }
return s1;
}

function ComparePWD(Object,Object1)
{
 var val1,val2;
 val1=document.getElementById(Object).getAttribute("value");
 val2=document.getElementById(Object1).getAttribute("value")
 if (val1.length==0 || isSpaces(val1))
    {
      document.getElementById("lblMsg").innerHTML="Message : Please Fill The Password..!";
      document.getElementById(Object).focus();
      return false;
    }
else if (val2.length==0 || isSpaces(val2))
    {
      document.getElementById("lblMsg").innerHTML="Message : Please Fill The Confirm Password..!";
      document.getElementById(Object).focus();
      return false;
    }
 else if (val1 != val2)
    {
      document.getElementById("lblMsg").innerHTML="Message : Password is Not Matching..!";
      document.getElementById(Object1).focus();
      return false;
    }
return true;
}  
function DdlCheck(Object,Mess)
{
  if(document.getElementById(Object).getAttribute("SelectedIndex")<=0)
    {
      alert('Please Select The ' + Mess + '..!');
      //document.getElementById("lblMsg").innerHTML="Message : Please Select The " + Mess + "..!";
      document.getElementById(Object).focus();
      return false;
    }
    return true;
}
function TxtCheck(Object,Mess)
{
  if (document.getElementById(Object).getAttribute("value").length==0 || isSpaces(document.getElementById(Object).getAttribute("value")))
    {
    alert('Please Fill The '+ Mess + '..!');
      //document.getElementById("lblMsg").innerHTML="Message : Please Fill The " + Mess + "..!";
      //document.getElementById(Object).focus();
      document.getElementById(Object).focus();
      return false;
    }
    return true;
    
    
}

function DateCheck(Object,Mess)
{
  if (document.getElementById(Object).getAttribute("value").length==0 || isSpaces(document.getElementById(Object).getAttribute("value")))
    {
     // document.getElementById("lblMsg").innerHTML="Message : Please Fill The " + Mess + "..!";
     alert('Please Fill The ' + Mess + '..!');
      document.getElementById(Object).focus();
      return false;
    }
  else if (!(isDate(document.getElementById(Object).getAttribute("value"))))
    {
     // document.getElementById("lblMsg").innerHTML="Message : Please Fill The Valid Date Format. Eg.(04/MAR/2007)..!";
     alert('Please Fill The Valid Date Format. Eg.(04/MAR/2007)..! ' + Mess + '..!');
     document.getElementById(Object).value="";
     document.getElementById(Object).focus();
     return false;
    }
    return true;
}  

function TxtNCheck(Object,Mess)
{
  if (document.getElementById(Object).getAttribute("value").length==0 || isNaN(document.getElementById(Object).getAttribute("value")))
    {
    alert('Please Fill The '+ Mess + '(Numeric Only)..!');
      //document.getElementById("lblMsg").innerHTML="Message : Please Fill " + Mess + "(Numeric Only)..!";
      document.getElementById(Object).focus();
      return false;
    }
    return true;
}

function DelCheck(Mess)
{ 
    var a;
    a = confirm("Message : Are You Sure To Delete This " + Mess + "..!");
    if(a == false)
    {
        return false;
    }
    return true;
}

function EmailCheck(Object,Mess) {

		var at="@"
		var dot="."
		var lat=document.getElementById(Object).getAttribute("value").indexOf(at)
		var lstr=document.getElementById(Object).getAttribute("value").length
		var ldot=document.getElementById(Object).getAttribute("value").indexOf(dot)
		if (document.getElementById(Object).getAttribute("value").indexOf(at)==-1){
		   alert("Invalid E-mail ID");
		   document.getElementById(Object).focus();
		   return false
		}

		if (document.getElementById(Object).getAttribute("value").indexOf(at)==-1 || document.getElementById(Object).getAttribute("value").indexOf(at)==0 || document.getElementById(Object).getAttribute("value").indexOf(at)==lstr){
		   alert("Please Fill The " + Mess  );
		   document.getElementById(Object).focus();
		   return false
		}

		if (document.getElementById(Object).getAttribute("value").indexOf(dot)==-1 || document.getElementById(Object).getAttribute("value").indexOf(dot)==0 || document.getElementById(Object).getAttribute("value").indexOf(dot)==lstr){
		     alert("Please Fill The " + Mess  );
		     document.getElementById(Object).focus();
		    return false
		}

		 if (document.getElementById(Object).getAttribute("value").indexOf(at,(lat+1))!=-1){
		     alert("Please Fill The " + Mess  );
		     document.getElementById(Object).focus();
		    return false
		 }

		 if (document.getElementById(Object).getAttribute("value").substring(lat-1,lat)==dot || document.getElementById(Object).getAttribute("value").substring(lat+1,lat+2)==dot){
		     alert("Please Fill The " + Mess  );
		     document.getElementById(Object).focus();
		    return false
		 }

		 if (document.getElementById(Object).getAttribute("value").indexOf(dot,(lat+2))==-1){
		     alert("Please Fill The " + Mess  );
		     document.getElementById(Object).focus();
		    return false
		 }
		
		 if (document.getElementById(Object).getAttribute("value").indexOf(" ")!=-1){
		     alert("Please Fill The " + Mess  );
		     document.getElementById(Object).focus();
		    return false
		 }

 		 return true					
	}
