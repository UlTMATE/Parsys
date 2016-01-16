package beans;

/**
 *
 * @author ultmate
 */
public class Parcel {
    
    private String sender, sentFor, description;
    private long senderMobile, recMobile;
    
    public Parcel(String sender, Long senderMobile, String sentFor, Long recMobile, String description) {
        this.sender = sender;
        this.senderMobile = senderMobile;
        this.sentFor = sentFor;
        this.recMobile = recMobile;
        this.description = description;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getSent_for() {
        return sentFor;
    }

    public void setSent_for(String sent_for) {
        this.sentFor = sent_for;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public long getSenderMobile() {
        return senderMobile;
    }

    public void setSenderMobile(long senderMobile) {
        this.senderMobile = senderMobile;
    }

    public long getRecMobile() {
        return recMobile;
    }

    public void setRecMobile(long recMobile) {
        this.recMobile = recMobile;
    }
}
