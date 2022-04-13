package com.mypack.book.dto.account;

import lombok.Data;

import java.io.Serializable;

@Data
public class AccountResetPasswordDTO implements Serializable {


    private static final long serialVersionUID = 5997033754985300662L;
    private Integer id;
    private String password;

}
