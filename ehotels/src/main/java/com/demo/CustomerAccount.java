package com.demo;

import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CustomerAccount {
    private String cEmail, cPwd;

    public CustomerAccount(String cEmail, String cPwd) {
        this.cEmail = cEmail;
        this.cPwd = cPwd;
    }

    public String getcEmail() {
        return cEmail;
    }
    public String getcPwd() {
        return cPwd;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CustomerAccount that = (CustomerAccount) o;
        return Objects.equals(cEmail, that.cEmail) && Objects.equals(cPwd, that.cPwd);
    }


}
