<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.*" %>

<html>
<head>
      <meta http-equiv="refresh" content="8;url=Display.jsp" />
<style>
       
</style>
</head>
<body>

<%
String root1=(String)request.getParameter("file1");
java.io.File file;
String Filepath;
int f=1;
java.io.File dir1 = new java.io.File(root1);
ArrayList<String> function1 = new ArrayList<String>();
ArrayList<String> parameter1 = new ArrayList<String>();
ArrayList<String> variable1 = new ArrayList<String>();
ArrayList<String> class1 = new ArrayList<String>();
String[] list = dir1.list();
String language;
boolean c1;ArrayList<String> support_class1 = new ArrayList<String>();

c1=list[0].indexOf(".") !=-1? true: false;
if(c1 == true)
{
int mi = list[0].indexOf(".");
int e = list[0].length();
language=list[0].substring(mi+1,e);
}

if (list.length > 0) {
for (int i = 0; i < list.length; i++) {
String file1="\\"+list[i];
file = new java.io.File(root1+file1);


read(out,file.toString(),f,function1,variable1,parameter1,support_class1);
c1=list[i].indexOf(".") !=-1? true: false;
if(c1 == true)
{
int m = list[i].indexOf(".");
class1.add(list[i].substring(0,m));
}
}
}


String root2=(String)request.getParameter("file2");
java.io.File fi;
int f2=2;
String Fipath;
java.io.File dir2 = new java.io.File(root2);
ArrayList<String> function2 = new ArrayList<String>();
ArrayList<String> parameter2 = new ArrayList<String>();
ArrayList<String> variable2 = new ArrayList<String>();
ArrayList<String> class2 = new ArrayList<String>();
ArrayList<String> f1 = new ArrayList<String>();
ArrayList<String> f5 = new ArrayList<String>();
ArrayList<String> f0 = new ArrayList<String>();
ArrayList<String> support_class2 =new ArrayList<String>();
String language2="java";
boolean c2;
String[] li = dir2.list();

c2=li[0].indexOf(".") !=-1? true: false;
if(c2 == true)
{
int mi1 = li[0].indexOf(".");
int e1 = li[0].length();
language2=li[0].substring(mi1+1,e1);
}
if (list.length > 0) {
for (int i = 0; i < li.length; i++) {
String fi1="\\"+li[i];
fi = new java.io.File(root2+fi1);

c2=li[i].indexOf(".") !=-1? true: false;
if(c2 == true)
{
int m1 = li[i].indexOf(".");
class2.add(li[i].substring(0,m1));
}
read(out,fi.toString(),f2,function2,variable2,parameter2,support_class2);

}
}



compare(out,variable1,variable2,f5);%><br><br><br><%
compare1(out,function1,function2,parameter1,parameter2,f1);%><br><br><br><%
compareclass(out,class1,class2,f0);%><br><br><br><%


 session.setAttribute("Function1", function1.size());
 session.setAttribute("Function2", function2.size());
 session.setAttribute("variable1", variable1.size());
 session.setAttribute("variable2", variable2.size());
 session.setAttribute("class1", class1.size());
 session.setAttribute("class2", class2.size());
 session.setAttribute("language", language2);
 session.setAttribute("Commonclass", f0.size());
 session.setAttribute("common_variable", f5.size());
 session.setAttribute("common_function",f1.size() );
 session.setAttribute("support1",support_class1.size());
 session.setAttribute("support2",support_class2.size());
 out.print(support_class1.size());%><br><%
 out.print(support_class2.size());%><br><%
%>



<%!
void read(javax.servlet.jsp.JspWriter out,String filepath,int f,ArrayList<String> function,ArrayList<String> variable,ArrayList<String> parameter,ArrayList<String> support_class)
{

String info;

try
{
BufferedReader reader = new BufferedReader(new FileReader(filepath));
 StringBuilder sb = new StringBuilder();
 String line;
 while((line = reader.readLine())!= null)
{
sb.append(line+"\n");
function(out,line,f,function,variable,parameter);
support(out,line,support_class);
}
info = sb.toString();
}

catch(Exception e)
{
info =filepath;


}

}

%>

<%!
void support(javax.servlet.jsp.JspWriter out,String line,ArrayList<String> support_class)
{
try
{
boolean supportcheck1 = false;
boolean supportcheck2 = false;
supportcheck1=line.contains("import ");
supportcheck2=line.contains("package ");
if(supportcheck1 == true || supportcheck2==true)
support_class.add("yes");

}
catch(Exception e)
{

}
}
%>

<%!
void function(javax.servlet.jsp.JspWriter out,String line,int f,ArrayList<String> function,ArrayList<String> variable,ArrayList<String> parameterlist)
{

boolean check1 ;
boolean check2 ;
boolean check3 ;
int count = 0;
line = line.trim();

try{

check1=line.contains("(");
check2=line.contains(")");
check3=line.contains(";");
int last = line.indexOf("(");
int last2= line.indexOf(")");
int start = line.indexOf(" ");

if(check3 == false)
{
String l =line.substring(0,start);
if(start < last-2 && start>0 )
{
if(l.indexOf("else") == -1)
{
if(check1 == true && check2==true)
{
String name = line.substring(start+1,last);

function.add(name);
parameterlist.add(name);

if(last < last2-2)
{
String parameter = line.substring(last+1,last2);
int begin = 0;
int comma;

if(parameter.contains(",")){
while(true)
{

comma = parameter.indexOf(",",begin+1);
if(comma > -1)
{
count = count +1;
begin = comma;
}
else
{
break;
}
}
String c = String.valueOf(count+1);
parameterlist.add(c);
}

else
{
count = 1;
String c = String.valueOf(count);
parameterlist.add(c);
}
}

else{
count = 0;
String c = String.valueOf(count);
parameterlist.add(c);
}


}


}
}
}

else
{
variable(out,line,variable);
}

}
catch(Exception e)
{
check1 = false;
}

}
%>

<%!
void variable(javax.servlet.jsp.JspWriter out,String line,ArrayList<String> variable)
{

boolean check1;
boolean check2;
boolean check3;
boolean check4;
int middle=-1;
int middle2=-1;
String datatype;

try{
int start ;
check1 = line.indexOf("int") !=-1? true: false;
datatype = "int";
start = line.indexOf(datatype)+3;
if(check1 == false)
{
check1 = line.indexOf("String") !=-1? true: false;
datatype = "String";
start = line.indexOf(datatype)+6;
}
if(check1 == false)
{
check1 = line.indexOf("Double") !=-1? true: false;
datatype = "Double";
start = line.indexOf(datatype)+6;
}

check2 = line.contains(";");
check3 = line.contains("(");
check4 = line.contains(")");


if(check3 == false && check4 == false)
{
if(check1 == true && check2 == true)
{

int last = line.indexOf(";");
if(line.contains(",") == true)
{ 
middle = line.indexOf(",");

String v1 = line.substring(start+1 , middle);
if(v1.contains("="))
 v1 = v1.substring(0,v1.indexOf("="));
variable.add(v1);

while(true)
{
middle2 = line.indexOf(",",middle+1);

if(middle2 != -1)
{

String v2 = line.substring(middle+1 , middle2);

if(v2.contains("="))
 v2 = v2.substring(0,v2.indexOf("="));


variable.add(v2);

if(middle2 == -1)
 break;
else
 middle = middle2;

}

else
{
String v = line.substring(middle+1,last);
if(v.contains("="))
 v = v.substring(0,v.indexOf("="));
variable.add(v);
break;
}

}
}

else
{
String v = line.substring(start,last);
if(v.contains("="))
 v = v.substring(0,v.indexOf("="));
variable.add(v);
}

}
}


}
catch(Exception e)
{
check1 = false;
}


}
%>
<%!
void compareclass(javax.servlet.jsp.JspWriter out,ArrayList<String> class1,ArrayList<String> class2,ArrayList<String> f0)
{
try
{
String[] cl1 = new String[class1.size()];
String[] cl2 = new String[class2.size()];
boolean che1 = false;

 for (int i =0; i < class1.size(); i++) 
            cl1[i] = class1.get(i);

 for (int i =0; i < class2.size(); i++) 
            {cl2[i] = class2.get(i);}

for(int i = 0; i < cl1.length; i++)
{
for(int j = 0; j < cl2.length; j++)
{
if(cl1[i].equals(cl2[j]))
{
che1 = check_present(out,f0,cl1[i]);
if(che1 == false)
f0.add(cl1[i]);
}
}
}





}
catch(Exception e)
{

}
}
%>

<%!

void compare(javax.servlet.jsp.JspWriter out,ArrayList<String> variable1,ArrayList<String> variable2,ArrayList<String> f)
{
try
{

String[] va1 = new String[variable1.size()];
String[] va2 = new String[variable2.size()];
boolean che2 = false;

 for (int i =0; i < variable1.size(); i++) 
            va1[i] = variable1.get(i);

 for (int i =0; i < variable2.size(); i++) 
            {va2[i] = variable2.get(i);}

for(int i = 0; i < va1.length; i++)
{
for(int j = 0; j < va2.length; j++)
{
if(va1[i].equals(va2[j]))
{
che2 = check_present(out,f,va1[i]);
if(che2 == false)
f.add(va1[i]);
}
}
}


}
catch(Exception e)
{

}
}
%>

<%!
void compare1(javax.servlet.jsp.JspWriter out,ArrayList<String> function1,ArrayList<String> function2,ArrayList<String> parameter1,ArrayList<String> parameter2,ArrayList<String> f1)
{
try
{ 

String[] pa1 = new String[parameter1.size()];
String[] pa2 = new String[parameter2.size()];
String[] fu1 = new String[function1.size()];
String[] fu2 = new String[function2.size()];
boolean che3 = false;

 for (int i =0; i < parameter1.size(); i++) 
        {    pa1[i] = parameter1.get(i);}

 for (int i =0; i < parameter2.size(); i++) 
            pa2[i] = parameter2.get(i);

 for (int i =0; i < function1.size(); i++) 
            fu1[i] = function1.get(i);

 for (int i =0; i < function2.size(); i++) 
            fu2[i] = function2.get(i);


for(int i = 0; i < function1.size(); i++)
{
for(int j = 0; j < function2.size(); j++)
{
if(fu1[i].equals(fu2[j]))
{
if(pa1[(2*i)+1].equals(pa2[(2*j)+1]))
{
che3 = check_present(out,f1,fu1[i]);
if(che3 == false)
f1.add(fu1[i]);
}
}
}
}

 


}
catch(Exception e)
{

}


}

%>

<%!
boolean check_present(javax.servlet.jsp.JspWriter out,ArrayList<String> f,String str)
{
try{
String[] temp = new String[f.size()];


 for (int i =0; i < f.size(); i++) 
            temp[i] = f.get(i);


for (int i = 0; i < temp.length; i++) 
{
if(temp[i].equals(str))
{return true;}
}
return false;
}

catch(Exception e)
{
return false;
}
}

%>


</ul>

<center>

<div class="loader"></div>
</div>
</body>
</html>