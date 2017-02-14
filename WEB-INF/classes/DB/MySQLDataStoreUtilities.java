package DB;

import bestflight.*;
import java.sql.*;
import java.util.*;


public class MySQLDataStoreUtilities {

    Connection conn = null;
    public void getConnection() {
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bestflight_database","root","root");
            System.out.println("MysqlDB connected!");
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public  void insertTicket(String id, String duration, String flightNum,
                              String flightCarrier, String aircraft, String arrivalTime,
                              String departTime, String to, String from, String price){
        try{
            // Class.forName("com.mysql.jdbc.Driver").newInstance();
            String insertTicket;
           // INSERT INTO `bestflight_database`.`tickets` (``, ``, ``, ``, ``, ``, ``, ``, ``, ``) VALUES ('s', 's', 's', 's', 's', 's', 's', 's', 's', 's');

            //conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bestdeal_database","root","root");
            insertTicket = "INSERT  INTO tickets(id,duration,flightNum,flightCarrier,aircraft,arrivalTime,departTime,flyTo,flyFrom,price) " +
                    "VALUES (?,?,?,?,?,?,?,?,?,?) " +
                    " ON DUPLICATE KEY UPDATE  id=\""+id+"\" ;";
            PreparedStatement pst =  conn.prepareStatement(insertTicket);
            pst.setString(1,id);
            pst.setString(2,duration);
            pst.setString(3,flightNum);
            pst.setString(4,flightCarrier);
            pst.setString(5,aircraft);
            pst.setString(6,arrivalTime);
            pst.setString(7,departTime);
            pst.setString(8,to);
            pst.setString(9,from);
            pst.setString(10,price);
            pst.execute();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

    public  HashMap selectUser() {
        HashMap<String, User> map = new HashMap<String, User>();
        Statement stmt = null;
        String query = "SELECT * FROM users;";

        try {
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                String uid= rs.getString("UID");
                String passwd= rs.getString("PASSWD");
                String type= rs.getString("TYPE");
                User user =new User(uid,passwd,type);
                map.put(uid,user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return map;
    }

    public  void insertUser(String username,String password,String usertype){
        try{
            // Class.forName("com.mysql.jdbc.Driver").newInstance();
            String insertUser;
            //conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bestdeal_database","root","root");
            insertUser = "INSERT INTO users(UID,PASSWD,TYPE) VALUES (?,?,?);";
            PreparedStatement pst =  conn.prepareStatement(insertUser);
            pst.setString(1,username);
            pst.setString(2,password);
            pst.setString(3,usertype);
            pst.execute();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

    public void deleteUser(String userName) {
        if(userName!=null && !userName.isEmpty()){
            try {
                String deleteStmnt="DELETE from users where UID = ?";
                PreparedStatement dps = this.conn.prepareStatement(deleteStmnt);
                dps.setString(1,userName);
                dps.execute();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void updateUser(User user){
        if(user !=null){
            User existingUser= (User) this.selectUser().get(user.getID());
            if(existingUser!=null){
                try{
                    PreparedStatement ups = this.conn.prepareStatement("UPDATE users SET PASSWD = ?,TYPE = ? WHERE UID = ?");
                    ups.setString(1,user.getPasswd());
                    ups.setString(2,user.getType());
                    ups.setString(3,user.getID());
                    ups.executeUpdate();
                }catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public  void insertOrder(String uid,String tid,String name,String email,String ccard,
                             String addr,String date,String price){
        try{
            String insertUser;
            insertUser = "INSERT INTO orders " +
                    "(uid,ticketid,name,email,creditcard,address,date,price)" +
                    "VALUES (?,?,?,?,?,?,?,?)" +
                    " ON DUPLICATE KEY UPDATE  ticketid=\""+tid+"\" ;";
            PreparedStatement pst =  conn.prepareStatement(insertUser);

            pst.setString(1,uid);
            pst.setString(2,tid);
            pst.setString(3,name);
            pst.setString(4,email);
            pst.setString(5,ccard);
            pst.setString(6,addr);
            pst.setString(7,date);
            pst.setString(8,price);
            pst.execute();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

    public  HashMap selectOrder() {
        HashMap<String, Order> map = new HashMap<String, Order>();
        Statement stmt = null;
        String query = "SELECT * FROM orders;";

        try {
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                String uid =rs.getString("uid");
                String ticketid =rs.getString("ticketid");
                String name=rs.getString("name");
                String email=rs.getString("email");
                String creditcard=rs.getString("creditcard");
                String address=rs.getString("address");
                String date=rs.getString("date");
                String price=rs.getString("price");
                String DATE=rs.getString("DATE");
                Order order =new Order(uid, ticketid, name, email, creditcard, address, date, price);
                System.out.println(ticketid+"asdasdsadsads");
                map.put(ticketid,order);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return map;
    }
    public List<Order> getOrder(){
        List<Order> orders = new ArrayList<>();
        try{
            PreparedStatement ps = this.conn.prepareStatement("select * from orders");
            ResultSet rs=ps.executeQuery();
            if(rs!=null){
                while(rs.next()){
                    Order order = new Order(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8));
                    orders.add(order);
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public void deleteOrder(String ticketId) {
        if(ticketId!=null && !ticketId.isEmpty()){
            try {
                String deleteStmnt="DELETE from orders where ticketid = ?";
                PreparedStatement dps = this.conn.prepareStatement(deleteStmnt);
                dps.setString(1,ticketId);
                dps.execute();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void updateOrder(Order order){
        if(order !=null){
            try{
                PreparedStatement ups = this.conn.prepareStatement("UPDATE orders SET UID = ?,NAME = ?,EMAIL = ?,CREDITCARD = ?,ADDRESS = ?, DATE = ? , PRICE = ? where ticketid = ?");
                ups.setString(1,order.getUid());
                ups.setString(8,order.getTicketId());
                ups.setString(2,order.getName());
                ups.setString(3,order.getEmail());
                ups.setString(4,order.getCreditcard());
                ups.setString(5,order.getAddress());
                ups.setString(6,order.getDate());
                ups.setString(7,order.getPrice());
                ups.executeUpdate();
            }catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public static void main(String args[]){
        MySQLDataStoreUtilities Mysql= new MySQLDataStoreUtilities();
        Mysql.getConnection();
        Mysql.insertTicket("a","a","a","a","a","a","a","aas","a","asas");
        Mysql.insertOrder("c","c","c","c","c","c","c","c");
        HashMap<String, Order> map = new HashMap<String, Order>();
        map=Mysql.selectOrder();



    }


}
