package fileXML;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Iterator;
import java.util.List;



import org.jdom.Attribute; // propiedas de las etiquetas
import org.jdom.Document; // contener archivos xml en memoria
import org.jdom.Element;  // esto se refiere a la etiquetas
import org.jdom.JDOMException; // exception generica para cualquier error al procesar xml
import org.jdom.input.SAXBuilder; // parser para construir documentos xml en memoria
import org.jdom.output.XMLOutputter; // es la salidad estandar para xml's en jdmon 


public class TestXML{
	TestXML(){}

	public String CrearArchivoXML(String  ParametroCurp, String  ParametroRfc, String ParametroNombre, String RutaSalida) throws FileNotFoundException 
	{
	String EstructuraXML="";
	XMLOutputter serializer  = new XMLOutputter();
	
	FileOutputStream out =new FileOutputStream(RutaSalida);
	Element EtiquetaTrabajador;
	Element EtiquetaId_Trab;
		Element EtiquetaCurp; 
		Element EtiquetaReferencia;
		Element EtiquetaNombre;
		EtiquetaTrabajador = new Element("Trabajador");
        EtiquetaTrabajador.setAttribute("VersionArchivo","1.0");
        	EtiquetaId_Trab = new Element("IdTrabajador");
        	EtiquetaId_Trab.setAttribute("Id","1.0"); 
        		EtiquetaCurp = new Element("Curp");
        		EtiquetaCurp.setText(ParametroCurp);
        		EtiquetaReferencia = new Element("RFC");
        		EtiquetaReferencia.setText(ParametroRfc);
        		EtiquetaNombre = new Element("Nombre");
        		EtiquetaNombre.setText(ParametroNombre);
        	EtiquetaId_Trab.addContent(EtiquetaCurp);
        	EtiquetaId_Trab.addContent(EtiquetaReferencia);
        	EtiquetaId_Trab.addContent(EtiquetaNombre);
		EtiquetaTrabajador.addContent(EtiquetaId_Trab);
		
		
	    Document doc = new Document(EtiquetaTrabajador);
	    
	    
	    
	    System.out.println("Nombre etiqueta raiz: "+doc.getRootElement().getName());
	    Writer wr=new StringWriter( );
	    try {
	    	serializer.output(doc,out);
			serializer.output(doc,wr);
			EstructuraXML=wr.toString();
			System.out.println(EstructuraXML);
			
			
			
			out.close();
	   } catch (IOException e) {
			e.printStackTrace();
		}        
	   
		System.out.println("CadenaXML: "+EstructuraXML);

	return EstructuraXML; 
	}
	

	public String[] ProcesaArchivoXML(String ruta) throws JDOMException, IOException {
		SAXBuilder builder = new SAXBuilder();
		builder.setValidation(false); // se activa la validacion con la dtd
		Document doc=null; 
		doc = builder.build(ruta);

		System.out.println("Documento validado correctamente");
	    
		
	    String parametros_db[] = null;
        Element eRaiz = doc.getRootElement();
        
        System.out.println();
        if (eRaiz.getChildren().size() > 0) {
            parametros_db = new String[eRaiz.getChild("IdTrabajador").getChildren().size()];
            parametros_db[0] = eRaiz.getChild("IdTrabajador").getChildText("Nombre");
            parametros_db[1] = eRaiz.getChild("IdTrabajador").getChildText("RFC");
            parametros_db[2] = eRaiz.getChild("IdTrabajador").getChildText("Curp");
            System.out.println("Nombre: "+parametros_db[0]);
            System.out.println("RFC: "+parametros_db[1]);
            System.out.println("Curp"+parametros_db[2]);
            
            System.out.println("LEYENDO XML: "+parametros_db[0]);
            eRaiz = null;
        }
        return parametros_db;
    }
	
	static public void main(String a[]) throws JDOMException, IOException{
		try {
			new TestXML().CrearArchivoXML("GSLM850525HDFB", "GSLM850525HDI", "Gerardo Cruz ", "./empleado.xml");
			System.out.println("Archivo XML creado exitosamente");
			}catch (FileNotFoundException e) {
				System.out.println("No se encontro el archivo");
				e.printStackTrace();
			}
			new TestXML().ProcesaArchivoXML("./empleado.xml");
	}
}