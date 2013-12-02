var xmlhttp;

function crearec(curp,idpac,idcita,iddoc,nomdoc,datepicker,med,textarea){
	alert("Creando receta...");
	xmlhttp = GetXmlHttpObject();
	
	if(xmlhttp==null){
		alert("Tu explorador es una basura");
		return;
	}
	
	var url = "addrec.jsp";
	url = url+"?curp="+curp+"&idpac="+idpac+"&idcita="+idcita+"&iddoc="+iddoc+"&doc="+nomdoc+"&datepicker="+datepicker+"&med="+med+"&desc="+textarea;
	xmlhttp.onreadystatechange = genrec;
	xmlhttp.open("POST",url,true);
	xmlhttp.send(null);
}


function creacita(nompac,fecha,unidadatencion){
	alert("creando cita");
	xmlhttp = GetXmlHttpObject();
	
	if(xmlhttp==null){
		alert("Tu explorador es una basura");
		return;
	}
	
	var url = "addcita.jsp";
	url = url+"?nompac="+nompac+"&fecha="+fecha+"&unidadatencion="+unidadatencion;
	xmlhttp.onreadystatechange = gencita;
	xmlhttp.open("POST",url,true);
	xmlhttp.send(null);
}
function loadContent(tratamientos,notas_hosp,notas_quirur,interconsultas,repo_radiolog,exa_lab,notas_ambulatorias,id_paciente)
{

 xmlhttp=GetXmlHttpObject();

  if (xmlhttp==null)
  {
   alert ("Tu explorador es una basura");
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
  if (xmlhttp.readyState==4 || xmlhttpd.readyState==4 || xmlhttpc.readyState==4)
  {
  document.getElementById("prtCnt").innerHTML=xmlhttp.responseText;
  }
}

function gencita()
{
  if (xmlhttp.readyState==4)
  {
  document.getElementById("gencita").innerHTML=xmlhttp.responseText;
  }
}

function genrec()
{
  if (xmlhttp.readyState==4)
  {
  document.getElementById("genrec").innerHTML=xmlhttp.responseText;
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