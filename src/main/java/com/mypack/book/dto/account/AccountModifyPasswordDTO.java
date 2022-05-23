package com.mypack.book.dto.account;

import lombok.Data;

import java.io.Serializable;

@Data
public class AccountModifyPasswordDTO implements Serializable {


    private static final long serialVersionUID = 4766725578010783832L;
    private Integer id;
    private String oldPassword;
    private String newPassword;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
}
