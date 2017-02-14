import java.io.*;
import java.util.*;

import DB.MySQLDataStoreUtilities;
import bestflight.*;


import javax.swing.text.View;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpRequestInitializer;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.googleapis.javanet.*;

import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport.Builder;

import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.qpxExpress.QPXExpressRequestInitializer;
import com.google.api.services.qpxExpress.QPXExpress;
import com.google.api.services.qpxExpress.model.FlightInfo;
import com.google.api.services.qpxExpress.model.LegInfo;
import com.google.api.services.qpxExpress.model.PassengerCounts;
import com.google.api.services.qpxExpress.model.PricingInfo;
import com.google.api.services.qpxExpress.model.SegmentInfo;
import com.google.api.services.qpxExpress.model.SliceInfo;
import com.google.api.services.qpxExpress.model.TripOption;
import com.google.api.services.qpxExpress.model.TripOptionsRequest;
import com.google.api.services.qpxExpress.model.TripsSearchRequest;
import com.google.api.services.qpxExpress.model.SliceInput;
import com.google.api.services.qpxExpress.model.TripsSearchResponse;

public class AirlineReservation {

    private static final String APPLICATION_NAME = "Bestflight";

    private static final String API_KEY = "AIzaSyCZ9Lu0elDRK3N6CQVRGcIKb2tTQgdhQ1c";
    //AIzaSyCZ9Lu0elDRK3N6CQVRGcIKb2tTQgdhQ1c//hao
    /** Global instance of the HTTP transport. */
    private static HttpTransport httpTransport;

    /** Global instance of the JSON factory. */
    private static  JacksonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();


    public static void main(String[] args) {
       // ArrayList<Ticket> tks=AirlineReservation.get();
        //System.out.println(tks.size());
    }
    public static ArrayList<Ticket> get(String to,String from,String date) {
        ArrayList<Ticket> tks = new ArrayList<Ticket>();
        try {
            httpTransport = GoogleNetHttpTransport.newTrustedTransport();
            PassengerCounts passengers= new PassengerCounts();
            passengers.setAdultCount(1);

            List<SliceInput> slices = new ArrayList<SliceInput>();

            SliceInput slice = new SliceInput();
            slice.setOrigin(to);
            slice.setDestination(from);
            slice.setDate(date);
            slice.setMaxStops(0);
            slices.add(slice);

            TripOptionsRequest request= new TripOptionsRequest();
            request.setSolutions(3);
            request.setPassengers(passengers);
            request.setSlice(slices);
            TripsSearchRequest parameters = new TripsSearchRequest();
            parameters.setRequest(request);
            QPXExpress qpXExpress= new QPXExpress.Builder(httpTransport, JSON_FACTORY, null).setApplicationName(APPLICATION_NAME)
                    .setGoogleClientRequestInitializer(new QPXExpressRequestInitializer(API_KEY)).build();

            TripsSearchResponse list= qpXExpress.trips().search(parameters).execute();
            List<TripOption> tripResults=list.getTrips().getTripOption();

            String id;
            Ticket t=new Ticket();

            for(int i=0; i<tripResults.size(); i++){
                System.out.println("begin::");
                //Trip Option ID
                id= tripResults.get(i).getId();
                System.out.println("id "+id);
                t.setId(id);

                //Slice
                List<SliceInfo> sliceInfo= tripResults.get(i).getSlice();
                for(int j=0; j<sliceInfo.size(); j++){
                    int duration= sliceInfo.get(j).getDuration();
                    System.out.println("duration "+duration);
                        t.setDuration(String.valueOf(duration));
                    List<SegmentInfo> segInfo= sliceInfo.get(j).getSegment();
                    for(int k=0; k<segInfo.size(); k++){
                        String bookingCode= segInfo.get(k).getBookingCode();
                        System.out.println("bookingCode "+bookingCode);
                        FlightInfo flightInfo=segInfo.get(k).getFlight();
                        String flightNum= flightInfo.getNumber();
                        System.out.println("flightNum "+flightNum);
                            t.setFlightNum(flightNum);
                        String flightCarrier= flightInfo.getCarrier();
                        System.out.println("flightCarrier "+flightCarrier);
                            t.setFlightCarrier(flightCarrier);
                        List<LegInfo> leg=segInfo.get(k).getLeg();
                        for(int l=0; l<leg.size(); l++){
                            String aircraft= leg.get(l).getAircraft();
                            System.out.println("aircraft "+aircraft);
                                t.setAircraft(aircraft);
                            String arrivalTime= leg.get(l).getArrivalTime();
                            System.out.println("arrivalTime "+arrivalTime);
                                t.setArrivalTime(arrivalTime);
                            String departTime=leg.get(l).getDepartureTime();
                            System.out.println("departTime "+departTime);
                                t.setDepartTime(departTime);
                            String dest=leg.get(l).getDestination();
                            System.out.println("Destination "+dest);
                                t.setTo(dest);
                            String destTer= leg.get(l).getDestinationTerminal();
                            System.out.println("DestTer "+destTer);
                            String origin=leg.get(l).getOrigin();
                            System.out.println("origun "+origin);
                                t.setFrom(origin);
                            String originTer=leg.get(l).getOriginTerminal();
                            System.out.println("OriginTer "+originTer);
                            int durationLeg= leg.get(l).getDuration();
                            System.out.println("durationleg "+durationLeg);
                            int mil= leg.get(l).getMileage();
                            System.out.println("Milleage "+mil);
                            MySQLDataStoreUtilities Mysql= new MySQLDataStoreUtilities();
                            Mysql.getConnection();
                            Mysql.insertTicket(t.getId(),t.getDuration(),t.getFlightNum(),t.getFlightCarrier(),t.getAircraft(),t.getArrivalTime(),t.getDepartTime(),t.getTo(),t.getFrom(),t.getPrice());



                        }

                    }
                }

                //Pricing
                List<PricingInfo> priceInfo= tripResults.get(i).getPricing();
                for(int p=0; p<priceInfo.size(); p++){
                    String price= priceInfo.get(p).getSaleTotal();
                    System.out.println("Price "+price);
                    t.setPrice(price);
                    tks.add(t);
                    System.out.println("::end");

                }


            }
            return tks;
        } catch (IOException e) {
            System.err.println(e.getMessage());
        } catch (Throwable t) {
            t.printStackTrace();
        }
return tks;
    }

}