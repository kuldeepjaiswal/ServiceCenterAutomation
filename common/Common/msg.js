var stat;
pan_msg=document.createElement("div"); 
pan_msg.id="msg";
pan_msg.innerHTML="<div id='msg' style='z-index :1;position :absolute ; left: 0px; top: 0px; visibility:hidden'><TABLE WIDTH=200px BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD ROWSPAN=2><IMG SRC='Message/images/1_01.gif' WIDTH=80 HEIGHT=44 ALT=''></TD><TD style='height: 22px'></TD><TD ROWSPAN=2 style='width: 38px'><IMG SRC='Message/images/1_03.gif' WIDTH=20 HEIGHT=44 ALT=''></TD></TR><TR><TD background ='Message/images/1_04.gif' width ='100%' style='height: 11px'></TD></TR><TR><td colspan ='3'><table width ='100%' BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD style='width: 5'  background='Message/images/1_05.gif'></TD><TD></TD><TD style='width: 5' background='Message/images/1_07.gif' ></TD></TR></table></td></TR><TR><TD ><IMG SRC='Message/images/1_08.gif' WIDTH=80 HEIGHT=17 ALT=''></TD><TD background='Message/images/1_09.gif'></TD><TD ><IMG SRC='Message/images/1_10.gif' WIDTH=20 HEIGHT=17 ALT=''></TD></TR></TABLE></div>";
document.body.appendChild(pan_msg);
function show_Message(s,m,w)
{
var inner_data;
inner_data = "<div id='msg' style='z-index :1;position :absolute ; left: " + (event.clientX -50) + "px; top: " + event.clientY + "px; visibility:visible'><TABLE WIDTH=" + w +" BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD ROWSPAN=2><IMG SRC='Message/images/1_01.gif' WIDTH=80 HEIGHT=44 ALT=''></TD><TD style='height: 22px'></TD><TD ROWSPAN=2 style='width: 38px'><IMG SRC='Message/images/1_03.gif' WIDTH=20 HEIGHT=44 ALT=''></TD></TR><TR><TD background ='Message/images/1_04.gif' width ='100%' style='height: 11px'></TD></TR><TR><td colspan ='3'><table width ='100%' BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD style='width: 5'  background='Message/images/1_05.gif'></TD><TD style='background-color:white'>"
inner_data = inner_data + m;
inner_data = inner_data + "</TD><TD style='width: 5' background='Message/images/1_07.gif' ></TD></TR></table></td></TR><TR><TD ><IMG SRC='Message/images/1_08.gif' WIDTH=80 HEIGHT=17 ALT=''></TD><TD background='Message/images/1_09.gif'></TD><TD ><IMG SRC='Message/images/1_10.gif' WIDTH=20 HEIGHT=17 ALT=''></TD></TR></TABLE></div>";
document.getElementById("msg").innerHTML='<span style="color:red">' + inner_data + '</span>';
//window.setTimeout("hide_Message()",2000);
stat=0;
}
function hide_Message()
{
pan_msg.innerHTML="<div id='msg' style='z-index :1;position :absolute ; left: 0px; top: 0px; visibility:hidden'><TABLE WIDTH=242 BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD ROWSPAN=2><IMG SRC='Message/images/1_01.gif' WIDTH=80 HEIGHT=44 ALT=''></TD><TD style='height: 22px'></TD><TD ROWSPAN=2 style='width: 38px'><IMG SRC='Message/images/1_03.gif' WIDTH=20 HEIGHT=44 ALT=''></TD></TR><TR><TD background ='Message/images/1_04.gif' width ='100%' style='height: 11px'></TD></TR><TR><td colspan ='3'><table width ='100%' BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD style='width: 5'  background='Message/images/1_05.gif'></TD><TD></TD><TD style='width: 5' background='Message/images/1_07.gif' ></TD></TR></table></td></TR><TR><TD ><IMG SRC='Message/images/1_08.gif' WIDTH=80 HEIGHT=17 ALT=''></TD><TD background='Message/images/1_09.gif'></TD><TD ><IMG SRC='Message/images/1_10.gif' WIDTH=20 HEIGHT=17 ALT=''></TD></TR></TABLE></div>";
}
