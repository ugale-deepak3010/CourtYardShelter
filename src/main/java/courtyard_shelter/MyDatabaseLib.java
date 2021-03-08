package courtyard_shelter;
import java.sql.*;

public class MyDatabaseLib {
    public static int connections=0;
    public static boolean already_connected=false;
    Connection cn;
    Statement stmt;
    ResultSet rs;
    public boolean connectionState;
    /* not necessory to set final */

/********* credentials *****/
    String Host="ec2-3-216-129-140.compute-1.amazonaws.com";
    String Database="d17a0e9lea0p1j";
    String User="wueiscumclylbi";
    String Port="5432";

    final String host="jdbc:postgresql://"+Host+":"+Port+"/"+Database+"?sslmode=require";         /*"jdbc:mysql://localhost:3306/advance_java";//only postgresql for sslmode require*/
    final String user="wueiscumclylbi";
    final String pwd="0e423a81ee741304d70540eb45b2de2b6fd947d56717cb6583b579f260d5910b";
/****************************/

    String errorDisp="";
    String space="<br>";
    StringBuilder sb1 = new StringBuilder();
    
    public MyDatabaseLib(){
        try{

        //if(already_connected==false){
        this.connectionState=this.getConnection(this.host,this.user,this.pwd);
        connections++;
       // }

        }catch(Exception e){
        errorDisp=errorDisp+e.getMessage();
        }
    }
    
    public boolean getConnection(String host,String user,String pwd){
        try{
           // Class.forName("com.mysql.jdbc.Driver");
            Class.forName("org.postgresql.Driver");
            this.cn=DriverManager.getConnection(host,user,pwd);
            this.connectionState=true;
            this.already_connected=true;
        }catch(Exception e){
            this.connectionState=false;
            errorDisp=errorDisp+e.getMessage();
           
        }
        return this.connectionState;
    }
    
    public boolean getConnectionStatus(){
        return this.connectionState;
    }
    
    public ResultSet executorSelect(String sql){
        try{
            this.stmt=this.cn.createStatement();
            this.rs=this.stmt.executeQuery(sql);
        }catch(Exception e){
            errorDisp=errorDisp+e.getMessage();
        }
        return this.rs;
    }
    
    public void executorUpdate(String sql){
        try{
            this.stmt=this.cn.createStatement();
            this.stmt.execute(sql);
        }catch(Exception e){
            errorDisp=errorDisp+e.getMessage();
        }
    }
    
    public boolean closeConnection(){
        try{
            this.cn.close();
            if(this.connectionState==true)
            connections--;  //not need already_connected because.. 
            this.connectionState=false;
        }catch(Exception e){
            this.connectionState=true;
            errorDisp=errorDisp+e.getMessage();
        }
        return this.connectionState;
    }
    
    public String generatePrimaryKey(String tableName,String attrName){
        String attrVal="";
        String sql="SELECT MAX ("+attrName+") +1 FROM "+tableName+"";
        try{
            this.stmt=this.cn.createStatement();
            this.rs=this.stmt.executeQuery(sql);
            while(rs.next()){
                attrVal=rs.getString(1);
            }
        }catch(Exception e){
            errorDisp=errorDisp+e.getMessage();
        }
        return attrVal;
    }
    
    public String errorDisplay(){
        return this.errorDisp;
    }

}

