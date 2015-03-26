// JScript File
function ClientCommon()
{
//var l;
//l=window.location;
//window.document.location=document.form1.action.substr(0,l-10)+'.aspx?search='+val;
}
function showFind(Mess)
    {
    var tmp;
   
    tmp = prompt("Enter " + Mess + "..!");
    if (tmp==null || tmp=="")
        {
        return false;
        }
    else
        {
        document.getElementById("ctl00_ContentPlaceHolder1_txtlocal").setAttribute("value",tmp); 
        return true;
        }
    }
 function Show_Search_List(path,h,w)
 {
 //window.open(path,'List','toolbar=0,location=0,status=0,menubar=0,scrollbars=1,resizable=Yes,width=' + w + ',height=' + h ); 
 window.document.location=path; 
 return false;
 }
 function Show_Record(val)
 {
 var l;
 l=document.form1.action.length;
 window.document.location=document.form1.action.substr(0,l-10)+'.aspx?search='+val;
 //window.opener.document.getElementById("ctl00_ContentPlaceHolder1_txtlocal").setAttribute("value",val) 
 //window.opener.document.form1.submit(); 
 //window.close();    
 }
 
