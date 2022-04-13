package com.mypack.book.dto.account.menu;

import lombok.Data;

import java.io.Serializable;

@Data
public class AccountMenuDTO implements Serializable{

    private static final long serialVersionUID = -7383211524804059380L;
    private Integer accountType;
    private String menu;
}
