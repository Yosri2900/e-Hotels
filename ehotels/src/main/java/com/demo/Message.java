package com.demo;

public class Message {
    public String type;
    public String value;

    /**
     * @param type  type of message
     * @param value value of message
     */
    public Message(String type, String value) {
        this.type = type;
        this.value = value;
    }

    public String getType() {
        return type;
    }

    public String getValue() {
        return value;
    }

    @Override
    public String toString() {
        return "Message{" +
                "type='" + type + '\'' +
                ", value='" + value + '\'' +
                '}';
    }
}
