/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cluster;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author sam
 */
public class SplitFiles {
    
     private File file;
    
    private List<String> listLines;
    
    public SplitFiles(String strfile) throws FileNotFoundException, IOException{
        file = new File(strfile);
        listLines = new ArrayList();
        
        BufferedReader br = new BufferedReader( new FileReader(file) );
        String linea = br.readLine();
        while( linea != null){
            listLines.add(linea);
            linea = br.readLine();
        }
    }
    
    public void split(int npartes) throws IOException{
        if( !listLines.isEmpty() ){
            if( npartes <= listLines.size() ){
                int linesForFile = (int) (listLines.size() / npartes);
                int k = 1; //numero de archivos
                    
                
                String strcontent = "";
                for(int i = 0; i < listLines.size(); i++ ){
                    strcontent += listLines.get(i) + "\n";
                    
                    if( i == linesForFile * k){ //guardar archivo
                        String strname = k + "_" + file.getName();
                        saveFile(strname, strcontent);
                        k++;
                        strcontent = "";
                    }
                }
                
            }else{
                throw new 
                        IllegalArgumentException
                        ("No se puede dividir archivo en más partes que líneas que tiene");
            }
        }
    }
    
    private void saveFile(String filename, String content) throws IOException{
        File newfile = new File(filename);
        newfile.delete();
        newfile.createNewFile();
        
        FileWriter fw = new FileWriter( newfile );
        fw.write(content);
        
        fw.close();
    }

    
}
