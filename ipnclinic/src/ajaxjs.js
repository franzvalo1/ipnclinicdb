var xmlhttp;
var xmlhttpd;
var xmlhttpc;

function creacita(nompac,fecha,unidadatencion){
	alert("creando cita");
	xmlhttpd = GetXmlHttpObject();
	
	if(xmlhttpd==null){
		alert("Tu explorador es una basura");
		return;
	}
	
	var url = "addcita.jsp";
	url = url+"?nompac="+nompac+"&fecha="+fecha+"&unidadatencion="+unidadatencion;
	xmlhttpd.onreadystatechange = getOutput;
	xmlhttpd.open("POST",url,true);
	xmlhttpd.send(null);
}

function crearec(curp,idpac,idcita,iddoc,iddoc,doc,datepicker,med){
	alert("Creando receta...");
	xmlhttpc = GetXmlHttpObject();
	
	if(xmlhttpc==null){
		alert("Tu explorador es una basura");
		return;
	}
	
	var url = "addrec.jsp";
	url = url+"?curp="+curp+"&idpac="+idpac+"&idcita="+idcita+"&iddoc="+iddoc+"&doc="+doc+"&datepicker="+datepicker+"?med="+med;
	xmlhttpc.onreadystatechange = getOutput;
	xmlhttpc.open("POST",url,true);
	xmlhttpc.send(null);
}

function loadContent(tratamientos,notas_hosp,notas_quirur,interconsultas,repo_radiolog,exa_lab,notas_ambulatorias,id_paciente)
{

 xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)
  {
   alert ("Your browser does not support Ajax HTTP");
   return;
  }

    var url="addexp.jsp";
    url=url+"?tratamientos="+tratamientos+"&notas_hosp="+notas_hosp+"&notas_quirur="+notas_quirur+"&interconsultas="+interconsultas+"&repo_radiolog="+repo_radiolog+"&exa_lab="+exa_lab+"&notas_ambulatorias="+notas_ambulatorias+"&id_paciente="+id_paciente;
    //alert(url);
    xmlhttp.onreadystatechange=getOutput;
    xmlhttp.open("POST",url,true);
    xmlhttp.send(null);
}

function getOutput()
{
  if (xmlhttp.readyState==4)
  {
  document.getElementById("prtCnt").innerHTML=xmlhttp.responseText;
  }
}

function GetXmlHttpObject()
{
    if (window.XMLHttpRequest)
    {
       return new XMLHttpRequest();
    }
    if (window.ActiveXObject)
    {
      return new ActiveXObject("Microsoft.XMLHTTP");
    }
 return null;
}