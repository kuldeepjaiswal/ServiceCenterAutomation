////////////////////////////
//This is a Javascript Calender
// Developed By Pankaj K. Verma
make_Calender();
/////////////////////////////
//////////////Variable Declaration////////////////////////////////////////
var pan_timer;
var sel_textColor="";
var sel_textBackColor="green";
var gen_textColor="black";
var gen_textBackColor="#ddefff";
var Outer_Border_Color="#f0f8ff";
var Internal_Border_Color="Black";
var Border_Width="1";
var Mouse_Move_TextColor="";
var Mouse_Move_TextBackColor="";
var TextBox_Name;
var pan_cal;
var pan_cnt;
pan_data1=new Array(7);
pan_data2=new Array(7);
pan_data3=new Array(7);
pan_data4=new Array(7);
pan_data5=new Array(7);
pan_data6=new Array(7);

//////////////Calender Creation Call on <Body Onload="make_Calender()">////////////////////////////////////////
function make_Calender()
{
var pan_xmax,pan_ymax,pan_x,pan_y;
var pan_tag=new String();
var pan_tagid;
pan_cal=document.createElement("div"); 
pan_cal.id="Calender";
pan_tag="<div id='pankaj' style=' z-index:0;filter: progid:DXImageTransform.Microsoft.Fade();position :absolute ;text-align: center; border-right: " + Outer_Border_Color + " thin solid; border-top: " + Outer_Border_Color + " thin solid; left: 152px; border-left: " + Outer_Border_Color + " thin solid; width: 213px; border-bottom: " + Outer_Border_Color + " thin solid; top: 92px; height: 106px; background-color: transparent;visibility:hidden''>";
pan_tag=pan_tag + "</div>";
pan_cal.innerHTML=pan_tag;
document.body.appendChild(pan_cal); 
}
//////////////Show Calender Call on <Input id='id1' onmouseover="show_Calender('id1')">////////////////////////////////////////
function show_Calender(pan_arg)
{
var pan_temp_mon_value,pan_temp_year_value;
var pan_dt=new Date();
var pan_tag=new String();
if (document.getElementById("pankaj").style.visibility=="") 
{
	if (TextBox_Name==pan_arg.id)
	{
	    return false;
	}
	else
	{
        document.getElementById(TextBox_Name).setAttribute("disabled",""); 
	}
}
TextBox_Name=pan_arg.id;
pan_str=document.getElementById(TextBox_Name).getAttribute("value");
if(!(pan_str=="" || pan_str==null))
{
    if (!(isDate(pan_str)))
    {
        alert("Invalid Date Format : dd/MMM/yyyy Required");
        return false;
    }
}


    document.getElementById(TextBox_Name).setAttribute("disabled","disabled"); 

    if(!(pan_str=="" || pan_str==null))
    {
        pan_temp_mon_value=getMonthVal(pan_str.substr(3,3))-1;
        pan_temp_year_value=parseFloat(pan_str.substr(7,4));
        pan_dt.setDate(parseFloat(pan_str.substr(0,2)));
        pan_dt.setMonth(pan_temp_mon_value); 
        pan_dt.setFullYear(pan_temp_year_value); 
        setDates(pan_dt);
    }
    else
    {
        pan_temp_mon_value=pan_dt.getMonth();
        pan_temp_year_value=pan_dt.getFullYear();
        setDates();
    }
    pan_tag=pan_tag + Return_Calender_Table();
    document.getElementById("pankaj").innerHTML=Return_Calender_Table();
    pan_xmax=parseFloat(window.screen.Width)/2;
    pan_ymax=parseFloat(window.screen.Height)/2;
    pan_x=event.clientX;
    pan_y=event.clientY;
    //alert(pan_y);
    //alert(pan_ymax);
    //alert(window.document.body.scrollWidth);
	if(parseFloat(pan_x)<=parseFloat(pan_xmax) && parseFloat(pan_y)<=parseFloat(pan_ymax))
	{	
	//left top
	document.getElementById("pankaj").style.left = parseFloat(pan_x) + parseFloat(window.document.body.scrollLeft);
    document.getElementById("pankaj").style.top = parseFloat(pan_y) + parseFloat(window.document.body.scrollTop);
    }
    else if(parseFloat(pan_x)>parseFloat(pan_xmax) && parseFloat(pan_y)<=parseFloat(pan_ymax))
	{	
	//right top
	document.getElementById("pankaj").style.left = parseFloat(pan_x) + parseFloat(window.document.body.scrollLeft) - 213;
    document.getElementById("pankaj").style.top = parseFloat(pan_y) + parseFloat(window.document.body.scrollTop);
    }
	else if(parseFloat(pan_x)<=parseFloat(pan_xmax) && parseFloat(pan_y)>parseFloat(pan_ymax))
	{	
	//left Bottom
	document.getElementById("pankaj").style.left = parseFloat(pan_x) + parseFloat(window.document.body.scrollLeft);
    document.getElementById("pankaj").style.top = parseFloat(pan_y) + parseFloat(window.document.body.scrollTop)-135;
 	}
	else if(parseFloat(pan_x)>parseFloat(pan_xmax) && parseFloat(pan_y)>parseFloat(pan_ymax))
	{	
	//right Bottom
	document.getElementById("pankaj").style.left = parseFloat(pan_x) + parseFloat(window.document.body.scrollLeft) - 213;
    document.getElementById("pankaj").style.top = parseFloat(pan_y) + parseFloat(window.document.body.scrollTop)-135;
  	}
    //document.getElementById("pankaj").style.left= parseFloat(document.body.scrollWidth)-213;//x;
    //document.getElementById("pankaj").style.top=parseFloat(event.clientY) +  parseFloat(document.body.scrollTop);//y;
    document.getElementById("pankaj").filters[0].Apply(); 
    document.getElementById("pankaj").style.visibility=""; 
    document.getElementById("pankaj").filters[0].Play();  
    document.getElementById("pankaj").filters[0].Play();  

    if(!(pan_str=="" || pan_str==null))
    {

        document.getElementById("pankaj_year").value=pan_temp_year_value;
        document.getElementById("pankaj_mon").options[pan_temp_mon_value].selected=true;
        Disp_Date(document.getElementById(TextBox_Name).value);
    }
    else
    {
        document.getElementById("pankaj_year").value=pan_temp_year_value;
        document.getElementById("pankaj_mon").options[pan_temp_mon_value].selected=true;
    //  Disp_Date(document.getElementById(TextBox_Name).value);
    }
    document.getElementById("pankaj_mon").focus();
}
function hide_Calender()
{
    //document.getElementById("pankaj_year").options[pan_temp_year_value].selected=true;
    //document.getElementById("pankaj_mon").options[pan_temp_mon_value].selected=true;
    //document.getElementById("pankaj").style.visibility="hidden";
    document.getElementById("pankaj").innerHTML="";
    document.getElementById("pankaj").style.visibility="hidden";
    document.getElementById(TextBox_Name).setAttribute("disabled",""); 
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
       for (i=0;i<12;i++)
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
       else if(parseFloat(s.substr(7,4)) > 9999  || parseFloat(s.substr(7,4))< 1000 )
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
  
//////////////Restore formatting of previosly selected cell on clicking a cell ////////////////////////////////////////
function Disp_Date_Restore(pan_arg)
{
    var pan_mode=0;
    var pan_cnt,pan_day,pan_month,pan_year;
    if (!(pan_arg=="" || pan_arg==null))  
    {
        pan_day=pan_arg;
        for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
        {   
            if(parseFloat(pan_data1[pan_cnt])==parseFloat(pan_day))
            {
            pan_mode=1;
            pan_day="pan_td1"+pan_cnt;
            break;
            }
        }
        if (parseFloat(pan_mode)==0)
        {
            for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
            {   
            if(parseFloat(pan_data2[pan_cnt])==parseFloat(pan_day))
            {
            pan_mode=1;
            pan_day="pan_td2"+pan_cnt;
            break;
            }
            }
        }
        if (parseFloat(pan_mode)==0)
        {
            for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
            {   
                if(parseFloat(pan_data3[pan_cnt])==parseFloat(pan_day))
                {
                pan_mode=1;
                pan_day="pan_td3"+pan_cnt;
                break;
                }   
            }
        }
        if (parseFloat(pan_mode)==0)
        {
            for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
            {   
                if(parseFloat(pan_data4[pan_cnt])==parseFloat(pan_day))
                {
                pan_mode=1;
                pan_day="pan_td4"+pan_cnt;
                break;
                }
            }
        }
         if (parseFloat(pan_mode)==0)
        {
            for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
            {   
                if(parseFloat(pan_data5[pan_cnt])==parseFloat(pan_day))
                {
                pan_mode=1;
                pan_day="pan_td5"+pan_cnt;
                break;
                }
            }
        }
        if (parseFloat(pan_mode)==0)
        {
            for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
            {   
                if(parseFloat(pan_data6[pan_cnt])==parseFloat(pan_day))
                {
                pan_mode=1;
                pan_day="pan_td6"+pan_cnt;
                break;
                }
            }
        }
     document.getElementById(pan_day).style.color =gen_textColor; 
     document.getElementById(pan_day).style.background =gen_textBackColor;
     }
}

//////////////Display a date is selected and month,year combo is selected for given date as argument////////////////////////////////////////
function Disp_Date(pan_arg)
{
    var pan_mode=0;
    var pan_cnt,pan_day,pan_month,pan_year;
    
    if (!(pan_arg=="" || pan_arg==null))  
    {
        pan_day=pan_arg.substr(0,2);
        pan_mon=pan_arg.substr(3,3);
        pan_year=pan_arg.substr(7,4);
        for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
        {   
            if(parseFloat(pan_data1[pan_cnt])==parseFloat(pan_day))
            {
            pan_mode=1;
            pan_day="pan_td1"+pan_cnt;
            break;
            }
        }
        if (parseFloat(pan_mode)==0)
        {
            for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
            {   
            if(parseFloat(pan_data2[pan_cnt])==parseFloat(pan_day))
            {
            pan_mode=1;
            pan_day="pan_td2"+pan_cnt;
            break;
            }
            }
        }
        if (parseFloat(pan_mode)==0)
        {
            for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
            {   
                if(parseFloat(pan_data3[pan_cnt])==parseFloat(pan_day))
                {
                pan_mode=1;
                pan_day="pan_td3"+pan_cnt;
                break;
                }   
            }
        }
        if (parseFloat(pan_mode)==0)
        {
            for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
            {   
                if(parseFloat(pan_data4[pan_cnt])==parseFloat(pan_day))
                {
                pan_mode=1;
                pan_day="pan_td4"+pan_cnt;
                break;
                }
            }
        }
         if (parseFloat(pan_mode)==0)
        {
            for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
            {   
                if(parseFloat(pan_data5[pan_cnt])==parseFloat(pan_day))
                {
                pan_mode=1;
                pan_day="pan_td5"+pan_cnt;
                break;
                }
            }
        }
        if (parseFloat(pan_mode)==0)
        {
            for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
            {   
                if(parseFloat(pan_data6[pan_cnt])==parseFloat(pan_day))
                {
                pan_mode=1;
                pan_day="pan_td6"+pan_cnt;
                break;
                }
            }
        }
     document.getElementById(pan_day).style.color =gen_textBackColor; 
     document.getElementById(pan_day).style.background =gen_textColor;
     document.getElementById("pankaj_mon").options[parseFloat(getMonthVal(pan_mon))-1].selected=true;
     //alert(parseFloat(pan_year)-2000);
     //document.getElementById("pankaj_year").options[parseFloat(pan_year)-2000].selected=true;
  document.getElementById("pankaj_year").value=parseFloat(pan_year);
    }
}
function subYear()
{
 document.getElementById("pankaj_year").value=parseFloat(document.getElementById("pankaj_year").value)-1;
 setYear();
}
function movedown()
{
pan_timer=window.setInterval("subYear()",0);
}
function addYear()
{
 document.getElementById("pankaj_year").value=parseFloat(document.getElementById("pankaj_year").value)+1;
 setYear();
}
function moveup()
{
pan_timer=window.setInterval("addYear()",0);
}
function stop()
{
window.clearInterval(pan_timer);
}
//////////////Creating Calender Table ////////////////////////////////////////

function Return_Calender_Table()
{
var pan_tag=new String();
pan_tag= pan_tag + "<table style='width: 100%; height: 100%; text-align :center; font-family :Verdana ; font-size :7pt ; color: " + gen_textColor + "; background-color: " + gen_textBackColor+ "' border='" + Border_Width + "' bordercolor='" + Internal_Border_Color + "'>";
pan_tag= pan_tag + "<tr>";
pan_tag= pan_tag + "<td colspan='2'><select id='pankaj_mon' onchange=pan_mon_year_change('1') style='width: 50px; font-size :7pt ; font-family :Verdana'><option option='JAN'>JAN</option><option option='FEB'>FEB</option><option option='MAR'>MAR</option><option option='APR'>APR</option><option option='MAY'>MAY</option><option option='JUN'>JUN</option><option option='JUL'>JUL</option><option option='AUG'>AUG</option><option option='SEP'>SEP</option><option option='OCT'>OCT</option><option option='NOV'>NOV</option><option option='DEC'>DEC</option></select></td>";
pan_tag = pan_tag+ "<td colspan='2'><input id='pankaj_year' maxlength='4' onBlur='setYear()' style='text-align: center; width: 50px; font-size :7pt ; font-family :Verdana '>";
pan_tag = pan_tag+ "<td id='pan_up' onmousemove=Show_Select('pan_up') onclick='addYear()' onmouseout=Restore_Select('pan_up') onmousedown='moveup()' onmouseup='stop()' style='font-size :8pt; font-weight :bold '>▲</td>";
pan_tag = pan_tag+ "<td id='pan_down' onmousemove=Show_Select('pan_down') onmouseout=Restore_Select('pan_down') onmousedown='movedown()' onmouseup='stop()' style='font-size :8pt; font-weight :bold'>▼</td>";
pan_tag = pan_tag+ "<td id='pan_close' onmousemove=Show_Select('pan_close') onmouseout=Restore_Select('pan_close') onmousedown=hide_Calender() style='font-size :8pt; font-weight :bold '>X</td></tr></div>";
pan_tag=pan_tag + "<tr><td style='width: 29px; height: 18px;'>SUN</td><td style='width: 24px; height: 18px;'>MON</td><td style='width: 16px; height: 18px;'>TUE</td><td style='width: 29px; height: 18px;'>WED</td><td style='width: 29px; height: 18px;'>THU</td><td style='width: 29px; height: 18px;'>FRI</td><td style='width: 3px; height: 18px;'>SAT</td></tr>";
///////////////////
pan_tag=pan_tag + "<tr>"
for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
{
pan_tagid="pan_td1" + pan_cnt;
pan_tag=pan_tag + "<td id='" + pan_tagid + "' onmousemove=Show_Select('" + pan_tagid + "') onmouseout=Restore_Select('" + pan_tagid + "') onmousedown=Disp_Sel_Date('" + pan_data1[pan_cnt] + "','hide') style='width: 14%'>" + pan_data1[pan_cnt] + "</td>"
}
pan_tag=pan_tag + "</tr>"
//////////////////
pan_tag=pan_tag + "<tr>"
for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
{
pan_tagid="pan_td2" + pan_cnt;
pan_tag=pan_tag + "<td id='" + pan_tagid + "' onmousemove=Show_Select('" + pan_tagid + "') onmouseout=Restore_Select('" + pan_tagid + "') onmousedown=Disp_Sel_Date('" + pan_data2[pan_cnt] + "','hide') style='width: 14%'>" + pan_data2[pan_cnt] + "</td>"
}
pan_tag=pan_tag + "</tr>"
/////////////////
pan_tag=pan_tag + "<tr>"
for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
{
pan_tagid="pan_td3" + pan_cnt;
pan_tag=pan_tag + "<td id='" + pan_tagid + "' onmousemove=Show_Select('" + pan_tagid + "') onmouseout=Restore_Select('" + pan_tagid + "') onmousedown=Disp_Sel_Date('" + pan_data3[pan_cnt] + "','hide') style='width: 14%'>" + pan_data3[pan_cnt] + "</td>"
}
pan_tag=pan_tag + "</tr>"
/////////////////
pan_tag=pan_tag + "<tr>"
for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
{
pan_tagid="pan_td4" + pan_cnt;
pan_tag=pan_tag + "<td id='" + pan_tagid + "' onmousemove=Show_Select('" + pan_tagid + "') onmouseout=Restore_Select('" + pan_tagid + "') onmousedown=Disp_Sel_Date('" + pan_data4[pan_cnt] + "','hide') style='width: 14%'>" + pan_data4[pan_cnt] + "</td>"
}
pan_tag=pan_tag + "</tr>"
/////////////////
pan_tag=pan_tag + "<tr>"
for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
{
pan_tagid="pan_td5" + pan_cnt;
pan_tag=pan_tag + "<td id='" + pan_tagid + "' onmousemove=Show_Select('" + pan_tagid + "') onmouseout=Restore_Select('" + pan_tagid + "') onmousedown=Disp_Sel_Date('" + pan_data5[pan_cnt] + "','hide') style='width: 14%'>" + pan_data5[pan_cnt] + "</td>"
}
pan_tag=pan_tag + "</tr>"
/////////////////
if(!isNaN(parseFloat(pan_data6[0])))
{
pan_tag=pan_tag + "<tr>"
for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
{
pan_tagid="pan_td6" + pan_cnt;
pan_tag=pan_tag + "<td id='" + pan_tagid + "' onmousemove=Show_Select('" + pan_tagid + "') onmouseout=Restore_Select('" + pan_tagid + "') onmousedown=Disp_Sel_Date('" + pan_data6[pan_cnt] + "','hide') style='width: 14%'>" + pan_data6[pan_cnt] + "</td>"
}
pan_tag=pan_tag + "</tr>"
}
pan_tag=pan_tag + "</table>"
return pan_tag;
/////////////////
}

function setYear()
{
var pan_a;
var pan_b=new Date();
    pan_a=document.getElementById("pankaj_year").value;
    if(isNaN(pan_a))
    {
    document.getElementById("pankaj_year").value=pan_b.getFullYear();
    }
    else if(parseFloat(pan_a)< 1)
    {
    document.getElementById("pankaj_year").value="2000";
    }
    else if(parseFloat(pan_a)<=999) 
    {
    document.getElementById("pankaj_year").value=parseInt(pan_a) + 2000;
    }
    else if(parseFloat(pan_a)>9999) 
    {
    document.getElementById("pankaj_year").value="2000";
    }
    if (document.getElementById(TextBox_Name).value!="")
    {
    document.getElementById(TextBox_Name).value=document.getElementById(TextBox_Name).value.substr(0,7)+document.getElementById("pankaj_year").value;
    }
 pan_mon_year_change(2);  
}

//////////////Convert int to Month Name Ex.(1=JAN) ////////////////////////////////////////

function getMonthName(pan_arg)
{   
    var pan_ret;
    if (parseFloat(pan_arg)==1)
    {
    pan_ret="JAN";
    }
    if (parseFloat(pan_arg)==2)
    {
    pan_ret="FEB";
    }
    if (parseFloat(pan_arg)==3)
    {
    pan_ret="MAR";
    }
    if (parseFloat(pan_arg)==4)
    {
    pan_ret="APR";
    }
    if (parseFloat(pan_arg)==5)
    {
    pan_ret="MAY";
    }
    if (parseFloat(pan_arg)==6)
    {
    pan_ret="JUN";
    }
    if (parseFloat(pan_arg)==7)
    {
    pan_ret="JUL";
    }
    if (parseFloat(pan_arg)==8)
    {
    pan_ret="AUG";
    }
    if (parseFloat(pan_arg)==9)
    {
    pan_ret="SEP";
    }
    if (parseFloat(pan_arg)==10)
    {
    pan_ret="OCT";
    }
    if (parseFloat(pan_arg)==11)
    {
    pan_ret="NOV";
    }
    if (parseFloat(pan_arg)==12)
    {
    pan_ret="DEC";
    }
    return pan_ret;
}
//////////////Coverting Name to int (JAN=1) ////////////////////////////////////////

function getMonthVal(pan_arg)
{   
    var pan_ret;
    pan_arg=pan_arg.toUpperCase();
    if (pan_arg=='JAN')
    {
    pan_ret=1;
    }
    if (pan_arg=='FEB')
    {
    pan_ret=2;
    }
    if (pan_arg=='MAR')
    {
    pan_ret=3;
    }
    if (pan_arg=='APR')
    {
    pan_ret=4;
    }
    if (pan_arg=='MAY')
    {
    pan_ret=5;
    }
    if (pan_arg=='JUN')
    {
    pan_ret=6;
    }
    if (pan_arg=='JUL')
    {
    pan_ret=7;
    }
    if (pan_arg=='AUG')
    {
    pan_ret=8;
    }
    if (pan_arg=='SEP')
    {
    pan_ret=9;
    }
    if (pan_arg=='OCT')
    {
    pan_ret=10;
    }
    if (pan_arg=='NOV')
    {
    pan_ret=11;
    }
    if (pan_arg=='DEC')
    {
    pan_ret=12;
    }
    return pan_ret;
}
//////////////Display a date is selected by clicking on cell////////////////////////////////////////

function Disp_Sel_Date(pan_arg,hide)
{   setYear();
    var pan_dt;
    if (!isNaN(parseFloat(pan_arg)))
    {
        if (parseFloat(pan_arg) <= 9)
        {
        pan_arg="0" + pan_arg;
        }
        if (!(document.getElementById(TextBox_Name).value==null || document.getElementById(TextBox_Name).value==""))
        {
        Disp_Date_Restore(document.getElementById(TextBox_Name).value.substr(0,2));
        }
        pan_dt=pan_arg +"/"+getMonthName(get_Sel_Index_Mon())+"/"+get_Sel_Index_Year();
        document.getElementById(TextBox_Name).setAttribute("value",pan_dt);  
    }
   
    if (!(hide==null || hide==""))
	{
	
		hide_Calender();
	}
}
//////////////Return selectedindex of month combobox ////////////////////////////////////////

function get_Sel_Index_Mon()
{
var pan_cnt=0;
    for (pan_cnt=0;pan_cnt <= document.getElementById("pankaj_mon").options.length-1;pan_cnt++)
    {
        if (document.getElementById("pankaj_mon").options[pan_cnt].selected==true)
        {
        return parseFloat(pan_cnt)+1;
        break;
        }
    }
}
//////////////Return selectedValue of Year combobox ////////////////////////////////////////

function get_Sel_Index_Year()
{
var pan_cnt=0;
  //  for (pan_cnt=0;pan_cnt <= document.getElementById("pankaj_year").options.length-1;pan_cnt++)
  //  {
  //      if (document.getElementById("pankaj_year").options[pan_cnt].selected==true)
  //      {
        return document.getElementById("pankaj_year").value;
  //      break;
  //      }
  //  }
}
//////////////Return No Days of Given month and year ////////////////////////////////////////

function getDaysInMonth(pan_mon,pan_year)
{   /////If February
    var pan_nod;
    pan_mon=parseFloat(pan_mon)+1;
    if (parseFloat(pan_mon)==2)
    {   //If divisible by 100
        if ((parseFloat(pan_year)%100) == 0)
        {
            if ((parseFloat(pan_year)%400) == 0) 
            {
            pan_nod=29;
            }
            else
            {
            pan_nod=28;
            }
        }
        else 
        {   //// if divisible by 4
            if ((parseFloat(pan_year)%4) == 0) 
            {
            pan_nod=29;
            }
            else
            {
            pan_nod=28;
            }
        }
        
    }///If Month with 30 Days
    else if(parseFloat(pan_mon)==4 || parseFloat(pan_mon)==6 || parseFloat(pan_mon)==9 || parseFloat(pan_mon)==11)
    {
        pan_nod=30;
    }///If Month with 31 Days
    else     
    {
        pan_nod=31;
    }   
    return pan_nod;
}
//////////////Set Dates against Sunday/Monday... ////////////////////////////////////////
function setDates(pan_arg)
{   var pan_dt;
    var pan_start_date;
    var pan_date,pan_no_of_days,pan_start_day,pan_start_date;
    if (pan_arg==null || pan_arg=="")
    {
    pan_dt=new Date();
    pan_start_date=new Date();
    }
    else
    {
    pan_dt=pan_arg;
    pan_start_date=pan_arg;
    }
    pan_date=1;
    pan_no_of_days=getDaysInMonth(pan_dt.getMonth(), pan_dt.getFullYear())
    pan_start_date.setDate(1);
    pan_start_date.setMonth(pan_dt.getMonth());
    pan_start_date.setFullYear(pan_dt.getFullYear());
    pan_start_day=pan_start_date.getDay() 
    for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
    {   
        if (pan_start_day<=pan_cnt)
        {
        pan_data1[pan_cnt]=pan_date;  
        pan_date=parseFloat(pan_date)+1;      
        }
        else
        {
        pan_data1[pan_cnt]="";
        }
      
    }
    for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
    {
        pan_data2[pan_cnt]=pan_date;
        pan_date=parseFloat(pan_date)+1;
    }
    for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
    {   
        pan_data3[pan_cnt]=pan_date;
        pan_date=parseFloat(pan_date)+1;
    }
    for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
    {   
        pan_data4[pan_cnt]=pan_date;
        pan_date=parseFloat(pan_date)+1;
    }
    for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
    {
        if (pan_date<=pan_no_of_days)
        {
        pan_data5[pan_cnt]=pan_date;
        }
         else
        {
        pan_data5[pan_cnt]="";
        }
        pan_date=parseFloat(pan_date)+1;
    }
      for(pan_cnt=0;pan_cnt<=6;pan_cnt++)
    {
        if (pan_date<=pan_no_of_days)
        {
        pan_data6[pan_cnt]=pan_date;
        }
         else
        {
        pan_data6[pan_cnt]="";
        }
        pan_date=parseFloat(pan_date)+1;
    }
}
//////////////Show Selected On Mouse Move on each cell ////////////////////////////////////////
function Show_Select(pan_arg)
{
if(!isNaN(parseFloat(document.getElementById(pan_arg).innerText)))
{
document.getElementById(pan_arg).style.color =gen_textBackColor; 
document.getElementById(pan_arg).style.background =gen_textColor;
}
else if((document.getElementById(pan_arg).innerText)=="X")
{
document.getElementById(pan_arg).style.color =gen_textBackColor; 
document.getElementById(pan_arg).style.background =gen_textColor;
}
else if((document.getElementById(pan_arg).innerText)=="▲")
{
document.getElementById(pan_arg).style.color =gen_textBackColor; 
document.getElementById(pan_arg).style.background =gen_textColor;
document.getElementById("pankaj_year").focus();
}
else if((document.getElementById(pan_arg).innerText)=="▼")
{
document.getElementById(pan_arg).style.color =gen_textBackColor; 
document.getElementById(pan_arg).style.background =gen_textColor;
document.getElementById("pankaj_year").focus();
}

}
//////////////Restore Selected On Mouse Out on each cell ////////////////////////////////////////
function Restore_Select(pan_arg)
{
var pan_day;
if(document.getElementById(TextBox_Name).value==null || document.getElementById(TextBox_Name).value=="") 
{
document.getElementById(pan_arg).style.color =gen_textColor;  
document.getElementById(pan_arg).style.background =gen_textBackColor;
}
else
{
pan_day=document.getElementById(TextBox_Name).value;
pan_day=pan_day.substr(0,2);
if(parseFloat(pan_day)!=parseFloat(document.getElementById(pan_arg).innerText))  
{
document.getElementById(pan_arg).style.color =gen_textColor;  
document.getElementById(pan_arg).style.background =gen_textBackColor;
}
}

}
//////////////Call when user change the month or year on calender ////////////////////////////////////////
function pan_mon_year_change(mode)
{
var pan_arg,pan_dt,pan_temp_mon_value,pan_temp_year_value;
var pan_temp_dt=new Date();
var pan_temp_str;
pan_temp_str=document.getElementById(TextBox_Name).value;
    if(!(pan_temp_str=="" || pan_temp_str==null))
    {
    pan_temp_mon_value=parseFloat(get_Sel_Index_Mon())-1;
    pan_temp_year_value=get_Sel_Index_Year();
    pan_temp_dt.setDate(parseFloat(document.getElementById(TextBox_Name).value.substr(0,2)));
    pan_temp_dt.setMonth(pan_temp_mon_value); 
    pan_temp_dt.setFullYear(pan_temp_year_value); 
    setDates(pan_temp_dt);
    pan_arg=parseFloat(document.getElementById(TextBox_Name).value.substr(0,2));
        if (parseFloat(pan_arg) <= 9)
        {
            pan_arg="0" + pan_arg;
        }
        //Disp_Date_Restore(document.getElementById(TextBox_Name).value.substr(0,2));
        pan_dt=pan_arg +"/"+getMonthName(get_Sel_Index_Mon())+"/"+get_Sel_Index_Year();
        document.getElementById(TextBox_Name).setAttribute("value",pan_dt);  
   document.getElementById("pankaj").innerHTML=Return_Calender_Table();
   Disp_Date(pan_temp_str);
   document.getElementById("pankaj_year").value=pan_temp_year_value;
   document.getElementById("pankaj_mon").options[parseFloat(pan_temp_mon_value)].selected=true;
 
   }
   else
   {
    pan_temp_mon_value=parseFloat(get_Sel_Index_Mon())-1;
    pan_temp_year_value=get_Sel_Index_Year();
    pan_temp_dt.setDate(10);
    pan_temp_dt.setMonth(pan_temp_mon_value); 
    pan_temp_dt.setFullYear(pan_temp_year_value); 
    setDates(pan_temp_dt);
    pan_arg=parseFloat(document.getElementById(TextBox_Name).value.substr(0,2));
        if (parseFloat(pan_arg) <= 9)
        {
            pan_arg="0" + pan_arg;
        }
        //Disp_Date_Restore(document.getElementById(TextBox_Name).value.substr(0,2));
        pan_dt=pan_arg +"/"+getMonthName(get_Sel_Index_Mon())+"/"+get_Sel_Index_Year();
        //document.getElementById(TextBox_Name).setAttribute("value",pan_dt);  
   document.getElementById("pankaj").innerHTML=Return_Calender_Table();
   //alert(pan_temp_mon_value);
   document.getElementById("pankaj_year").value=pan_temp_year_value;
   document.getElementById("pankaj_mon").options[parseFloat(pan_temp_mon_value)].selected=true;
   }
   if(parseFloat(mode)==1)
   {
    document.getElementById("pankaj_mon").focus();
   }
   else
   {
    document.getElementById("pankaj_year").focus();
   }
   
}

/////////// CHNAGE COMBOBOX PROPERTIES
function change_combo_properties(pan_arg)
{
    var pan_special,pan_tmp,pan_start,pan_end,pan_code,pan_final;
    pan_code=document.getElementById(pan_arg.substring(8,pan_arg.length)).attributes.item("onchange").nodeValue;  
    pan_special=document.getElementById(pan_arg).innerHTML;
    pan_start=pan_special.indexOf('onchange');
    pan_end=pan_special.indexOf('0)"');
    pan_final=pan_special.substring(0,pan_start) + ' onBlur="' + pan_code + '" ' + pan_special.substring(parseFloat(pan_end)+3,pan_start.length);
    document.getElementById(pan_arg).innerHTML=pan_final;
}