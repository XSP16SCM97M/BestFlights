package bestflight;
public class Ticket {
    private  String id;
    private  String duration;
    private  String flightNum;
    private  String flightCarrier;
    private  String aircraft;
    private  String arrivalTime;
    private  String departTime;
    private  String To;
    private  String From;
    private  String Price;
    public Ticket() {
    }
    public Ticket(String id, String duration, String flightNum, String flightCarrier, String aircraft, String arrivalTime, String departTime, String to, String from, String price) {
        this.id = id;
        this.duration = duration;
        this.flightNum = flightNum;
        this.flightCarrier = flightCarrier;
        this.aircraft = aircraft;
        this.arrivalTime = arrivalTime;
        this.departTime = departTime;
        To = to;
        From = from;
        Price = price;
    }
    public void setId(String id) {

        this.id = id;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public void setFlightNum(String flightNum) {
        this.flightNum = flightNum;
    }

    public void setFlightCarrier(String flightCarrier) {
        this.flightCarrier = flightCarrier;
    }

    public void setAircraft(String aircraft) {
        this.aircraft = aircraft;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public void setDepartTime(String departTime) {
        this.departTime = departTime;
    }

    public void setTo(String to) {
        To = to;
    }

    public void setFrom(String from) {
        From = from;
    }

    public void setPrice(String price) {
        Price = price;
    }

    public String getId() {

        return id;
    }

    public String getDuration() {
        return duration;
    }

    public String getFlightNum() {
        return flightNum;
    }

    public String getFlightCarrier() {
        return flightCarrier;
    }

    public String getAircraft() {
        return aircraft;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public String getDepartTime() {
        return departTime;
    }

    public String getTo() {
        return To;
    }

    public String getFrom() {
        return From;
    }

    public String getPrice() {
        return Price;
    }
}
