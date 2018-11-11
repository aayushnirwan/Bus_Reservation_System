import java.sql.DriverManager;
class DbConnect {

 public static void main(String args[]) {
 try{
  Class.forName("com.mysql.jdbc.Driver");
  DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","java");

 System.out.println("Database Connected");
}catch(Exception e){System.out.println(e);}

 }
}
