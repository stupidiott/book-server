package com.mypack.book.dto.account;

import lombok.Data;

import java.io.Serializable;

@Data
public class AccountResetPasswordDTO implements Serializable {


    private static final long serialVersionUID = 5997033754985300662L;
    private Integer id;
    private String password;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
