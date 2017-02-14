package bestflight;
public class Order {
    private String uid;
    private String ticketId;//unique key
    private String name;
    private String email;
    private String creditcard;
    private String address;
    private String date;
    private String price;
    public Order(String uid, String ticketId, String name, String email, String creditcard, String address, String date, String price) {
        this.uid = uid;

        this.ticketId = ticketId;
        this.name = name;
        this.email = email;
        this.creditcard = creditcard;
        this.address = address;
        this.date = date;
        this.price = price;
    }
    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getTicketId() {
        return ticketId;
    }

    public void setTicketId(String ticketId) {
        this.ticketId = ticketId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCreditcard() {
        return creditcard;
    }

    public void setCreditcard(String creditcard) {
        this.creditcard = creditcard;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

}
